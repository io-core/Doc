
## [MODULE GraphicFrames](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

Procedures:


[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L76) `  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L85) `  PROCEDURE Restore*(F: Frame);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L102) `  PROCEDURE FlipCross(X, Y: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L113) `  PROCEDURE Focus*(): Frame;`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L118) `  PROCEDURE Selected*(): Frame;`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L123) `  PROCEDURE This*(x, y: INTEGER): Frame;`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L128) `  PROCEDURE Mark(F: Frame; mode: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L133) `  PROCEDURE Draw*(F: Frame);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L138) `  PROCEDURE DrawNorm(F: Frame);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L143) `  PROCEDURE Erase*(F: Frame);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L148) `  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L153) `  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L158) `  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L163) `  PROCEDURE FlipMark(x, y: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L169) `  PROCEDURE Defocus*(F: Frame);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L179) `  PROCEDURE Deselect*(F: Frame);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L188) `  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L211) `  PROCEDURE CaptionCopy(F: Frame;`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L232) `  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L239) `  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L324) `  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L332) `  PROCEDURE InsertChar(F: Frame; ch: CHAR);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L342) `  PROCEDURE DeleteChar(F: Frame);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L357) `  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L367) `  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L425) `  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L431) `  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L440) `  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L449) `  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L469) `  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L498) `  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);`

[(src)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L518) `  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); `
