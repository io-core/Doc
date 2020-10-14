
## [MODULE KeySafeFrames](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod)

Procedures:


[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L79) `  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L88) `  PROCEDURE Restore*(f: Frame);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L105) `  PROCEDURE FlipCross(X, Y: INTEGER);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L116) `  PROCEDURE Focus*(): Frame;`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L121) `  PROCEDURE Selected*(): Frame;`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L126) `  PROCEDURE This*(x, y: INTEGER): Frame;`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L131) `  PROCEDURE Mark(f: Frame; mode: INTEGER);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L136) `  PROCEDURE Draw*(f: Frame);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L141) `  PROCEDURE DrawNorm(f: Frame);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L146) `  PROCEDURE Erase*(f: Frame);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L151) `  PROCEDURE DrawKeyRing*(f: Frame; L: KeySafes.KeyRing);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L156) `  PROCEDURE EraseKeyRing*(f: Frame; R: KeySafes.KeyRing);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L161) `  PROCEDURE Change*(f: Frame; VAR msg: KeySafes.Msg);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L166) `  PROCEDURE FlipMark(x, y: INTEGER);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L172) `  PROCEDURE Defocus*(f: Frame);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L182) `  PROCEDURE Deselect*(f: Frame);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L191) `  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L286) `  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L294) `  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L304) `  PROCEDURE DeleteChar(f: Frame);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L325) `  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L335) `  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L395) `  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L401) `  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L410) `  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L419) `  PROCEDURE DrawLine(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L441) `  PROCEDURE DrawCaption(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L473) `  PROCEDURE DrawMacro(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);`

[(src)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L496) `  PROCEDURE Open*(f: Frame; S: KeySafes.KeySafe);`
