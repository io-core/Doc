
## [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

  ## Imports:
` SYSTEM Files`

## Constants:
```
 FontFileId = 0DBH;
        PcfFileId = 01H;

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

    tocEntry = RECORD
        typ:    INTEGER;
        format: INTEGER;
        size:   INTEGER;
        offset: INTEGER
    END;

    tocTable = POINTER TO tocTableDesc;
    tocTableDesc = RECORD
      PROPERTIES:       POINTER TO tocEntry;
      ACCELERATORS:     POINTER TO tocEntry;
      METRICS:          POINTER TO tocEntry;
      BITMAPS:         POINTER TO tocEntry;
      INKMETRICS:      POINTER TO tocEntry;
      BDFENCODINGS:    POINTER TO tocEntry;
      SWIDTHS:         POINTER TO tocEntry;
      GLYPHNAMES:     POINTER TO tocEntry;
      BDFACCELERATORS:  POINTER TO tocEntry
    END;

    Metrics = RECORD
        l,r,w,a,d: INTEGER
    END;
    
```
## Variables:
```
 Default*, root*: Font;
  FallbackPat: ARRAY 35 OF BYTE;

```
## Procedures:
---

`PROCEDURE ReadInt16(VAR R: Files.Rider; VAR r: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L52)


`PROCEDURE ReadBeInt16(VAR R: Files.Rider; VAR r: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L57)


`PROCEDURE ReadBeInt32(VAR R: Files.Rider; VAR r: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L62)


`PROCEDURE RdInt16(VAR R: Files.Rider; VAR b0: BYTE);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L68)


`PROCEDURE RdL32(VAR R: Files.Rider): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L73)


`PROCEDURE Reverse(b:BYTE): BYTE;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L85)


`PROCEDURE FindSpace(B: RasterBlock; size, align: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L94)


`PROCEDURE OberonLoadRange(F: Font; rangeStart: INTEGER; f: Files.File);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L109)


`PROCEDURE PCFGetTable(f: Files.File): tocTable;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L189)


`PROCEDURE PCFLoadRange(F: Font; rangeStart: INTEGER; f: Files.File);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L230)


`PROCEDURE LoadRange(F: Font; rangeStart: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L343)


`PROCEDURE PatDot(x,y: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L361)


`PROCEDURE GetUniPat*(fnt: Font; codepoint: INTEGER; VAR dx, x, y, w, h, patadr: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L371)


`PROCEDURE This*(name: ARRAY OF CHAR): Font;` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L416)


`PROCEDURE Free*;  (*remove all but first two from font list*)` [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod#L514)

