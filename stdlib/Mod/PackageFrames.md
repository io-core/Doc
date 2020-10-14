
## [MODULE PackageFrames](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod)

Procedures:


<pre>  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L75)


<pre>  PROCEDURE Restore*(f: Frame);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L84)


<pre>  PROCEDURE FlipCross(X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L101)


<pre>  PROCEDURE Focus*(): Frame;</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L112)


<pre>  PROCEDURE Selected*(): Frame;</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L117)


<pre>  PROCEDURE This*(x, y: INTEGER): Frame;</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L122)


<pre>  PROCEDURE Mark(f: Frame; mode: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L127)


<pre>  PROCEDURE Draw*(f: Frame);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L132)


<pre>  PROCEDURE DrawNorm(f: Frame);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L137)


<pre>  PROCEDURE Erase*(f: Frame);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L142)


<pre>  PROCEDURE DrawComponent*(f: Frame; L: Packages.Component);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L147)


<pre>  PROCEDURE EraseComponent*(f: Frame; C: Packages.Component);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L152)


<pre>  PROCEDURE Change*(f: Frame; VAR msg: Packages.Msg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L157)


<pre>  PROCEDURE FlipMark(x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L162)


<pre>  PROCEDURE Defocus*(f: Frame);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L168)


<pre>  PROCEDURE Deselect*(f: Frame);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L178)


<pre>  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L187)


<pre>  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L282)


<pre>  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L290)


<pre>  PROCEDURE DeleteChar(f: Frame);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L300)


<pre>  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L321)


<pre>  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L331)


<pre>  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L391)


<pre>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L397)


<pre>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L406)


<pre>  PROCEDURE DrawLine(obj: Packages.Component; VAR m: Packages.Msg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L415)


<pre>  PROCEDURE DrawCaption(obj: Packages.Component; VAR m: Packages.Msg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L437)


<pre>  PROCEDURE DrawMacro(obj: Packages.Component; VAR m: Packages.Msg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L469)


<pre>  PROCEDURE Open*(f: Frame; P: Packages.Package);</pre> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L492)

