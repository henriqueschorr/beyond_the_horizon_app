-- ==============================================================================
-- Migration: 20261010000003_create_codex_pages.sql
-- Feature: Codex Pages, Translations & Navigation Index (OP-03)
-- Description: Establishes codex_category and codex_layout enums,
--              public.codex_pages base table, bilingual translation child table
--              public.codex_page_translations, dedicated Table of Contents table
--              public.codex_index, convenient view public.codex_pages_view,
--              RLS policies, triggers, and provisions the 'codex' storage bucket.
-- ==============================================================================

-- 1. Enums
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'codex_category') THEN
        CREATE TYPE public.codex_category AS ENUM (
            'guidebook',
            'core_rules',
            'combat',
            'equipment',
            'universe',
            'appendix'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'codex_layout') THEN
        CREATE TYPE public.codex_layout AS ENUM (
            'standard',
            'chapter',
            'appendix',
            'reference'
        );
    END IF;
END $$;

-- 2. Base Codex Pages Table
CREATE TABLE IF NOT EXISTS public.codex_pages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT UNIQUE NOT NULL CHECK (char_length(slug) >= 2 AND char_length(slug) <= 120),
    category public.codex_category NOT NULL DEFAULT 'guidebook',
    layout public.codex_layout NOT NULL DEFAULT 'standard',
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_codex_pages_category ON public.codex_pages(category);
CREATE INDEX IF NOT EXISTS idx_codex_pages_slug ON public.codex_pages(slug);

-- 3. Localized Codex Page Translations Table
CREATE TABLE IF NOT EXISTS public.codex_page_translations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_id UUID NOT NULL REFERENCES public.codex_pages(id) ON DELETE CASCADE,
    locale TEXT NOT NULL CHECK (locale IN ('pt-BR', 'en-US')) DEFAULT 'pt-BR',
    title TEXT NOT NULL CHECK (char_length(trim(title)) >= 1 AND char_length(title) <= 150),
    summary TEXT CHECK (summary IS NULL OR char_length(summary) <= 500),
    storage_path TEXT NOT NULL CHECK (char_length(trim(storage_path)) >= 1),
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_codex_page_locale UNIQUE (page_id, locale)
);

CREATE INDEX IF NOT EXISTS idx_codex_trans_page_id ON public.codex_page_translations(page_id);
CREATE INDEX IF NOT EXISTS idx_codex_trans_locale ON public.codex_page_translations(locale);

-- 4. Dedicated Table of Contents (TOC) Index Table
CREATE TABLE IF NOT EXISTS public.codex_index (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    parent_id UUID REFERENCES public.codex_index(id) ON DELETE CASCADE,
    page_id UUID REFERENCES public.codex_pages(id) ON DELETE SET NULL,
    position INTEGER NOT NULL DEFAULT 0,
    title_override TEXT CHECK (title_override IS NULL OR char_length(trim(title_override)) >= 1),
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_codex_index_parent ON public.codex_index(parent_id, position);
CREATE INDEX IF NOT EXISTS idx_codex_index_page_id ON public.codex_index(page_id);

-- 5. Convenient Joined View for Client Queries
CREATE OR REPLACE VIEW public.codex_pages_view AS
SELECT 
    cp.id,
    cp.slug,
    cp.category,
    cp.layout,
    cp.is_published,
    cpt.locale,
    cpt.title,
    cpt.summary,
    cpt.storage_path,
    cp.created_at,
    cp.updated_at
FROM public.codex_pages cp
JOIN public.codex_page_translations cpt ON cpt.page_id = cp.id;

-- 6. Row-Level Security (RLS)
ALTER TABLE public.codex_pages ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.codex_page_translations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.codex_index ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read for published codex pages"
    ON public.codex_pages FOR SELECT
    TO anon, authenticated
    USING (is_published = true);

CREATE POLICY "Public read for published page translations"
    ON public.codex_page_translations FOR SELECT
    TO anon, authenticated
    USING (EXISTS (
        SELECT 1 FROM public.codex_pages cp
        WHERE cp.id = page_id AND cp.is_published = true
    ));

CREATE POLICY "Public read for codex index"
    ON public.codex_index FOR SELECT
    TO anon, authenticated
    USING (true);

-- 7. Triggers for updated_at
DROP TRIGGER IF EXISTS on_codex_pages_updated ON public.codex_pages;
CREATE TRIGGER on_codex_pages_updated
    BEFORE UPDATE ON public.codex_pages
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_codex_trans_updated ON public.codex_page_translations;
CREATE TRIGGER on_codex_trans_updated
    BEFORE UPDATE ON public.codex_page_translations
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_codex_index_updated ON public.codex_index;
CREATE TRIGGER on_codex_index_updated
    BEFORE UPDATE ON public.codex_index
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- 8. Supabase Storage Bucket Provisioning ('codex' bucket)
INSERT INTO storage.buckets (id, name, public)
VALUES ('codex', 'codex', true)
ON CONFLICT (id) DO UPDATE SET public = true;

DROP POLICY IF EXISTS "Public read for codex storage objects" ON storage.objects;
CREATE POLICY "Public read for codex storage objects"
    ON storage.objects FOR SELECT
    TO anon, authenticated
    USING (bucket_id = 'codex');
