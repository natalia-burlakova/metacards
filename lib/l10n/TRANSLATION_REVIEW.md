# Translation review checklist — UI strings (`app_en.arb`, `app_sr.arb`)

All English and Serbian values in `app_en.arb` / `app_sr.arb` were drafted by
machine translation from the Russian source (`app_ru.arb`, the
`template-arb-file`). None have been reviewed by a native speaker yet.
`donate.dart` was left out of this pass entirely (still Russian-only,
untouched).

Flag for extra care:

- `contactsMasterAlla` / `contactsMasterEvgenia` / `contactsMasterOlga` — the
  Russian source uses grammatical instrumental case ("Аллой Сысоевой" =
  "with Alla Sysoeva"); en/sr values were transliterated to nominative case.
  Confirm the transliteration/spelling with the people named before shipping.
- `menuSchoolName` / `menuSchoolSubtitle` / `contacts*Title` — school/brand
  name translations ("Только Ты" → "Only You" / "Samo Ti") are a judgment
  call, not a literal translation. Confirm the school wants an English/
  Serbian name used at all, or whether it should stay untranslated everywhere.
- `aboutSchoolBody` — contains an idiom ("под ключ" → "turnkey") and a
  therapy-method term ("Расстановка" → "family/systemic constellations")
  that both benefit from a subject-matter-literate reviewer.
- `aboutEmotionsBody`, `workTemplateThanks`, `workTemplateRefrain`,
  `workTemplateAccept` — emotionally-loaded ritual/therapeutic copy; tone
  and register matter as much as literal accuracy here.
- Every other key — straightforward UI chrome (buttons, menu items, dialog
  text) — lower risk but still unreviewed.

Once a locale's file has been reviewed end-to-end, note it here:

- [ ] `app_en.arb` reviewed
- [ ] `app_sr.arb` reviewed
