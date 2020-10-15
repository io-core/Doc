
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

  ## Imports:
` Files`

## Procedures:
---

`  PROCEDURE Put(r: Raster; i, x: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L28)


`  PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L35)


`  PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L39)


`  PROCEDURE Load*(name: ARRAY OF CHAR): Font;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L46)


`    PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L54)


`  PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L111)


`  PROCEDURE Free*;  (*remove all but first two from font list*)` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L115)

