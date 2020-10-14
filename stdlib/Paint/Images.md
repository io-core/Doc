
## [MODULE Images](https://github.com/io-core/Paint/blob/main/Images.Mod)

Procedures:

```
[93](https://github.com/io-core/Paint/blob/main/Images.Mod#93)    PROCEDURE New*(L: Layer);
```
```
[97](https://github.com/io-core/Paint/blob/main/Images.Mod#97)    PROCEDURE Add*(I: Image; L: Layer);
```
```
[102](https://github.com/io-core/Paint/blob/main/Images.Mod#102)    PROCEDURE ThisLayer*(I: Image; x, y: INTEGER): Layer;
```
```
[109](https://github.com/io-core/Paint/blob/main/Images.Mod#109)    PROCEDURE SelectLayer*(I: Image; L: Layer);
```
```
[114](https://github.com/io-core/Paint/blob/main/Images.Mod#114)    PROCEDURE SelectArea*(I: Image; x0, y0, x1, y1: INTEGER);
```
```
[128](https://github.com/io-core/Paint/blob/main/Images.Mod#128)    PROCEDURE Draw*(I: Image; VAR M: Msg);
```
```
[135](https://github.com/io-core/Paint/blob/main/Images.Mod#135)    PROCEDURE List*(I: Image);
```
```
[150](https://github.com/io-core/Paint/blob/main/Images.Mod#150)    PROCEDURE Deselect*(I: Image);
```
```
[156](https://github.com/io-core/Paint/blob/main/Images.Mod#156)    PROCEDURE DrawSel*(I: Image; VAR M: Msg);
```
```
[165](https://github.com/io-core/Paint/blob/main/Images.Mod#165)    PROCEDURE Change*(I: Image; VAR M: Msg);
```
```
[176](https://github.com/io-core/Paint/blob/main/Images.Mod#176)    PROCEDURE WriteFile*(I: Image; name: ARRAY OF CHAR);
```
```
[184](https://github.com/io-core/Paint/blob/main/Images.Mod#184)    PROCEDURE SetWidth*(w: INTEGER);
```
```
[189](https://github.com/io-core/Paint/blob/main/Images.Mod#189)    PROCEDURE LoadBmpLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
[195](https://github.com/io-core/Paint/blob/main/Images.Mod#195)    PROCEDURE LoadJpgLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
[201](https://github.com/io-core/Paint/blob/main/Images.Mod#201)    PROCEDURE LoadPngLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
[207](https://github.com/io-core/Paint/blob/main/Images.Mod#207)    PROCEDURE LoadPctLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
[213](https://github.com/io-core/Paint/blob/main/Images.Mod#213)    PROCEDURE Open*(I: Image; name: ARRAY OF CHAR);
```
```
[238](https://github.com/io-core/Paint/blob/main/Images.Mod#238)    PROCEDURE Delete*(I: Image);
```
```
[257](https://github.com/io-core/Paint/blob/main/Images.Mod#257)    PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg));
```
