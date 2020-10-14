
## [MODULE ImageFrames](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

Procedures:

[75](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#75) `  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)`
[84](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#84) `  PROCEDURE Restore*(F: Frame);`
[101](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#101) `  PROCEDURE FlipCross(X, Y: INTEGER);`
[112](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#112) `  PROCEDURE Focus*(): Frame;`
[117](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#117) `  PROCEDURE Selected*(): Frame;`
[122](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#122) `  PROCEDURE This*(x, y: INTEGER): Frame;`
[127](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#127) `  PROCEDURE Mark(F: Frame; mode: INTEGER);`
[132](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#132) `  PROCEDURE Draw*(F: Frame);`
[137](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#137) `  PROCEDURE DrawNorm(F: Frame);`
[142](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#142) `  PROCEDURE Erase*(F: Frame);`
[147](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#147) `  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);`
[152](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#152) `  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);`
[157](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#157) `  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);`
[162](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#162) `  PROCEDURE FlipMark(x, y: INTEGER);`
[168](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#168) `  PROCEDURE Defocus*(F: Frame);`
[178](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#178) `  PROCEDURE Deselect*(F: Frame);`
[187](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#187) `  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);`
[282](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#282) `  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);`
[290](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#290) `  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);`
[300](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#300) `  PROCEDURE DeleteChar(F: Frame);`
[321](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#321) `  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);`
[331](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#331) `  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);`
[391](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#391) `  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);`
[397](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#397) `  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);`
[406](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#406) `  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);`
[415](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#415) `  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);`
[437](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#437) `  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);`
[469](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#469) `  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);`
[492](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#492) `  PROCEDURE Open*(F: Frame; I: Images.Image);`
