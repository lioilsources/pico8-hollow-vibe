# Pico8 Hollow Vibe

Plošinovka v [PICO-8](https://www.pico-8.com/) inspirovaná *Hollow Knight* a *Dead Cells* —
vznikla jako **vibe-coding session pro děti**: dospělý u klávesnice živě "vajbí" kód s
Claude Code, děti u toho hrají na retro handheldech a přinášejí nápady, co dál.

Nejde o výukový kurz programování. Jde o rychlou smyčku **nápad → kód → hraní na
skutečném zařízení → feedback**, opakovanou v blocích po celou session.

## Jak spustit

1. Nainstaluj [PICO-8](https://www.pico-8.com/) (placený, ~15 USD).
2. Otevři konzoli a spusť:
   ```
   load ninja.p8
   run
   ```

## Ovládání

| Akce | Klávesa |
|---|---|
| Pohyb | ⬅️ / ➡️ |
| Skok | ❎ |
| (přibude během session: dash, útok...) | 🅾️ |

## Struktura repozitáře

- `ninja.p8` — hlavní cart, živě se vyvíjí během session.
- `docs/session-plan.md` — rozpis 2hodinové vibe-coding session na bloky.
- `docs/handheld-setup.md` — jak dostat nový build na retro handheldy (Miyoo/Anbernic/
  RG35XX...) během pár vteřin.
- `scripts/push_to_carts.sh` — hromadné nahrání aktuální verze cartu na všechny
  handheldy najednou.

## Průběh vývoje

Milníky session jsou vidět v historii commitů (`git log`) — každý blok session =
jeden commit, takže je vidět, jak hra postupně vznikala.

## Co dál

Nápady od dětí na příští session se sbírají do `docs/session-plan.md` (sekce Backlog)
na konci každé session.
