
## [MODULE Images](https://github.com/io-core/Paint/blob/main/Images.Mod)

Procedures:


<pre>  PROCEDURE New*(L: Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L93)


<pre>  PROCEDURE Add*(I: Image; L: Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L97)


<pre>  PROCEDURE ThisLayer*(I: Image; x, y: INTEGER): Layer;</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L102)


<pre>  PROCEDURE SelectLayer*(I: Image; L: Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L109)


<pre>  PROCEDURE SelectArea*(I: Image; x0, y0, x1, y1: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L114)


<pre>  PROCEDURE Draw*(I: Image; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L128)


<pre>  PROCEDURE List*(I: Image);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L135)


<pre>  PROCEDURE Deselect*(I: Image);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L150)


<pre>  PROCEDURE DrawSel*(I: Image; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L156)


<pre>  PROCEDURE Change*(I: Image; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L165)


<pre>  PROCEDURE WriteFile*(I: Image; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L176)


<pre>  PROCEDURE SetWidth*(w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L184)


<pre>  PROCEDURE LoadBmpLayer(VAR R: Files.Rider; VAR flyr: Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L189)


<pre>  PROCEDURE LoadJpgLayer(VAR R: Files.Rider; VAR flyr: Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L195)


<pre>  PROCEDURE LoadPngLayer(VAR R: Files.Rider; VAR flyr: Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L201)


<pre>  PROCEDURE LoadPctLayer(VAR R: Files.Rider; VAR flyr: Layer);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L207)


<pre>  PROCEDURE Open*(I: Image; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L213)


<pre>  PROCEDURE Delete*(I: Image);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L238)


<pre>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg));</pre> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L257)

