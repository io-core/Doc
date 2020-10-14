
## [MODULE PackageFrames](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod)

Procedures:


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L75) `  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L84) `  PROCEDURE Restore*(f: Frame);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L101) `  PROCEDURE FlipCross(X, Y: INTEGER);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L112) `  PROCEDURE Focus*(): Frame;`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L117) `  PROCEDURE Selected*(): Frame;`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L122) `  PROCEDURE This*(x, y: INTEGER): Frame;`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L127) `  PROCEDURE Mark(f: Frame; mode: INTEGER);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L132) `  PROCEDURE Draw*(f: Frame);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L137) `  PROCEDURE DrawNorm(f: Frame);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L142) `  PROCEDURE Erase*(f: Frame);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L147) `  PROCEDURE DrawComponent*(f: Frame; L: Packages.Component);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L152) `  PROCEDURE EraseComponent*(f: Frame; C: Packages.Component);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L157) `  PROCEDURE Change*(f: Frame; VAR msg: Packages.Msg);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L162) `  PROCEDURE FlipMark(x, y: INTEGER);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L168) `  PROCEDURE Defocus*(f: Frame);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L178) `  PROCEDURE Deselect*(f: Frame);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L187) `  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L282) `  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L290) `  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L300) `  PROCEDURE DeleteChar(f: Frame);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L321) `  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L331) `  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L391) `  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L397) `  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L406) `  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L415) `  PROCEDURE DrawLine(obj: Packages.Component; VAR m: Packages.Msg);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L437) `  PROCEDURE DrawCaption(obj: Packages.Component; VAR m: Packages.Msg);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L469) `  PROCEDURE DrawMacro(obj: Packages.Component; VAR m: Packages.Msg);`


[(src)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L492) `  PROCEDURE Open*(f: Frame; P: Packages.Package);`

