# Pico8 Hollow Vibe

<!-- Max 80 řádků. Co se nevejde, jde do docs/ a sem jeden odkaz. Veřejné repo: žádné LAN IP, domovské cesty, ID. -->

## Účel
Plošinovka v PICO-8 (inspirace Hollow Knight, Dead Cells), vzniká živě při vibe-coding session pro děti.
Není to výukový kurz: dospělý vajbí kód, děti hrají na handheldech a dávají feedback.

## Build a test
Žádný build ani testy. Hra se spouští v PICO-8:
```
load ninja.p8
run
```
Nahrání na handheldy: `./scripts/push_to_carts.sh ninja.p8` (cíle v `scripts/targets.conf`).

## Mapa
- `ninja.p8` – hlavní cart
- `docs/session-plan.md` – rozpis session a backlog nápadů od dětí
- `docs/handheld-setup.md` – jak dostat build na retro handheldy
- `scripts/` – `push_to_carts.sh`, `targets.example.conf`

## Invarianty
- `scripts/targets.conf` obsahuje soukromé adresy handheldů, je v `.gitignore`. Commituje se jen `targets.example.conf` s placeholdery.
- Jeden blok session = jeden commit (historie ukazuje, jak hra vznikala).
- `.gitignore` má výjimku `!/ninja.p8`, protože blok devconv ignoruje `*.p8` (Apple klíče).

## Kam dál
README.md, `docs/session-plan.md`
