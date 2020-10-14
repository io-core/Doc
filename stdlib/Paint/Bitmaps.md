
#### [MODULE Bitmaps](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod)

Procedures:

```
PROCEDURE New*(B: Bitmap; w, h, dpt: INTEGER) : Bitmap;
```
```
PROCEDURE Get*(B: Bitmap; x, y: INTEGER): INTEGER;
```
```
PROCEDURE Clear*(B: Bitmap);
```
```
PROCEDURE Dot*(B: Bitmap; col, x, y, mode: INTEGER);
```
```
PROCEDURE Src2Pix(x, w, src: INTEGER; VAR pix1, pix2: SET);
```
```
PROCEDURE Const2Pix(x, w, con: INTEGER; VAR pix1, pix2: SET);
```
```
PROCEDURE CopyPLine(x, src, dst, w: INTEGER);
```
```
PROCEDURE ReplBLine0(col, x, dst, w: INTEGER);
```
```
PROCEDURE CopyBLine1(x, src, dst, w: INTEGER);
```
```
PROCEDURE CopyBLine0(x, src, dst, w: INTEGER);
```
```
PROCEDURE CopyBLine2(x, src, dst, w: INTEGER);
```
```
PROCEDURE CopyBlock*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);
```
```
PROCEDURE CopyPattern*(B: Bitmap; col, pat, x, y, mode: INTEGER);
```
```
PROCEDURE ReplPattern*(B: Bitmap; col, pat, X, Y, W, H, mode: INTEGER);
```
```
PROCEDURE ReplConst*(B: Bitmap; col, x, y, w, h, mode: INTEGER);
```
```
PROCEDURE DisplayBlock*(B: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);
```
```
PROCEDURE GetPix*(VAR a: INTEGER; VAR bt: BYTE; depth: INTEGER);
```
```
PROCEDURE PutPix*(VAR a, x: INTEGER; bt: BYTE; depth: INTEGER);
```
```
PROCEDURE Copy*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);
```
```
PROCEDURE PutLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);
```
```
PROCEDURE GetLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);
```
