
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

Procedures:


<code>  PROCEDURE Put(r: Raster; i, x: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L28)


<code>  PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L35)


<code>  PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L39)


<code>  PROCEDURE Load*(name: ARRAY OF CHAR): Font;</code> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L46)


<code>    PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);</code> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L54)


<code>  PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)</code> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L111)


<code>  PROCEDURE Free*;  (*remove all but first two from font list*)</code> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L115)

