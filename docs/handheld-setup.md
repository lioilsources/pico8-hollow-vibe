# Handheld setup: rychlý update pipeline

Cíl: po každém "vajbícím" bloku dostat aktuální `ninja.p8` na 2-5 retro handheldů
(Miyoo/Anbernic/RG35XX a podobné) během pár vteřin, bez přehazování SD karet mezi dětmi.

**Tohle je příprava předem** (den/dny před session), ne něco, co se dá stihnout živě.

## Princip

Retro handheldy s custom firmwarem (ArkOS, muOS, MinUI/NextUI, OnionOS, JELOS...) běží na
Linux ARM. PICO-8 tam jede jako tzv. **port** — nezávislá aplikace vedle emulátorů:

- Ze své PICO-8 licence stáhni **Raspberry Pi build** (obsahuje `pico8` a `pico8_dyn` —
  `pico8_dyn` je varianta, kterou tyhle handheldy typicky potřebují, protože nejedou
  přímo Raspberry Pi OS).
- `pico8_dyn` binárka + launch skript se nahraje do složky pro porty (na většině
  firmwarů `/roms/ports/pico8/` nebo obdobně).
- Cart soubory (`.p8` nebo `.p8.png`) se čtou **přímo ze souboru** — žádný export do HTML
  nebo do standalone binárky. Update hry = přepsání jednoho souboru na SD kartě.

Přesná cesta ke složce s porty a přesný formát launch skriptu se liší podle firmwaru
verze. Postupuj podle aktuální dokumentace ke konkrétnímu firmwaru, který na
handheldech používáš (hledej: "<firmware> install pico8 port", např. "ArkOS pico8 port",
"muOS pico8 port", "RG35XX pico8_dyn") — komunita retro handheldů tohle má dobře
zdokumentované, jen se to mění s verzemi firmwaru, takže nechci fixovat konkrétní kroky,
co by za měsíc mohly sedět jinam.

## Pre-session checklist (udělat předem, na každém handheldu)

- [ ] Nainstalovaný a odzkoušený PICO-8 port (spustí se aspoň prázdný/testovací cart).
- [ ] Ovládací tlačítka namapovaná rozumně na ⬅️➡️❎🅾️ (viz `gptokeyb`/config daného portu).
- [ ] Zapnutý SSH server (dropbear/openssh) — většina těchto firmwarů to má jako
      přepínač v nastavení sítě. Tohle je klíčové pro rychlý push skriptem.
- [ ] Ověřená statická/rezervovaná IP adresa handheldu na WiFi, kterou použiješ na
      session (viz níž `targets.conf`).
- [ ] Nabité na 100 %, nebo powerbanka po ruce.
- [ ] Jeden update už reálně proběhl skriptem `scripts/push_to_carts.sh` jako zkouška.

## Síť na místě

Pokud budeš mimo domácí WiFi (klubovna, tábor...), vezmi si vlastní malý cestovní
router. Nezávislost na místní síti = jedna věc míň, co může selhat živě před dětma.
Všechny handheldy i notebook musí být na stejné síti.

## Rychlý update: `scripts/push_to_carts.sh`

1. Zkopíruj `scripts/targets.example.conf` do `scripts/targets.conf` (je v `.gitignore`,
   necommitne se — obsahuje soukromé IP adresy).
2. Vyplň řádek na handheld, např.:
   ```
   knight-1  pi@192.168.1.101:/roms/ports/pico8/carts/ninja.p8
   knight-2  pi@192.168.1.102:/roms/ports/pico8/carts/ninja.p8
   ```
   (uživatelské jméno a cílová cesta se liší dle firmwaru — over si to jednou ručně přes
   `scp` předem a pak už jen kopíruj do configu).
3. Po každém bloku, po uložení cartu v PICO-8:
   ```
   ./scripts/push_to_carts.sh ninja.p8
   ```
   Nahraje aktuální cart na všechny nakonfigurované handheldy najednou (paralelně).
4. Na handheldu stačí cart znovu spustit (restart portu) — nová verze je tam.

## Fallback: USB / SD karta

Pokud WiFi na místě zlobí:
- Handheldy s USB-C mass storage režimem: připoj kabelem, přetáhni `ninja.p8` do složky
  s carty ručně. Pomalejší (~30-60 s na kus), ale 100% spolehlivé.
- Vezmi s sebou powered USB hub a víc kabelů, ať nemusíš přepojovat jeden kabel mezi
  handheldy dokola.

Doporučení: **vyzkoušej obě cesty (síť i USB) předem**, ne poprvé před dětma.
