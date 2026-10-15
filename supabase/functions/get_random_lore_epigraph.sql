-- ==============================================================================
-- Function: get_random_lore_epigraph.sql
-- Feature: Lore Epigraphs & Archival Transmissions Catalog (OP-02A)
-- Description: Server-side stored procedure returning a single randomized active
--              lore epigraph record matching the requested locale.
-- ==============================================================================

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
