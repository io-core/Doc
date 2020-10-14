
## [MODULE ImageFrames](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

Procedures:


<code>  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L75)


<code>  PROCEDURE Restore*(F: Frame);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L84)


<code>  PROCEDURE FlipCross(X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L101)


<code>  PROCEDURE Focus*(): Frame;</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L112)


<code>  PROCEDURE Selected*(): Frame;</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L117)


<code>  PROCEDURE This*(x, y: INTEGER): Frame;</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L122)


<code>  PROCEDURE Mark(F: Frame; mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L127)


<code>  PROCEDURE Draw*(F: Frame);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L132)


<code>  PROCEDURE DrawNorm(F: Frame);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L137)


<code>  PROCEDURE Erase*(F: Frame);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L142)


<code>  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L147)


<code>  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L152)


<code>  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L157)


<code>  PROCEDURE FlipMark(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L162)


<code>  PROCEDURE Defocus*(F: Frame);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L168)


<code>  PROCEDURE Deselect*(F: Frame);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L178)


<code>  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L187)


<code>  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L282)


<code>  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L290)


<code>  PROCEDURE DeleteChar(F: Frame);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L300)


<code>  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L321)


<code>  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L331)


<code>  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L391)


<code>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L397)


<code>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L406)


<code>  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L415)


<code>  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L437)


<code>  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L469)


<code>  PROCEDURE Open*(F: Frame; I: Images.Image);</code> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L492)

