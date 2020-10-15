
## [MODULE PackageFrames](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod)

  ## Imports:
` SYSTEM Display Viewers Input Fonts Texts Packages Oberon MenuViewers`

  ## Constants:
```
 (*update message ids*)
    drawcomponent = 1; drawcomponents = 2; drawcomponentd = 3;
    drawnorm = 4; drawsel = 5; drawdel = 6;

    markW = 5;

```
## Procedures:
---

`  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L75)


`  PROCEDURE Restore*(f: Frame);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L84)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L101)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L112)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L117)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L122)


`  PROCEDURE Mark(f: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L127)


`  PROCEDURE Draw*(f: Frame);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L132)


`  PROCEDURE DrawNorm(f: Frame);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L137)


`  PROCEDURE Erase*(f: Frame);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L142)


`  PROCEDURE DrawComponent*(f: Frame; L: Packages.Component);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L147)


`  PROCEDURE EraseComponent*(f: Frame; C: Packages.Component);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L152)


`  PROCEDURE Change*(f: Frame; VAR msg: Packages.Msg);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L157)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L162)


`  PROCEDURE Defocus*(f: Frame);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L168)


`  PROCEDURE Deselect*(f: Frame);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L178)


`  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L187)


`  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L282)


`  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L290)


`  PROCEDURE DeleteChar(f: Frame);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L300)


`  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L321)


`  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L331)


`  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L391)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L397)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L406)


`  PROCEDURE DrawLine(obj: Packages.Component; VAR m: Packages.Msg);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L415)


`  PROCEDURE DrawCaption(obj: Packages.Component; VAR m: Packages.Msg);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L437)


`  PROCEDURE DrawMacro(obj: Packages.Component; VAR m: Packages.Msg);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L469)


`  PROCEDURE Open*(f: Frame; P: Packages.Package);` [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#L492)

