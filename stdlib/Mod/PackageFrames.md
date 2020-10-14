
## [MODULE PackageFrames](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod)

Procedures:

```
[75](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#75)    PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)
```
```
[84](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#84)    PROCEDURE Restore*(f: Frame);
```
```
[101](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#101)    PROCEDURE FlipCross(X, Y: INTEGER);
```
```
[112](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#112)    PROCEDURE Focus*(): Frame;
```
```
[117](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#117)    PROCEDURE Selected*(): Frame;
```
```
[122](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#122)    PROCEDURE This*(x, y: INTEGER): Frame;
```
```
[127](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#127)    PROCEDURE Mark(f: Frame; mode: INTEGER);
```
```
[132](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#132)    PROCEDURE Draw*(f: Frame);
```
```
[137](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#137)    PROCEDURE DrawNorm(f: Frame);
```
```
[142](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#142)    PROCEDURE Erase*(f: Frame);
```
```
[147](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#147)    PROCEDURE DrawComponent*(f: Frame; L: Packages.Component);
```
```
[152](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#152)    PROCEDURE EraseComponent*(f: Frame; C: Packages.Component);
```
```
[157](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#157)    PROCEDURE Change*(f: Frame; VAR msg: Packages.Msg);
```
```
[162](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#162)    PROCEDURE FlipMark(x, y: INTEGER);
```
```
[168](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#168)    PROCEDURE Defocus*(f: Frame);
```
```
[178](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#178)    PROCEDURE Deselect*(f: Frame);
```
```
[187](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#187)    PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);
```
```
[282](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#282)    PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);
```
```
[290](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#290)    PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);
```
```
[300](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#300)    PROCEDURE DeleteChar(f: Frame);
```
```
[321](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#321)    PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);
```
```
[331](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#331)    PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);
```
```
[391](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#391)    PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);
```
```
[397](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#397)    PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);
```
```
[406](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#406)    PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);
```
```
[415](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#415)    PROCEDURE DrawLine(obj: Packages.Component; VAR m: Packages.Msg);
```
```
[437](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#437)    PROCEDURE DrawCaption(obj: Packages.Component; VAR m: Packages.Msg);
```
```
[469](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#469)    PROCEDURE DrawMacro(obj: Packages.Component; VAR m: Packages.Msg);
```
```
[492](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod#492)    PROCEDURE Open*(f: Frame; P: Packages.Package);
```
