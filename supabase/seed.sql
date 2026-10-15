-- ==============================================================================
-- File: supabase/seed.sql
-- Description: Canonical database seed data for local development and staging.
--              Executed via `supabase db reset` or run in the SQL Editor.
-- ==============================================================================

-- 1. Canonical Lore Epigraphs & Archival Transmissions (pt-BR)
DO $$
DECLARE
    v_epigraph_id UUID;
BEGIN
    -- 1. Document (Classified institutional folio)
    INSERT INTO public.lore_epigraphs (type) VALUES ('document') RETURNING id INTO v_epigraph_id;
    INSERT INTO public.lore_epigraph_translations (epigraph_id, locale, content, source)
    VALUES (
        v_epigraph_id,
        'pt-BR',
        'DIRETIVA INSTITUCIONAL // SEÇÃO 09-D' || E'\n' ||
        'Qualquer operador que manifestar ressonância cognitiva após a travessia do limiar de [OMITIDO] deve ser imediatamente contido no setor médico da estação. Não olhe para as fissuras no casco.',
        'Divisão de Segurança Sintética, Protocolo 44'
    );

    -- 2. News (Corporate colony ticker bulletin)
    INSERT INTO public.lore_epigraphs (type) VALUES ('news') RETURNING id INTO v_epigraph_id;
    INSERT INTO public.lore_epigraph_translations (epigraph_id, locale, content, source)
    VALUES (
        v_epigraph_id,
        'BOLETIM DE COLÔNIA // CICLO SOLAR 412.8' || E'\n' ||
        'O consórcio Weyland-Apex confirmou a paralisação de 30 dias na refinaria de hélio-3 após o desaparecimento de duas equipes de extração na cratera boreal. As buscas continuam.',
        'Agência de Notícias da Borda Exterior'
    );

    -- 3. Poem (Cosmic verse with stanzas)
    INSERT INTO public.lore_epigraphs (type) VALUES ('poem') RETURNING id INTO v_epigraph_id;
    INSERT INTO public.lore_epigraph_translations (epigraph_id, locale, content, source)
    VALUES (
        v_epigraph_id,
        'O vácuo não responde quando chamamos.' || E'\n' ||
        'Ele apenas ecoa o que tememos esquecer.' || E'\n' ||
        'Entre as estrelas frias, somos cinza e poeira.' || E'\n' ||
        'E o horizonte nos observa sem pestanejar.',
        'Cantos do Observador Cego, Fragmento VII'
    );

    -- 4. Quote (Philosophical astronaut transmission)
    INSERT INTO public.lore_epigraphs (type) VALUES ('quote') RETURNING id INTO v_epigraph_id;
    INSERT INTO public.lore_epigraph_translations (epigraph_id, locale, content, source)
    VALUES (
        v_epigraph_id,
        'Não foi a escuridão do espaço que nos assustou durante o salto gravitacional. Foi perceber que algo na escuridão já nos conhecia pelo nome.',
        'Comandante Elena Vance, Diário de Bordo da USG Meridian'
    );

    -- 5. Transmission (Emergency SOS sensor transcript)
    INSERT INTO public.lore_epigraphs (type) VALUES ('transmission') RETURNING id INTO v_epigraph_id;
    INSERT INTO public.lore_epigraph_translations (epigraph_id, locale, content, source)
    VALUES (
        v_epigraph_id,
        '-- INTERCEPTAÇÃO DE SINAL // FREQ 1420.45 MHz --' || E'\n' ||
        'AQUI É O CARGUEIRO OMNIS-9. MOTORES INOPERANTES NO SETOR [OMITIDO].' || E'\n' ||
        'O HORIZONTE ESTÁ SE DOBRANDO SOBRE A PROA. NÃO ENVIEM RESGATE. REPETINDO: [OMITIDO].',
        'Transmissão de Emergência Não Triada, Estação Kepler-8'
    );
END $$;
