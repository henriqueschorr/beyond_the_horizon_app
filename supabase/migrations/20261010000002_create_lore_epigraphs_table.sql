-- ==============================================================================
-- Migration: 20261010000002_create_lore_epigraphs_table.sql
-- Feature: Lore Epigraphs & Archival Transmissions Catalog (OP-02A)
-- Description: Establishes public.epigraph_type enum (sorted alphabetically:
--              document, news, poem, quote, transmission), base table public.lore_epigraphs,
--              bilingual child table public.lore_epigraph_translations, RLS policies,
--              triggers, and atomic stored function public.get_random_lore_epigraph.
-- ==============================================================================

-- 1. Enum: epigraph_type (alphabetically sorted)
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'epigraph_type') THEN
        CREATE TYPE public.epigraph_type AS ENUM (
            'document',
            'news',
            'poem',
            'quote',
            'transmission'
        );
    END IF;
END $$;

-- 2. Base Lore Epigraphs Table
CREATE TABLE IF NOT EXISTS public.lore_epigraphs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    type public.epigraph_type NOT NULL DEFAULT 'quote',
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

CREATE INDEX IF NOT EXISTS idx_lore_epigraphs_type ON public.lore_epigraphs(type);

-- 3. Localized Lore Epigraph Translations Table
CREATE TABLE IF NOT EXISTS public.lore_epigraph_translations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    epigraph_id UUID NOT NULL REFERENCES public.lore_epigraphs(id) ON DELETE CASCADE,
    locale TEXT NOT NULL CHECK (locale IN ('pt-BR', 'en-US')) DEFAULT 'pt-BR',
    content TEXT NOT NULL CHECK (char_length(content) >= 5 AND char_length(content) <= 1000),
    source TEXT NOT NULL CHECK (char_length(source) >= 1 AND char_length(source) <= 150),
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_lore_epigraph_locale UNIQUE (epigraph_id, locale)
);

CREATE INDEX IF NOT EXISTS idx_lore_trans_epigraph_id ON public.lore_epigraph_translations(epigraph_id);
CREATE INDEX IF NOT EXISTS idx_lore_trans_locale ON public.lore_epigraph_translations(locale);

-- 4. Triggers for updated_at
DROP TRIGGER IF EXISTS on_lore_epigraphs_updated ON public.lore_epigraphs;
CREATE TRIGGER on_lore_epigraphs_updated
    BEFORE UPDATE ON public.lore_epigraphs
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_lore_trans_updated ON public.lore_epigraph_translations;
CREATE TRIGGER on_lore_trans_updated
    BEFORE UPDATE ON public.lore_epigraph_translations
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- 5. Row-Level Security (RLS)
ALTER TABLE public.lore_epigraphs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lore_epigraph_translations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read for lore epigraphs"
    ON public.lore_epigraphs FOR SELECT
    TO anon, authenticated
    USING (true);

CREATE POLICY "Public read for epigraph translations"
    ON public.lore_epigraph_translations FOR SELECT
    TO anon, authenticated
    USING (true);

CREATE POLICY "Admin insert for lore epigraphs"
    ON public.lore_epigraphs FOR INSERT
    TO authenticated, service_role
    WITH CHECK ((auth.jwt() ->> 'role') = 'admin' OR auth.role() = 'service_role');

CREATE POLICY "Admin update for lore epigraphs"
    ON public.lore_epigraphs FOR UPDATE
    TO authenticated, service_role
    USING ((auth.jwt() ->> 'role') = 'admin' OR auth.role() = 'service_role');

CREATE POLICY "Admin delete for lore epigraphs"
    ON public.lore_epigraphs FOR DELETE
    TO authenticated, service_role
    USING ((auth.jwt() ->> 'role') = 'admin' OR auth.role() = 'service_role');

CREATE POLICY "Admin insert for epigraph translations"
    ON public.lore_epigraph_translations FOR INSERT
    TO authenticated, service_role
    WITH CHECK ((auth.jwt() ->> 'role') = 'admin' OR auth.role() = 'service_role');

CREATE POLICY "Admin update for epigraph translations"
    ON public.lore_epigraph_translations FOR UPDATE
    TO authenticated, service_role
    USING ((auth.jwt() ->> 'role') = 'admin' OR auth.role() = 'service_role');

CREATE POLICY "Admin delete for epigraph translations"
    ON public.lore_epigraph_translations FOR DELETE
    TO authenticated, service_role
    USING ((auth.jwt() ->> 'role') = 'admin' OR auth.role() = 'service_role');

-- 6. Stored Function: Atomic Random Lore Epigraph Selection
CREATE OR REPLACE FUNCTION public.get_random_lore_epigraph(p_locale TEXT DEFAULT 'pt-BR')
RETURNS TABLE (
    id UUID,
    type public.epigraph_type,
    content TEXT,
    source TEXT,
    locale TEXT
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
    SELECT 
        e.id,
        e.type,
        t.content,
        t.source,
        t.locale
    FROM public.lore_epigraphs e
    JOIN public.lore_epigraph_translations t ON t.epigraph_id = e.id
    WHERE t.locale = p_locale
    ORDER BY random()
    LIMIT 1;
$$;
