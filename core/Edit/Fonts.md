
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

Procedures:

```
  PROCEDURE Put(r: Raster; i, x: INTEGER);
```
```
  PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);
```
```
  PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);
```
```
  PROCEDURE Load*(name: ARRAY OF CHAR): Font;
```
```
    PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);
```
```
  PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)
```
```
  PROCEDURE Free*;  (*remove all but first two from font list*)
```
