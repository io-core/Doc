
## [MODULE Images](https://github.com/io-core/Paint/blob/main/Images.Mod)

Procedures:


`  PROCEDURE New*(L: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L93)


`  PROCEDURE Add*(I: Image; L: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L97)


`  PROCEDURE ThisLayer*(I: Image; x, y: INTEGER): Layer;` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L102)


`  PROCEDURE SelectLayer*(I: Image; L: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L109)


`  PROCEDURE SelectArea*(I: Image; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L114)


`  PROCEDURE Draw*(I: Image; VAR M: Msg);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L128)


`  PROCEDURE List*(I: Image);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L135)


`  PROCEDURE Deselect*(I: Image);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L150)


`  PROCEDURE DrawSel*(I: Image; VAR M: Msg);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L156)


`  PROCEDURE Change*(I: Image; VAR M: Msg);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L165)


`  PROCEDURE WriteFile*(I: Image; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L176)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L184)


`  PROCEDURE LoadBmpLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L189)


`  PROCEDURE LoadJpgLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L195)


`  PROCEDURE LoadPngLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L201)


`  PROCEDURE LoadPctLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L207)


`  PROCEDURE Open*(I: Image; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L213)


`  PROCEDURE Delete*(I: Image);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L238)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg));` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L257)

