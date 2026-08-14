# Session plán: vibe-coding Hollow Knight/Dead Cells plošinovky

Formát: **ty** (dospělý) živě "vajbíš" kód s Claude Code, promítáš na projektor. Děti
nekódí — hrají, testují na handheldech a přinášejí nápady. Po každém bloku jde nová
verze cartu hned na handheldy (viz [`handheld-setup.md`](handheld-setup.md)) — smyčka
je: **vajb → push na HW → děti hrají → feedback → další blok**.

Celkem ~2 hodiny. Časy jsou orientační, klidně blok zkrať/natáhni podle energie ve
skupině — lepší 4 hotové bloky s dobrým testem než 6 uspěchaných.

Startovní bod: `ninja.p8` v rootu repa už má hotový základ (gravitace, akcelerace,
kolize s mapou, kamera, animační stavy) — nezačínáme od nuly, stavíme na tom.

---

## 0. Úvod (10 min)

- Ukaž krátké klipy/screeny z Hollow Knight a Dead Cells (traversal, souboje, atmosféra).
- Zeptej se: **"Co dělá takovou hru cool?"** Sbírej odpovědi na tabuli/flipchart — typicky
  padne: tma/atmosféra, rychlost, sekání nepřátel, lezení po zdech, umírání a respawn,
  hudba/zvuky. Tyhle odpovědi použij jako vajbící prompty ve zbytku session — je to
  jejich hra, ne tvoje.
- Rozdej handheldy, ukaž, kde je tlačítko na spuštění cartu, ověř že fungují.

## Blok 1 — Pohyb a kamera (20 min)

**Cíl:** pohyb má "váhu" a je přesný, kamera plynule sleduje hráče.

Vajbící prompt (příklad, uprav podle toho, co řekly děti v úvodu): *"Uprav pohyb hráče
v ninja.p8 tak, aby zrychlení bylo rychlejší, ale doběh (friction) delší — chci aby to
padlo trochu setrvačně jako v Dead Cells. Kamera ať jemně 'dohání' hráče (lerp), ne skáče
na pozici okamžitě."*

→ ulož, spusť `scripts/push_to_carts.sh`, rozdej handheldy.

**Test (8 min):** Necháš děti pobíhat po testovací místnosti/mapě.
- "Cítí se skákání dobře, nebo je moc těžké/lehké?"
- "Kamera vás štve, nebo je to v pohodě?"

Commit: `git commit -m "blok 1: pohyb a kamera"`.

## Blok 2 — Dash a wall-jump (15 min)

**Cíl:** signature move obou her — rychlý dash (Mothwing Cloak z HK / dash z Dead Cells)
a odraz od zdi.

Vajbící prompt: *"Přidej dash na tlačítko 🅾️ — krátký rychlý výpad ve směru pohybu,
s malým cooldownem. Přidej wall-slide (pomalejší pád při dotyku zdi) a wall-jump při
skoku ve zdi."*

→ push, test.
- "Dá se s tím pořádně lítat po mapě?"
- "Chcete dash i ve vzduchu, nebo jen na zemi?"

Commit: `git commit -m "blok 2: dash a wall-jump"`.

## Blok 3 — Boj (20 min)

**Cíl:** melee útok se šťávou (feedback), první nepřítel.

Vajbící prompt: *"Přidej útok na tlačítko ❎ (nebo jiné volné) — krátký hitbox před
hráčem, screen shake a krátké zamrznutí (hit-stop) při zásahu. Přidej jednoho nepřítele,
co chodí sem tam po plošině a když ho hráč trefí, odletí (knockback) a po pár zásazích
zmizí."*

→ push, test.
- "Je zásah cítit uspokojivě, nebo je to nudné?"
- "Jak by měl vypadat/chovat se první nepřítel?" (necháš to navrhnout děti → přepiš spritu)

Commit: `git commit -m "blok 3: boj"`.

## Blok 4 — Nebezpečí a smrt (15 min)

**Cíl:** riziko a důsledky — ostny, HP, respawn.

Vajbící prompt: *"Přidej ostny jako hazard tile (flag v mapě) — dotyk ubere HP a odhodí
hráče. Přidej hráči HP (např. 3), při 0 HP smrt a respawn na posledním checkpointu."*

→ push, test.
- "Je smrt fér, nebo naštvaná (moc daleko od checkpointu)?"

Commit: `git commit -m "blok 4: nebezpeci a smrt"`.

## Blok 5 — Atmosféra a šťáva (15 min)

**Cíl:** ať to vypadá a zní jako Hollow Knight/Dead Cells, ne jako prototyp.

Vajbící prompt: *"Zatmav paletu prostředí (tmavě modrá/fialová místo výchozí), přidej
druhou vrstvu pozadí s paralaxou pro pocit hloubky, částice při dopadu/zásahu/dashi.
Přidej zvuky na skok, útok a zásah přes sfx editor."*

→ push, **finální test** — nech všechny hrát najednou.

Commit: `git commit -m "blok 5: atmosfera a suva"`.

## Závěr (10-15 min)

- Všichni hrají zároveň, poslední společný playtest.
- Sepiš s dětmi **Backlog** (níž) — co by chtěly příště.
- Finální commit, `git push`, ukaž jim repo na GitHubu — ať vidí, že je to reálně jejich,
  veřejné, a doma si to můžou stáhnout a dál šťourat (i s Claude Code, pokud budou chtít
  zkusit sami "vajbit").

---

## Backlog (doplňuje se po každé session)

*(zatím prázdné — vyplní se nápady dětí na konci první session)*
