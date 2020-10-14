
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

Procedures:


[(src)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L28) `  PROCEDURE Put(r: Raster; i, x: INTEGER);`

[(src)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L35) `  PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);`

[(src)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L39) `  PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);`

[(src)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L46) `  PROCEDURE Load*(name: ARRAY OF CHAR): Font;`

[(src)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L54) `    PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);`

[(src)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L111) `  PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)`

[(src)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L115) `  PROCEDURE Free*;  (*remove all but first two from font list*)`
