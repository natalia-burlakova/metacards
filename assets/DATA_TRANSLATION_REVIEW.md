# Translation review checklist — card content (`data_en.json`, `data_sr.json`)

`data_en.json` and `data_sr.json` are machine-translated drafts of
`data_ru.json` (112 emotions, ids 1-112; 125 verbs, ids 1-127 with gaps at 59
and 70). Structure has been verified to match exactly: same id set, same
number of `lines` per entry, and `desc` present on the same lines in all
three files (checked programmatically — see the plan's verification step).
No native-speaker review has happened yet.

Flag for extra care before shipping:

- **Emotions list (ids 1-112)** — this is short single/multi-word emotion
  vocabulary (fear, shame, grief, envy, etc.), much of it clusters of
  near-synonyms in Russian (e.g. ids 54/55/104/105 all mean roughly
  "rejection/non-acceptance", ids 37/38/102 all mean roughly "feeling
  weighed down"). The English/Serbian words chosen try to preserve nuance
  but a native speaker familiar with the source therapeutic framework should
  confirm the right shade of meaning was picked for each, especially where
  the same Russian word was deliberately varied in translation to avoid
  literal duplication (id 35 "Печаль" → "Melancholy"/"Setnja" vs id 31
  "Скорбь" → "Sorrow"/"Žalost").
- **Verb `desc` grammatical-case hints (18 occurrences, e.g. id 6, 12, 14,
  15, 17, 20-22, 24-26, 38-40)** — in Russian these are question-word
  prompts showing which grammatical case the verb governs ("(что? кого?)" =
  "what? whom?"). English has no case system so these were translated as
  plain question words; Serbian *does* have grammatical case, so the
  Serbian `desc` hints should be checked by a native speaker for whether
  they should show Serbian case-question words instead of a literal
  translation of the Russian ones.
- **Verbs with awkward or telegraphic literal source phrasing** — e.g. id 7
  "Начать... " (with trailing ellipsis/space, meant to be completed by the
  reader), id 52 "За(хотеть)/по(желать)" (parenthetical prefixes showing
  verb-aspect variants). The en/sr translations approximate the intent but
  should be checked against how the app actually displays/uses these.
- **Multi-line emotion entries split across 2-3 `lines`** (ids 4, 6, 7, 8,
  9-19, 58, 108) — the line breaks encode a Russian display/wrapping choice
  ("СТРАХ" / "ПЕРЕМЕН/" / "НЕОПРЕДЕЛЕННОСТИ"). Line count was preserved
  exactly in en/sr for layout compatibility, but the split points were
  chosen for reasonable phrasing in each language, not translated
  word-for-word per line — worth a visual check once the app renders them.

Once a locale's card content has been reviewed end-to-end, note it here:

- [ ] `data_en.json` reviewed
- [ ] `data_sr.json` reviewed
