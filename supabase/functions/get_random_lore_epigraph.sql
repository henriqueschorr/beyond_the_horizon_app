-- ==============================================================================
-- Function: get_random_lore_epigraph.sql
-- Feature: Lore Epigraphs & Archival Transmissions Catalog (OP-02A)
-- Description: Server-side stored procedure returning a single randomized active
--              lore epigraph record matching the requested locale and optional type,
--              with automatic fallback to pt-BR for unseeded locales.
-- ==============================================================================

CREATE OR REPLACE FUNCTION public.get_random_lore_epigraph(
    p_locale TEXT DEFAULT 'pt-BR',
    p_type public.epigraph_type DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    type public.epigraph_type,
    content TEXT,
    source TEXT,
    locale TEXT
)
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_target_locale TEXT := p_locale;
BEGIN
    -- Check if translations exist for the requested locale (and optional type)
    IF NOT EXISTS (
        SELECT 1 
        FROM public.lore_epigraphs e
        JOIN public.lore_epigraph_translations t ON t.epigraph_id = e.id
        WHERE t.locale = p_locale
          AND (p_type IS NULL OR e.type = p_type)
    ) THEN
        -- Fallback to pt-BR if requested locale has zero matches
        v_target_locale := 'pt-BR';
    END IF;

    RETURN QUERY
    SELECT 
        e.id,
        e.type,
        t.content,
        t.source,
        t.locale
    FROM public.lore_epigraphs e
    JOIN public.lore_epigraph_translations t ON t.epigraph_id = e.id
    WHERE t.locale = v_target_locale
      AND (p_type IS NULL OR e.type = p_type)
    ORDER BY random()
    LIMIT 1;
END;
$$;
