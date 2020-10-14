
#### [MODULE ImageFrames](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

Procedures:

```
  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)
```
```
  PROCEDURE Restore*(F: Frame);
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
  PROCEDURE Mark(F: Frame; mode: INTEGER);
```
```
  PROCEDURE Draw*(F: Frame);
```
```
  PROCEDURE DrawNorm(F: Frame);
```
```
  PROCEDURE Erase*(F: Frame);
```
```
  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);
```
```
  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);
```
```
  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);
```
```
  PROCEDURE FlipMark(x, y: INTEGER);
```
```
  PROCEDURE Defocus*(F: Frame);
```
```
  PROCEDURE Deselect*(F: Frame);
```
```
  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);
```
```
  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);
```
```
  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);
```
```
  PROCEDURE DeleteChar(F: Frame);
```
```
  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);
```
```
  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);
```
```
  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);
```
```
  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);
```
```
  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);
```
```
  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);
```
```
  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);
```
```
  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);
```
```
  PROCEDURE Open*(F: Frame; I: Images.Image);
```
