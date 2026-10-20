# 0006: Database Structured Content and YAML Catalogs

- **Status:** open
- **Priority:** P1
- **Domain:** Database / Architecture
- **Blocked By:** 0005-codex-presentation-engine-and-reader.md
- **Blocks:** 0007-universal-keyword-hover-tooltip-engine.md, 0008-codex-compendium-filterable-databases.md

---

## 1. Context & Objective
Establish the structured content directory layout under content/database/, implement a pure Dart YAML dictionary parser, and author strongly typed YAML catalogs for Survival Tables (Conditions, Injuries, Panic), Character Foundation (Paths, Species, Origins, Abilities), and Equipment catalogs.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Backend Architecture: design/03-sdd-backend.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0003: design/decisions/0003-obsidian-native-markdown-yaml-content-pipeline.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Directory Architecture**: Scaffold content/database/ with designated subdirectories: survival/, character/, equipment/, and keywords/.
- [ ] **YAML Dictionary Parser**: Implement DatabaseYamlLoader in backend/lib/domain/ to parse structured YAML dictionaries into typed domain entity lists.
- [ ] **Domain Entity Schemas**: Define strongly typed entity models for Condition, Injury, PanicReaction, Path, Species, Origin, Ability, and EquipmentItem.
- [ ] **Asset Bundling**: Add content/database/ to pubspec.yaml asset packaging.
- [ ] **Unit Tests**: Add unit tests in backend/test/ verifying YAML deserialization and schema validation across all catalog types.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Unit tests pass for all YAML catalog fixtures.
