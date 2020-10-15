
## [MODULE GraphicFrames](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

## Procedures
---

`  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L76)


`  PROCEDURE Restore*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L85)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L102)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L113)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L118)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L123)


`  PROCEDURE Mark(F: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L128)


`  PROCEDURE Draw*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L133)


`  PROCEDURE DrawNorm(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L138)


`  PROCEDURE Erase*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L143)


`  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L148)


`  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L153)


`  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L158)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L163)


`  PROCEDURE Defocus*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L169)


`  PROCEDURE Deselect*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L179)


`  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L188)


`  PROCEDURE CaptionCopy(F: Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L211)


`  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L232)


`  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L239)


`  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L324)


`  PROCEDURE InsertChar(F: Frame; ch: CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L332)


`  PROCEDURE DeleteChar(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L342)


`  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L357)


`  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L367)


`  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L425)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L431)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L440)


`  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L449)


`  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L469)


`  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L498)


`  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); ` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L518)

