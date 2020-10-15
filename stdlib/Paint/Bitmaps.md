
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
 ## Variables:
```
 adr, size: INTEGER;
BEGIN (*
  size := B.size;  adr := B.base;
  WHILE size > 0 DO
    (* 0101.. bit pattern for tests *)
    SYSTEM.PUT(adr, SYSTEM.VAL(INTEGER, 0AAAAAAAAH));
    (*SYSTEM.PUT(adr, SYSTEM.VAL(INTEGER, 0));*)
    INC(adr, 4);  DEC(size, 4)
  END *)
END Clear;
  ## Variables:
```
 a, w, bw: INTEGER; u, s: SET;
BEGIN (* w := B.width;
    bw := (w+31) DIV 32 * 4;   (* number of bytes on bitmap line, word aligned *)
    a := B.base + y*bw + (x DIV 32)*4;        (* address of bitmap word *)
    s := {x MOD 32}; SYSTEM.GET(a, u);
PROCEDURE Src2Pix(x, w, src: INTEGER; ## Variables:
```
 pix1, pix2: SET);
  ## Variables:
```
 x0, w0: INTEGER;
  ## Variables:
```
 x0, w0: INTEGER;
BEGIN
PROCEDURE Const2Pix(x, w, con: INTEGER; ## Variables:
```
 pix1, pix2: SET);
  ## Variables:
```
 x0, w0: INTEGER;
  ## Variables:
```
 x0, w0: INTEGER;
BEGIN
  ## Variables:
```
 bt: BYTE; wd: INTEGER; pix1, pix2, pix: SET;
BEGIN
(*
  (*build pattern line; w < 32*)
  SYSTEM.GET(src, bt); INC(src); wd := bt;
  IF w > 8 THEN SYSTEM.GET(src, bt); INC(src); wd := bt*100H + wd;
    IF w > 16 THEN SYSTEM.GET(src, bt); INC(src); wd := bt*10000H + wd;
      IF w > 24 THEN SYSTEM.GET(src, bt); INC(src); wd := bt*1000000H + wd END
    END
  END;
  ## Variables:
```
 pix1, pix2, pix: SET;
BEGIN
(*
  WHILE w > 0 DO
  ## Variables:
```
 pix1, pix2, pix: SET;
BEGIN
(*
  WHILE w > 0 DO
  ## Variables:
```
 pix1, pix2, pix: SET;
BEGIN
(*
  WHILE w > 0 DO
  ## Variables:
```
 w0, bw, src, dst: INTEGER;
BEGIN (* w0 := sB.width;
  bw := (w0+31) DIV 32 * 4;   (* number of bytes on bitmap line, word aligned *)
  src := sB.base + sy*bw + (sx DIV 32)*4;     (* source bottom left bitmap byte *);
  dst := dB.base + dy*bw + (dx DIV 32)*4;   (* destination *)
  ## Variables:
```
 dst: INTEGER; w, h, pw, bw: BYTE;
BEGIN (*
  SYSTEM.GET(pat, w); SYSTEM.GET(pat+1, h); INC(pat, 2);
  ## Variables:
```
 x, y, pat0, dst: INTEGER; w, h, h0, nx, ny, pw, bw: BYTE;
BEGIN (*
  SYSTEM.GET(pat, w); SYSTEM.GET(pat+1, h); INC(pat, 2);
  h0 := h; pat0 := pat;
  ## Variables:
```
 w0, bw, dst: INTEGER;
BEGIN (*
  w0 := B.width;
  bw := (w0+31) DIV 32 * 4;        (* number of bytes on bitmap line, word aligned *)
  dst := B.base + y*bw + (x DIV 32)*4;        (* bottom left address of bitmap raster *)
  IF mode = Display.replace THEN
    REPEAT
      ReplBLine0(col, x, dst, w);
      DEC(h);  INC(dst, bw)
    UNTIL h = 0
  END
*)
END ReplConst;
  ## Variables:
```
 bw, src, dst: INTEGER;
BEGIN (*
  bw := (w+31) DIV 32 * 4;         (* number of bytes on bitmap line, word aligned *)
  src := B.base;
  dy := Display.Height-dy-h;  (* convert dy to screen coordinate 0,0 = bottom,left *)
  dst := Display.Base + dy*dbw + (dx DIV 32)*4;               (* addr bottom left byte *)
PROCEDURE GetPix*(## Variables:
```
 a: INTEGER; ## Variables:
```
 bt: BYTE; depth: INTEGER);
BEGIN
(*
  SYSTEM.GET(a, bt); INC(a)
*)
END GetPix;
(*PROCEDURE PutPix*(a: INTEGER; ## Variables:
```
 x: INTEGER; bt: BYTE; depth: INTEGER);
  ## Variables:
```
 i: BYTE; u, s: SET;
  ## Variables:
```
 i: BYTE; u, s: SET;
BEGIN 
  FOR i := 0 TO 7 DO
    s := {x MOD 32}; SYSTEM.GET(a, u);
    IF ODD(bt) THEN SYSTEM.PUT(a, u + s) ELSE SYSTEM.PUT(a, u - s) END;
    INC(x); bt := bt DIV 2
  END
END PutPix;*)
PROCEDURE PutPix*(## Variables:
```
 a, x: INTEGER; bt: BYTE; depth: INTEGER);
  ## Variables:
```
 wd: INTEGER; u, s: SET;
  ## Variables:
```
 wd: INTEGER; u, s: SET;
BEGIN (*
  wd := bt; s := SYSTEM.VAL(SET, LSL(wd, x MOD 32));
  SYSTEM.GET(a, u); SYSTEM.PUT(a, u + s);
  INC(a); INC(x, 8)
*)
END PutPix;
PROCEDURE PutLine*(B: Bitmap; ## Variables:
```
 data: ARRAY OF INTEGER; x, y, w: INTEGER);
  ## Variables:
```
 dst, src, i: INTEGER; bt: BYTE;
  ## Variables:
```
 dst, src, i: INTEGER; bt: BYTE;
BEGIN (*
  src := SYSTEM.ADR(data[0]); dst := B.base + y*B.width + x; i := w;
  WHILE i > 0 DO
    SYSTEM.GET(src, bt); SYSTEM.PUT(dst, bt);
    INC(src, 2); INC(dst);
    DEC(i)
  END
*)
END PutLine;
PROCEDURE GetLine*(B: Bitmap; ## Variables:
```
 data: ARRAY OF INTEGER; x, y, w: INTEGER);
  ## Variables:
```
 dst, src, i: INTEGER; bt: BYTE;
  ## Variables:
```
 dst, src, i: INTEGER; bt: BYTE;
BEGIN (*
  dst := SYSTEM.ADR(data[0]); src := B.base + y*B.width + x; i := w;
  WHILE i > 0 DO
    SYSTEM.GET(src, bt); SYSTEM.PUT(dst, bt);
    INC(src); INC(dst, 2);
    DEC(i)
  END
*)
END GetLine;
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

