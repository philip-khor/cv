# CV

Typst source for my CV.

## Build

```powershell
cd cv
./build.ps1          # compile once
./build.ps1 -Watch   # watch and recompile on changes
```

Or directly:

```bash
typst compile --font-path fonts cv.typ philip_khor-cv.pdf
```

## Data

- `src/*.yaml` — structured data (experience, projects, education, qualifications)
- `src/cvlib.bib` — publications (BibTeX, read natively by Typst)
- `cv.typ` — layout and styling

## Fonts

Required fonts (in `fonts/`):
- Roboto (Regular, Italic, Bold, BoldItalic, Thin, ThinItalic, Medium, MediumItalic, Light, LightItalic)
- FontAwesome (for header icons)
