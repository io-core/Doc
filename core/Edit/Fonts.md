
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

Procedures:

[](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L28) `  PROCEDURE Put(r: Raster; i, x: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L35) `  PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L39) `  PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L46) `  PROCEDURE Load*(name: ARRAY OF CHAR): Font;`
[](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L54) `    PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);`
[](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L111) `  PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)`
[](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L115) `  PROCEDURE Free*;  (*remove all but first two from font list*)`
