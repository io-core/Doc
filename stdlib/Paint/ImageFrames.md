
## [MODULE ImageFrames](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

Procedures:


<pre>  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L75)


<pre>  PROCEDURE Restore*(F: Frame);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L84)


<pre>  PROCEDURE FlipCross(X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L101)


<pre>  PROCEDURE Focus*(): Frame;</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L112)


<pre>  PROCEDURE Selected*(): Frame;</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L117)


<pre>  PROCEDURE This*(x, y: INTEGER): Frame;</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L122)


<pre>  PROCEDURE Mark(F: Frame; mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L127)


<pre>  PROCEDURE Draw*(F: Frame);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L132)


<pre>  PROCEDURE DrawNorm(F: Frame);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L137)


<pre>  PROCEDURE Erase*(F: Frame);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L142)


<pre>  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L147)


<pre>  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L152)


<pre>  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L157)


<pre>  PROCEDURE FlipMark(x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L162)


<pre>  PROCEDURE Defocus*(F: Frame);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L168)


<pre>  PROCEDURE Deselect*(F: Frame);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L178)


<pre>  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L187)


<pre>  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L282)


<pre>  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L290)


<pre>  PROCEDURE DeleteChar(F: Frame);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L300)


<pre>  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L321)


<pre>  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L331)


<pre>  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L391)


<pre>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L397)


<pre>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L406)


<pre>  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L415)


<pre>  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L437)


<pre>  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L469)


<pre>  PROCEDURE Open*(F: Frame; I: Images.Image);</pre> [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L492)

