
## [MODULE Bitmaps](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod)

Procedures:

```
[11](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#11)  PROCEDURE New*(B: Bitmap; w, h, dpt: INTEGER) : Bitmap;
```
```
[23](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#23)  PROCEDURE Get*(B: Bitmap; x, y: INTEGER): INTEGER;
```
```
[31](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#31)  PROCEDURE Clear*(B: Bitmap);
```
```
[43](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#43)  PROCEDURE Dot*(B: Bitmap; col, x, y, mode: INTEGER);
```
```
[60](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#60)  PROCEDURE Src2Pix(x, w, src: INTEGER; VAR pix1, pix2: SET);
```
```
[80](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#80)  PROCEDURE Const2Pix(x, w, con: INTEGER; VAR pix1, pix2: SET);
```
```
[100](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#100)  PROCEDURE CopyPLine(x, src, dst, w: INTEGER);
```
```
[120](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#120)  PROCEDURE ReplBLine0(col, x, dst, w: INTEGER);
```
```
[143](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#143)  PROCEDURE CopyBLine1(x, src, dst, w: INTEGER);
```
```
[159](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#159)  PROCEDURE CopyBLine0(x, src, dst, w: INTEGER);
```
```
[169](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#169)  PROCEDURE CopyBLine2(x, src, dst, w: INTEGER);
```
```
[183](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#183)  PROCEDURE CopyBlock*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);
```
```
[209](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#209)  PROCEDURE CopyPattern*(B: Bitmap; col, pat, x, y, mode: INTEGER);
```
```
[225](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#225)  PROCEDURE ReplPattern*(B: Bitmap; col, pat, X, Y, W, H, mode: INTEGER);
```
```
[249](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#249)  PROCEDURE ReplConst*(B: Bitmap; col, x, y, w, h, mode: INTEGER);
```
```
[264](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#264)  PROCEDURE DisplayBlock*(B: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);
```
```
[291](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#291)  PROCEDURE GetPix*(VAR a: INTEGER; VAR bt: BYTE; depth: INTEGER);
```
```
[308](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#308)  PROCEDURE PutPix*(VAR a, x: INTEGER; bt: BYTE; depth: INTEGER);
```
```
[317](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#317)  PROCEDURE Copy*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);
```
```
[323](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#323)  PROCEDURE PutLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);
```
```
[335](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#335)  PROCEDURE GetLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);
```
