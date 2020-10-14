
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

Procedures:


<pre>  PROCEDURE Put(r: Raster; i, x: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L28)


<pre>  PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L35)


<pre>  PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L39)


<pre>  PROCEDURE Load*(name: ARRAY OF CHAR): Font;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L46)


<pre>    PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L54)


<pre>  PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L111)


<pre>  PROCEDURE Free*;  (*remove all but first two from font list*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L115)

