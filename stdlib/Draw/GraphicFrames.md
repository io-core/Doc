
## [MODULE GraphicFrames](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

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
  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);
```
```
  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);
```
```
  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);
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
  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);
```
```
  PROCEDURE CaptionCopy(F: Frame;
```
```
  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);
```
```
  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);
```
```
  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);
```
```
  PROCEDURE InsertChar(F: Frame; ch: CHAR);
```
```
  PROCEDURE DeleteChar(F: Frame);
```
```
  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);
```
```
  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);
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
  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);
```
```
  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);
```
```
  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);
```
```
  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); 
```
