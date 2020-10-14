
## [MODULE Images](https://github.com/io-core/Paint/blob/main/Images.Mod)

Procedures:


<code>  PROCEDURE New*(L: Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L93)


<code>  PROCEDURE Add*(I: Image; L: Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L97)


<code>  PROCEDURE ThisLayer*(I: Image; x, y: INTEGER): Layer;</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L102)


<code>  PROCEDURE SelectLayer*(I: Image; L: Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L109)


<code>  PROCEDURE SelectArea*(I: Image; x0, y0, x1, y1: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L114)


<code>  PROCEDURE Draw*(I: Image; VAR M: Msg);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L128)


<code>  PROCEDURE List*(I: Image);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L135)


<code>  PROCEDURE Deselect*(I: Image);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L150)


<code>  PROCEDURE DrawSel*(I: Image; VAR M: Msg);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L156)


<code>  PROCEDURE Change*(I: Image; VAR M: Msg);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L165)


<code>  PROCEDURE WriteFile*(I: Image; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L176)


<code>  PROCEDURE SetWidth*(w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L184)


<code>  PROCEDURE LoadBmpLayer(VAR R: Files.Rider; VAR flyr: Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L189)


<code>  PROCEDURE LoadJpgLayer(VAR R: Files.Rider; VAR flyr: Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L195)


<code>  PROCEDURE LoadPngLayer(VAR R: Files.Rider; VAR flyr: Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L201)


<code>  PROCEDURE LoadPctLayer(VAR R: Files.Rider; VAR flyr: Layer);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L207)


<code>  PROCEDURE Open*(I: Image; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L213)


<code>  PROCEDURE Delete*(I: Image);</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L238)


<code>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg));</code> [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L257)

