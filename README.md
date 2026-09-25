Ah, jetzt verstehe ich! Du hast **diese fertige `.bat`-Datei** (den Inhalt, den du gepostet hast) und willst eine **Kurzanleitung**, wie man sie benutzt. Hier ist sie:

---

# 🚀 Kurzanleitung: Datei-Umbenenner

## Vorbereitung (einmalig)

1. **Dateiendungen sichtbar machen**
   - Explorer öffnen → **Ansicht** → **Anzeigen** → **Dateinamenerweiterungen** ✅

2. **Die `.bat` speichern**
   - Den Code in eine Datei einfügen
   - Speichern als: `umbenennen.bat` (Endung `.bat`, nicht `.txt`!)
   - Ablageort egal – z. B. Desktop

---

## Benutzung (jedes Mal)

**1. Doppelklick** auf `umbenennen.bat`

**2. Terminal fragt nach dem Dateinamen:**
```
Dateiname (z.B. test.bat oder config.json):
```
→ Tippe den **exakten Namen** ein (z. B. `test.txt`) → **Enter**

**3. Das Skript sucht automatisch in:**
- Aktueller Ordner
- Desktop
- Bilder
- Dokumente
- Downloads

**4. Wenn gefunden:**
```
GEFUNDEN: "C:\Users\Kay\Desktop\test.txt"
```
→ Tippe den **neuen Namen** ein (z. B. `neu.txt`) → **Enter**

**5. Fertig!** ✅
```
Fertig: "test.txt" -> "neu.txt"
```

---

## ⚠️ Wichtige Hinweise

| Problem | Lösung |
|---|---|
| „Datei nicht gefunden" | Prüfe exakte Schreibweise + Endung. Datei liegt vielleicht woanders. |
| Fehler beim Umbenennen | Datei ist geöffnet → schließen und erneut versuchen |
| `.bat` kann sich nicht selbst umbenennen | Eine laufende Datei ist gesperrt – benenne eine **andere** Datei um |
| Name mit Leerzeichen | In Anführungszeichen eingeben: `"mein test.txt"` |

---

## 💡 Tipp

Du kannst die `.bat` auch in einen beliebigen Ordner legen – sie sucht trotzdem in allen Standard-Ordnern. Wenn deine Datei woanders liegt, gib den **vollen Pfad** als Namen ein:
```
C:\Users\Kay\Projekte\test.txt
```
