
## [MODULE KeySafeFrames](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod)

Procedures:

```
[79](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#79)    PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)
```
```
[88](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#88)    PROCEDURE Restore*(f: Frame);
```
```
[105](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#105)    PROCEDURE FlipCross(X, Y: INTEGER);
```
```
[116](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#116)    PROCEDURE Focus*(): Frame;
```
```
[121](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#121)    PROCEDURE Selected*(): Frame;
```
```
[126](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#126)    PROCEDURE This*(x, y: INTEGER): Frame;
```
```
[131](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#131)    PROCEDURE Mark(f: Frame; mode: INTEGER);
```
```
[136](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#136)    PROCEDURE Draw*(f: Frame);
```
```
[141](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#141)    PROCEDURE DrawNorm(f: Frame);
```
```
[146](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#146)    PROCEDURE Erase*(f: Frame);
```
```
[151](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#151)    PROCEDURE DrawKeyRing*(f: Frame; L: KeySafes.KeyRing);
```
```
[156](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#156)    PROCEDURE EraseKeyRing*(f: Frame; R: KeySafes.KeyRing);
```
```
[161](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#161)    PROCEDURE Change*(f: Frame; VAR msg: KeySafes.Msg);
```
```
[166](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#166)    PROCEDURE FlipMark(x, y: INTEGER);
```
```
[172](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#172)    PROCEDURE Defocus*(f: Frame);
```
```
[182](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#182)    PROCEDURE Deselect*(f: Frame);
```
```
[191](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#191)    PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);
```
```
[286](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#286)    PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);
```
```
[294](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#294)    PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);
```
```
[304](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#304)    PROCEDURE DeleteChar(f: Frame);
```
```
[325](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#325)    PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);
```
```
[335](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#335)    PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);
```
```
[395](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#395)    PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);
```
```
[401](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#401)    PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);
```
```
[410](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#410)    PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);
```
```
[419](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#419)    PROCEDURE DrawLine(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);
```
```
[441](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#441)    PROCEDURE DrawCaption(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);
```
```
[473](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#473)    PROCEDURE DrawMacro(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);
```
```
[496](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#496)    PROCEDURE Open*(f: Frame; S: KeySafes.KeySafe);
```
