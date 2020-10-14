
#### [MODULE PackageFrames](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod)

Procedures:

```
  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)
```
```
  PROCEDURE Restore*(f: Frame);
```
```
  PROCEDURE FlipCross(X, Y: INTEGER);
```
```
  PROCEDURE Focus*(): Frame;
```
```
  PROCEDURE Selected*(): Frame;
```
```
  PROCEDURE This*(x, y: INTEGER): Frame;
```
```
  PROCEDURE Mark(f: Frame; mode: INTEGER);
```
```
  PROCEDURE Draw*(f: Frame);
```
```
  PROCEDURE DrawNorm(f: Frame);
```
```
  PROCEDURE Erase*(f: Frame);
```
```
  PROCEDURE DrawComponent*(f: Frame; L: Packages.Component);
```
```
  PROCEDURE EraseComponent*(f: Frame; C: Packages.Component);
```
```
  PROCEDURE Change*(f: Frame; VAR msg: Packages.Msg);
```
```
  PROCEDURE FlipMark(x, y: INTEGER);
```
```
  PROCEDURE Defocus*(f: Frame);
```
```
  PROCEDURE Deselect*(f: Frame);
```
```
  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);
```
```
  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);
```
```
  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);
```
```
  PROCEDURE DeleteChar(f: Frame);
```
```
  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);
```
```
  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);
```
```
  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);
```
```
  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);
```
```
  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);
```
```
  PROCEDURE DrawLine(obj: Packages.Component; VAR m: Packages.Msg);
```
```
  PROCEDURE DrawCaption(obj: Packages.Component; VAR m: Packages.Msg);
```
```
  PROCEDURE DrawMacro(obj: Packages.Component; VAR m: Packages.Msg);
```
```
  PROCEDURE Open*(f: Frame; P: Packages.Package);
```
