
## [MODULE GraphicFrames](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

Procedures:

[76](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#76) `  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)`
[85](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#85) `  PROCEDURE Restore*(F: Frame);`
[102](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#102) `  PROCEDURE FlipCross(X, Y: INTEGER);`
[113](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#113) `  PROCEDURE Focus*(): Frame;`
[118](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#118) `  PROCEDURE Selected*(): Frame;`
[123](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#123) `  PROCEDURE This*(x, y: INTEGER): Frame;`
[128](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#128) `  PROCEDURE Mark(F: Frame; mode: INTEGER);`
[133](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#133) `  PROCEDURE Draw*(F: Frame);`
[138](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#138) `  PROCEDURE DrawNorm(F: Frame);`
[143](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#143) `  PROCEDURE Erase*(F: Frame);`
[148](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#148) `  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);`
[153](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#153) `  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);`
[158](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#158) `  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);`
[163](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#163) `  PROCEDURE FlipMark(x, y: INTEGER);`
[169](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#169) `  PROCEDURE Defocus*(F: Frame);`
[179](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#179) `  PROCEDURE Deselect*(F: Frame);`
[188](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#188) `  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);`
[211](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#211) `  PROCEDURE CaptionCopy(F: Frame;`
[232](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#232) `  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);`
[239](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#239) `  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);`
[324](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#324) `  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);`
[332](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#332) `  PROCEDURE InsertChar(F: Frame; ch: CHAR);`
[342](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#342) `  PROCEDURE DeleteChar(F: Frame);`
[357](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#357) `  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);`
[367](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#367) `  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);`
[425](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#425) `  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);`
[431](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#431) `  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);`
[440](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#440) `  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);`
[449](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#449) `  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);`
[469](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#469) `  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);`
[498](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#498) `  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);`
[518](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#518) `  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); `
