
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

  ## Imports:
` Files`

## Constants:
```
 FontFileId = 0DBH; A = 512;

  TYPE Raster = POINTER TO RasterDesc;
```
## Types:
```
 Raster = POINTER TO RasterDesc;
    RasterDesc = ARRAY OF BYTE;

    Font* = POINTER TO FontDesc;
    FontDesc* = RECORD
      name*: ARRAY 32 OF CHAR;
      height*, minX*, maxX*, minY*, maxY*, base: INTEGER;
      next*: Font;
      raster: Raster
    END ;

    RunRec = RECORD beg, end: BYTE END ;
    BoxRec = RECORD dx, x, y, w, h: BYTE END ;

  (* raster sizes: Syntax8 1367, Syntax10 1628, Syntax12 1688, Syntax14 1843, Syntax14b 1983,
      Syntax16 2271, Syntax20 3034, Syntac24 4274, Syntax24b 4302  *)

  VAR Default*, root*: Font;
```
## Variables:
```
 Default*, root*: Font;

```
## Procedures:
---

`  PROCEDURE Put(r: Raster; i, x: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L28)


`  PROCEDURE Get(r: Raster; i: INTEGER; VAR x: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L35)


`  PROCEDURE GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L39)


`  PROCEDURE Load*(name: ARRAY OF CHAR): Font;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L46)


`    PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L54)


`  PROCEDURE This*(name: ARRAY OF CHAR): Font;  (*for backward compatibility*)` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L111)


`  PROCEDURE Free*;  (*remove all but first two from font list*)` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L115)

