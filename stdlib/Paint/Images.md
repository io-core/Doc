
## [MODULE Images](https://github.com/io-core/Paint/blob/main/Images.Mod)

Procedures:

```
  PROCEDURE New*(L: Layer);
```
```
  PROCEDURE Add*(I: Image; L: Layer);
```
```
  PROCEDURE ThisLayer*(I: Image; x, y: INTEGER): Layer;
```
```
  PROCEDURE SelectLayer*(I: Image; L: Layer);
```
```
  PROCEDURE SelectArea*(I: Image; x0, y0, x1, y1: INTEGER);
```
```
  PROCEDURE Draw*(I: Image; VAR M: Msg);
```
```
  PROCEDURE List*(I: Image);
```
```
  PROCEDURE Deselect*(I: Image);
```
```
  PROCEDURE DrawSel*(I: Image; VAR M: Msg);
```
```
  PROCEDURE Change*(I: Image; VAR M: Msg);
```
```
  PROCEDURE WriteFile*(I: Image; name: ARRAY OF CHAR);
```
```
  PROCEDURE SetWidth*(w: INTEGER);
```
```
  PROCEDURE LoadBmpLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
  PROCEDURE LoadJpgLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
  PROCEDURE LoadPngLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
  PROCEDURE LoadPctLayer(VAR R: Files.Rider; VAR flyr: Layer);
```
```
  PROCEDURE Open*(I: Image; name: ARRAY OF CHAR);
```
```
  PROCEDURE Delete*(I: Image);
```
```
  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg));
```
