-- ==============================================================================
-- Migration: 20261010000003_create_documentation_pages.sql
-- Feature: Documentation Pages & Storage Catalog (OP-03)
-- Description: Establishes documentation_category and documentation_layout enums,
--              public.documentation_pages base table, bilingual translation child table
--              public.documentation_page_translations, public.documentation_pages_view,
--              RLS policies, triggers, and provisions the 'documentation' storage bucket.
-- ==============================================================================

-- 1. Enums
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'documentation_category') THEN
        CREATE TYPE public.documentation_category AS ENUM (
            'presentation',
            'core_rules',
            'playable_characters',
            'equipment',
            'companions',
            'worldbuilding'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'documentation_layout') THEN
        CREATE TYPE public.documentation_layout AS ENUM (
            'documentation',
            'species',
            'origin',
            'path',
            'abilities'
        );
    END IF;
END $$;

-- 2. Base Documentation Pages Table
CREATE TABLE IF NOT EXISTS public.documentation_pages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT UNIQUE NOT NULL CHECK (char_length(slug) >= 2 AND char_length(slug) <= 120),
    category public.documentation_category NOT NULL,
    layout public.documentation_layout NOT NULL DEFAULT 'documentation',
    subcategory TEXT CHECK (subcategory IS NULL OR char_length(subcategory) <= 60),
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_doc_pages_category ON public.documentation_pages(category, sort_order);
CREATE INDEX IF NOT EXISTS idx_doc_pages_slug ON public.documentation_pages(slug);

-- 3. Localized Documentation Page Translations Table
CREATE TABLE IF NOT EXISTS public.documentation_page_translations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_id UUID NOT NULL REFERENCES public.documentation_pages(id) ON DELETE CASCADE,
    locale TEXT NOT NULL CHECK (locale IN ('pt-BR', 'en-US')) DEFAULT 'pt-BR',
    title TEXT NOT NULL CHECK (char_length(trim(title)) >= 1 AND char_length(title) <= 150),
    summary TEXT CHECK (summary IS NULL OR char_length(summary) <= 500),
    storage_path TEXT NOT NULL CHECK (char_length(trim(storage_path)) >= 1),
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_doc_page_locale UNIQUE (page_id, locale)
);

CREATE INDEX IF NOT EXISTS idx_doc_trans_page_id ON public.documentation_page_translations(page_id);
CREATE INDEX IF NOT EXISTS idx_doc_trans_locale ON public.documentation_page_translations(locale);

-- 4. Convenient Joined View for Client Queries
CREATE OR REPLACE VIEW public.documentation_pages_view AS
SELECT 
    dp.id,
    dp.slug,
    dp.category,
    dp.layout,
    dp.subcategory,
    dp.sort_order,
    dp.is_published,
    dpt.locale,
    dpt.title,
    dpt.summary,
    dpt.storage_path,
    dp.created_at,
    dp.updated_at
FROM public.documentation_pages dp
JOIN public.documentation_page_translations dpt ON dpt.page_id = dp.id;

-- 5. Row-Level Security (RLS)
ALTER TABLE public.documentation_pages ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.documentation_page_translations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read for published documentation pages"
    ON public.documentation_pages FOR SELECT
    TO anon, authenticated
    USING (is_published = true);

CREATE POLICY "Public read for published page translations"
    ON public.documentation_page_translations FOR SELECT
    TO anon, authenticated
    USING (EXISTS (
        SELECT 1 FROM public.documentation_pages dp
        WHERE dp.id = page_id AND dp.is_published = true
    ));

-- 6. Triggers for updated_at
DROP TRIGGER IF EXISTS on_doc_pages_updated ON public.documentation_pages;
CREATE TRIGGER on_doc_pages_updated
    BEFORE UPDATE ON public.documentation_pages
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_doc_trans_updated ON public.documentation_page_translations;
CREATE TRIGGER on_doc_trans_updated
    BEFORE UPDATE ON public.documentation_page_translations
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- 7. Supabase Storage Bucket Provisioning (documentation bucket)
INSERT INTO storage.buckets (id, name, public)
VALUES ('documentation', 'documentation', true)
ON CONFLICT (id) DO UPDATE SET public = true;

DROP POLICY IF EXISTS "Public read for documentation storage objects" ON storage.objects;
CREATE POLICY "Public read for documentation storage objects"
    ON storage.objects FOR SELECT
    TO anon, authenticated
    USING (bucket_id = 'documentation');
