
## [MODULE Images](https://github.com/io-core/Paint/blob/main/Images.Mod)

Procedures:


[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L93) `  PROCEDURE New*(L: Layer);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L97) `  PROCEDURE Add*(I: Image; L: Layer);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L102) `  PROCEDURE ThisLayer*(I: Image; x, y: INTEGER): Layer;`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L109) `  PROCEDURE SelectLayer*(I: Image; L: Layer);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L114) `  PROCEDURE SelectArea*(I: Image; x0, y0, x1, y1: INTEGER);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L128) `  PROCEDURE Draw*(I: Image; VAR M: Msg);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L135) `  PROCEDURE List*(I: Image);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L150) `  PROCEDURE Deselect*(I: Image);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L156) `  PROCEDURE DrawSel*(I: Image; VAR M: Msg);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L165) `  PROCEDURE Change*(I: Image; VAR M: Msg);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L176) `  PROCEDURE WriteFile*(I: Image; name: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L184) `  PROCEDURE SetWidth*(w: INTEGER);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L189) `  PROCEDURE LoadBmpLayer(VAR R: Files.Rider; VAR flyr: Layer);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L195) `  PROCEDURE LoadJpgLayer(VAR R: Files.Rider; VAR flyr: Layer);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L201) `  PROCEDURE LoadPngLayer(VAR R: Files.Rider; VAR flyr: Layer);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L207) `  PROCEDURE LoadPctLayer(VAR R: Files.Rider; VAR flyr: Layer);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L213) `  PROCEDURE Open*(I: Image; name: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L238) `  PROCEDURE Delete*(I: Image);`

[(src)](https://github.com/io-core/Paint/blob/main/Images.Mod#L257) `  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg));`
