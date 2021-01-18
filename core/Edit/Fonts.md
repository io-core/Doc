
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

  ## Imports:
` SYSTEM Files`

## Constants:
```
 OriginalFontFileId = 0DBH;
        PaddedFontFileId = 0DCH;
     

```
## Types:
```
 Font* = POINTER TO FontDesc;
    RasterBlock = POINTER TO RasterBlockDesc;
    FontDesc* = RECORD
      name*: ARRAY 32 OF CHAR;
      height*, minX*, maxX*, minY*, maxY*: INTEGER;
      next*: Font;
      T1: ARRAY 64 OF INTEGER;
      block: RasterBlock;
    END;

    RasterBlockDesc = RECORD
      next: RasterBlock;
      offs: INTEGER;
      raster: ARRAY 1000 OF BYTE;
    END;

```
## Variables:
```
 Default*, root*: Font;
  FallbackPat: ARRAY 35 OF BYTE;

```
## Procedures:
---

`PROCEDURE ReadInt16(VAR R: Files.Rider; VAR r: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L29)


`PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L34)


`PROCEDURE FindSpace(B: RasterBlock; size, align: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L39)


`PROCEDURE OberonLoadRange(F: Font; rangeStart: INTEGER; f: Files.File; padded: BOOLEAN);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L54)


`PROCEDURE LoadRange(F: Font; rangeStart: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L162)


`PROCEDURE PatDot(x,y: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L175)


`PROCEDURE GetUniPat*(fnt: Font; codepoint: INTEGER; VAR dx, x, y, w, h, patadr: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L185)


`PROCEDURE This*(name: ARRAY OF CHAR): Font;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L230)


`PROCEDURE Free*;  (*remove all but first two from font list*)` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L305)

