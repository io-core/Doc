
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

  ## Imports:
` Files`

  ## Constants:
```
 FontFileId = 0DBH; A = 512;

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

```
  ## Variables:
```
 Default*, root*: Font;
  PROCEDURE Get(r: Raster; i: INTEGER; ## Variables:
```
 x: INTEGER);
  BEGIN x := ((r[i+3] * 100H + r[i+2]) * 100H + r[i+1]) * 100H + r[i]
  END Get;
  PROCEDURE GetPat*(fnt: Font; ch: CHAR; ## Variables:
```
 dx, x, y, w, h, patadr: INTEGER);
    ## Variables:
```
 pa: INTEGER; yb: BYTE;
    ## Variables:
```
 pa: INTEGER; yb: BYTE;
  BEGIN Get(fnt.raster, (ORD(ch) MOD 80H)*4, pa); patadr := fnt.base + pa;
    dx := fnt.raster[pa-3]; x := fnt.raster[pa-2]; yb := fnt.raster[pa-1]; w := fnt.raster[pa]; h := fnt.raster[pa+1];
    IF yb < 128 THEN y := yb ELSE y := yb - 256 END
  END GetPat;
    ## Variables:
```
 F: Font;
      f: Files.File; R: Files.Rider;
      NofRuns, NofBoxes, height, minX, maxX, minY, maxY, b: BYTE;
      NofBytes, j, k, m, n, a: INTEGER;
      run: ARRAY 16 OF RunRec;
      box: ARRAY 512 OF BoxRec;
    PROCEDURE RdInt16(## Variables:
```
 R: Files.Rider; ## Variables:
```
 b0: BYTE);
      ## Variables:
```
 b1: BYTE;
      ## Variables:
```
 b1: BYTE;
    BEGIN Files.ReadByte(R, b0); Files.ReadByte(R, b1)
    END RdInt16;
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

