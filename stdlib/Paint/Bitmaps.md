
## [MODULE Bitmaps](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod)

## Imports:
` SYSTEM Kernel Oberon`

```
## Types:
```

  Bitmap* = POINTER TO BitmapDesc;
  BitmapDesc* = RECORD
    width*, height*, depth*: INTEGER;
    base*, size* : INTEGER
  END;

PROCEDURE New*(B: Bitmap; w, h, dpt: INTEGER) : Bitmap;
BEGIN (*
  IF B = NIL THEN NEW(B) END;
  IF B # NIL THEN
      B.width := w; B.height := h; B.depth := dpt;
      B.size := (w+31) DIV 32 * 4 * h; (*bitmap size in bytes, word aligned*)
      Memory.New(SYSTEM.VAL(Memory.Pointer, B.base), B.size);
      IF B.base = 0 THEN B := NIL END
  END *)
  RETURN B 
END New;

PROCEDURE Get*(B: Bitmap; x, y: INTEGER): INTEGER;
```
## Variables:
```
 ofs, wd: INTEGER; bt: BYTE;
BEGIN (*
  ofs := y*B.width + x; SYSTEM.GET(B.base + ofs, bt);
  wd :=  bt; *)
  RETURN wd 
END Get;

```
## Procedures:
---

`PROCEDURE New*(B: Bitmap; w, h, dpt: INTEGER) : Bitmap;` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L11)


`PROCEDURE Get*(B: Bitmap; x, y: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L23)


`PROCEDURE Clear*(B: Bitmap);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L31)


`PROCEDURE Dot*(B: Bitmap; col, x, y, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L43)


`PROCEDURE Src2Pix(x, w, src: INTEGER; VAR pix1, pix2: SET);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L60)


`PROCEDURE Const2Pix(x, w, con: INTEGER; VAR pix1, pix2: SET);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L80)


`PROCEDURE CopyPLine(x, src, dst, w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L100)


`PROCEDURE ReplBLine0(col, x, dst, w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L120)


`PROCEDURE CopyBLine1(x, src, dst, w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L143)


`PROCEDURE CopyBLine0(x, src, dst, w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L159)


`PROCEDURE CopyBLine2(x, src, dst, w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L169)


`PROCEDURE CopyBlock*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L183)


`PROCEDURE CopyPattern*(B: Bitmap; col, pat, x, y, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L209)


`PROCEDURE ReplPattern*(B: Bitmap; col, pat, X, Y, W, H, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L225)


`PROCEDURE ReplConst*(B: Bitmap; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L249)


`PROCEDURE DisplayBlock*(B: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L264)


`PROCEDURE GetPix*(VAR a: INTEGER; VAR bt: BYTE; depth: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L291)


`PROCEDURE PutPix*(VAR a, x: INTEGER; bt: BYTE; depth: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L308)


`PROCEDURE Copy*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L317)


`PROCEDURE PutLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L323)


`PROCEDURE GetLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L335)

