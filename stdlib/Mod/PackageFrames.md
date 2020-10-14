
## [MODULE PackageFrames](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod)

Procedures:


<code>  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L75)


<code>  PROCEDURE Restore*(f: Frame);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L84)


<code>  PROCEDURE FlipCross(X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L101)


<code>  PROCEDURE Focus*(): Frame;</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L112)


<code>  PROCEDURE Selected*(): Frame;</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L117)


<code>  PROCEDURE This*(x, y: INTEGER): Frame;</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L122)


<code>  PROCEDURE Mark(f: Frame; mode: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L127)


<code>  PROCEDURE Draw*(f: Frame);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L132)


<code>  PROCEDURE DrawNorm(f: Frame);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L137)


<code>  PROCEDURE Erase*(f: Frame);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L142)


<code>  PROCEDURE DrawComponent*(f: Frame; L: Packages.Component);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L147)


<code>  PROCEDURE EraseComponent*(f: Frame; C: Packages.Component);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L152)


<code>  PROCEDURE Change*(f: Frame; VAR msg: Packages.Msg);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L157)


<code>  PROCEDURE FlipMark(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L162)


<code>  PROCEDURE Defocus*(f: Frame);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L168)


<code>  PROCEDURE Deselect*(f: Frame);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L178)


<code>  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L187)


<code>  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L282)


<code>  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L290)


<code>  PROCEDURE DeleteChar(f: Frame);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L300)


<code>  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L321)


<code>  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L331)


<code>  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L391)


<code>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L397)


<code>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L406)


<code>  PROCEDURE DrawLine(obj: Packages.Component; VAR m: Packages.Msg);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L415)


<code>  PROCEDURE DrawCaption(obj: Packages.Component; VAR m: Packages.Msg);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L437)


<code>  PROCEDURE DrawMacro(obj: Packages.Component; VAR m: Packages.Msg);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L469)


<code>  PROCEDURE Open*(f: Frame; P: Packages.Package);</code> [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L492)

