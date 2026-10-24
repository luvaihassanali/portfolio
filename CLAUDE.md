# Portfolio — project notes for Claude

Static site published via GitHub Pages: https://luvaihassanali.github.io/portfolio/
- `index.html` — portfolio landing page (exported from Bootstrap Studio, `Portfolio.bsdesign`).
- `cv/cv.html` — the live CV (https://luvaihassanali.github.io/portfolio/cv/cv.html).
- `cv/archive/` — old CV versions (`cv1.html`, `cv2.html`). Don't edit; reference only.

## Conventions
- The CV is the single source of truth for CV content. Edit `cv/cv.html` directly
  unless we decide to go back through Bootstrap Studio.
- The current-role duration ("Present (N yrs M mos)") comes from the `data-start`
  attribute on `#currentTimespan` in `cv/cv.html`. The inline script recomputes it
  in the browser, and the monthly `Update-Dates` Action (`cv/UpdateDates.ps1`)
  refreshes the static text with the same rule. To change the start month, edit
  `data-start` only.
- Before replacing the CV wholesale, copy the old one to `cv/archive/cvN.html`.

## Status (as of 2026-10-24)
- In progress: CV refresh (last content update ~Oct 2024).
- This repo is public. Personal or career notes don't go here.
- Open items:
  - `post-build.py` uses hard-coded Windows paths (its `cv1.html` step is
    commented out). Update or drop it.
  - The rewritten `Update-Dates` Action (2026-10-24) hasn't run on GitHub yet. Run
    it manually once after pushing to confirm it works.
