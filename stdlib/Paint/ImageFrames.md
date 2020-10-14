
## [MODULE ImageFrames](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

Procedures:


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L75) `  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L84) `  PROCEDURE Restore*(F: Frame);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L101) `  PROCEDURE FlipCross(X, Y: INTEGER);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L112) `  PROCEDURE Focus*(): Frame;`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L117) `  PROCEDURE Selected*(): Frame;`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L122) `  PROCEDURE This*(x, y: INTEGER): Frame;`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L127) `  PROCEDURE Mark(F: Frame; mode: INTEGER);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L132) `  PROCEDURE Draw*(F: Frame);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L137) `  PROCEDURE DrawNorm(F: Frame);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L142) `  PROCEDURE Erase*(F: Frame);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L147) `  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L152) `  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L157) `  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L162) `  PROCEDURE FlipMark(x, y: INTEGER);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L168) `  PROCEDURE Defocus*(F: Frame);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L178) `  PROCEDURE Deselect*(F: Frame);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L187) `  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L282) `  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L290) `  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L300) `  PROCEDURE DeleteChar(F: Frame);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L321) `  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L331) `  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L391) `  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L397) `  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L406) `  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L415) `  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L437) `  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L469) `  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);`


[(src)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L492) `  PROCEDURE Open*(F: Frame; I: Images.Image);`

