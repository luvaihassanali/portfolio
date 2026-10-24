# Portfolio — project notes for Claude

Static site published via GitHub Pages: https://luvaihassanali.github.io/portfolio/
- `index.html` — portfolio landing page (exported from Bootstrap Studio, `Portfolio.bsdesign`).
- `cv/cv.html` — the live CV (https://luvaihassanali.github.io/portfolio/cv/cv.html).
- `cv/archive/` — old CV versions (`cv1.html`, `cv2.html`). Don't edit; reference only.

## Conventions
- The CV is the single source of truth for CV content. Edit `cv/cv.html` directly
  unless we decide to go back through Bootstrap Studio.
- The current-role duration ("Present (N yrs M mos)") is computed by the inline
  script next to `#currentTimespan` in `cv/cv.html`. Don't hand-edit that text.
- Before replacing the CV wholesale, copy the old one to `cv/archive/cvN.html`.

## Status (as of 2026-10-24)
- In progress: CV refresh (last content update ~Oct 2024).
- Uncommitted: `cv1.html`/`cv2.html` moved into `cv/archive/`.
- Open items:
  - `post-build.py` still points at `cv/cv1.html` (now archived) and uses Windows
    paths — update or drop it.
  - Assumption, unconfirmed: the `Update-Dates` GitHub Action
    (`.github/workflows/main.yml` → `cv/UpdateDates.ps1`, `cv/prevDate.txt`) is
    obsolete now that the date is computed in JS. Its regex no longer matches the
    CV text. Decide whether to delete it.
