
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

Procedures:

```
[28](https://github.com/io-core/Edit/blob/main/Fonts.Mod#28)    PROCEDURE Put(r: Raster; i, x: INTEGER);
```
```
[35](https://github.com/io-core/Edit/blob/main/Fonts.Mod#35)    PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);
```
```
[39](https://github.com/io-core/Edit/blob/main/Fonts.Mod#39)    PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);
```
```
[46](https://github.com/io-core/Edit/blob/main/Fonts.Mod#46)    PROCEDURE Load*(name: ARRAY OF CHAR): Font;
```
```
[54](https://github.com/io-core/Edit/blob/main/Fonts.Mod#54)      PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);
```
```
[111](https://github.com/io-core/Edit/blob/main/Fonts.Mod#111)    PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)
```
```
[115](https://github.com/io-core/Edit/blob/main/Fonts.Mod#115)    PROCEDURE Free*;  (*remove all but first two from font list*)
```
