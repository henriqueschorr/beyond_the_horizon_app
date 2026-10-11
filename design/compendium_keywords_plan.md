# Implementation Plan Reference: Master Keyword Overlay Engine (Future OP)

*This document preserves the agreed architectural design for the Master Keyword Overlay Engine, deferred from OP-03 to a dedicated subsequent milestone.*

---

## 1. Architectural Philosophy: All Overlays are Keywords

When users hover over any term across character sheets, equipment cards, rules pages, or audit feeds:
- High-level concepts (*Condição*, *Habilidade de Arma*, *Dano*, *Terror*, *Vantagem*) are keywords.
- Concrete instances (*Vulnerável*, *Estressar*, *Ácido*, *Fratura Estrutural*, *Corpo*) are keywords linked to their parent concept via parent_slug.
- Inflections and grammatical variations are captured in an aliases TEXT array.
- The client caches the lightweight dictionary once on startup (~150 items, ~30 KB), enabling instant **0 ms hover resolution** without database round-trips.

---

## 2. Master Table Schema: public.compendium_keywords

```sql
-- 1. Keyword Category Enum
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'keyword_category') THEN
        CREATE TYPE public.keyword_category AS ENUM (
            'concept',
            'condition',
            'weapon_property',
            'weapon_ability',
            'injury',
            'trauma',
            'panic',
            'damage_group',
            'damage_subtype',
            'character_characteristic',
            'attribute',
            'activity',
            'degree_of_success',
            'roll_modifier',
            'meta_currency',
            'equipment_type',
            'creature_property'
        );
    END IF;
END $$;

-- 2. Master Compendium Keywords Table
CREATE TABLE IF NOT EXISTS public.compendium_keywords (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT UNIQUE NOT NULL CHECK (char_length(slug) >= 2 AND char_length(slug) <= 80),
    name TEXT NOT NULL CHECK (char_length(trim(name)) >= 1 AND char_length(name) <= 80),
    aliases TEXT[] NOT NULL DEFAULT '{}',
    category public.keyword_category NOT NULL,
    parent_slug TEXT REFERENCES public.compendium_keywords(slug) ON DELETE SET NULL,
    description TEXT NOT NULL CHECK (char_length(trim(description)) >= 1),
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    doc_page_slug TEXT REFERENCES public.documentation_pages(slug) ON DELETE SET NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 3. Indexes for Instant Keyword Resolution
CREATE INDEX IF NOT EXISTS idx_keywords_category ON public.compendium_keywords(category, sort_order);
CREATE INDEX IF NOT EXISTS idx_keywords_parent ON public.compendium_keywords(parent_slug);
CREATE INDEX IF NOT EXISTS idx_keywords_aliases ON public.compendium_keywords USING GIN(aliases);

-- 4. Row-Level Security
ALTER TABLE public.compendium_keywords ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read for compendium keywords"
    ON public.compendium_keywords FOR SELECT
    TO anon, authenticated
    USING (true);

-- 5. Trigger
CREATE TRIGGER on_compendium_keywords_updated
    BEFORE UPDATE ON public.compendium_keywords
    FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();
```

---

## 3. Data Flow: Database to Flutter UI

1. **Database**: Houses single authoritative source with parent hierarchy and metadata JSONB (e.g. attack_roll_min: 9, stress_cost: 1, severity: minor, roll_min: 1, roll_max: 30).
2. **Backend**: KeywordService returns typed List<CompendiumKeywordDto> on startup.
3. **Frontend In-Memory Registry**: KeywordRegistry indexes all entries by slug and normalized aliases into an in-memory map.
4. **Interactive Hover**:
   - KeywordTooltip with target slug (e.g. vulneravel).
   - Displays keyword name, parent tag ([CONDIÇÃO]), description, and optional link to documentation page with 0 ms latency.
