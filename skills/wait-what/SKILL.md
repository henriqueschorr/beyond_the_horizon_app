---
name: wait-what
description: Stop. That last message did not land: re-pitch it.
disable-model-invocation: true
---

# Wait-What Skill (Re-Pitch & Comprehension Recovery)

When the user triggers this skill, the previous message or explanation failed to communicate clearly. Stop everything, discard any in-flight interview or multi-step execution questions, and re-pitch the core concept from scratch.

---

## 1. Absolute Stop Gate

1. **Freeze All Pending Flows**: Do not ask any design tree questions, planning questions, or multi-choice options from earlier rounds.
2. **Do Not Advance**: Do not continue implementing code, modifying documents, or running tools for the broader task.
3. **Single Output Focus**: Dedicate the entire response to re-explaining the single concept that caused confusion.

---

## 2. Response Structure

Always structure the explanation into four distinct sections:

### 1. Current Context
Explain in one or two simple sentences where we are in the process and why this topic is currently on the table.

### 2. Re-Pitch
Explain the core idea or decision using ASD-STE100 Simplified Technical English and the repository glossary.

### 3. Rationale
Explain why this matters, what problem it solves, or what trade-off is involved.

### 4. Comprehension Check
End the response with this exact question and nothing else:
"Does this make sense now, or should we break it down differently?"

---

## 3. ASD-STE100 Simplified Technical English Rules

Follow these core STE rules strictly during the re-pitch:

1. **Short Sentences**: Keep sentences under 20 words.
2. **One Idea Per Sentence**: Express only one instruction or conceptual fact per sentence.
3. **Active Voice Only**: Always state who or what performs the action. Do not use passive voice.
4. **Explicit Nouns**: Prohibit ambiguous pronouns (such as "it", "this", "that", or "they") when referring to concepts. Repeat the noun instead.
5. **Simple Approved Verbs**: Use simple, direct verbs (such as *use*, *make*, *show*, *stop*, *write*, *save*, *read*). Prohibit compound or figurative verb phrases.
6. **No Unexplained Jargon**: If an engineering term must be used, define it immediately in simple terms.

---

## 4. Ubiquitous Domain Language & Glossary

1. **Glossary Discovery**: Check for GLOSSARY-MAP.md in the repository root or in [design/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/). If none exists, read [design/GLOSSARY.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/GLOSSARY.md).
2. **Strict Terminology**: Always use canonical domain terms defined in the glossary (e.g., *Codex*, *Entity Dossier*, *Game Rules*, *Omnibar*, *Slide-Over Drawer*, *Sources*, *Path*, *Species*, *Ability*, *Panic*, *Stress*, *Trauma*, *Void*).
3. **Honor Prohibitions**: Never use terms listed under the *Avoid* entries of the glossary.

---

## 5. Resuming Execution

Do not proceed with the original task, interview, or ticket generation until the user confirms that the explanation is clear. Once the user approves, re-open the original frontier or workflow.
