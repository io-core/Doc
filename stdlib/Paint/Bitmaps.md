
## [MODULE Bitmaps](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod)

Procedures:


<code>PROCEDURE New*(B: Bitmap; w, h, dpt: INTEGER) : Bitmap;</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L11)


<code>PROCEDURE Get*(B: Bitmap; x, y: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L23)


<code>PROCEDURE Clear*(B: Bitmap);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L31)


<code>PROCEDURE Dot*(B: Bitmap; col, x, y, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L43)


<code>PROCEDURE Src2Pix(x, w, src: INTEGER; VAR pix1, pix2: SET);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L60)


<code>PROCEDURE Const2Pix(x, w, con: INTEGER; VAR pix1, pix2: SET);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L80)


<code>PROCEDURE CopyPLine(x, src, dst, w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L100)


<code>PROCEDURE ReplBLine0(col, x, dst, w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L120)


<code>PROCEDURE CopyBLine1(x, src, dst, w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L143)


<code>PROCEDURE CopyBLine0(x, src, dst, w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L159)


<code>PROCEDURE CopyBLine2(x, src, dst, w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L169)


<code>PROCEDURE CopyBlock*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L183)


<code>PROCEDURE CopyPattern*(B: Bitmap; col, pat, x, y, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L209)


<code>PROCEDURE ReplPattern*(B: Bitmap; col, pat, X, Y, W, H, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L225)


<code>PROCEDURE ReplConst*(B: Bitmap; col, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L249)


<code>PROCEDURE DisplayBlock*(B: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L264)


<code>PROCEDURE GetPix*(VAR a: INTEGER; VAR bt: BYTE; depth: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L291)


<code>PROCEDURE PutPix*(VAR a, x: INTEGER; bt: BYTE; depth: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L308)


<code>PROCEDURE Copy*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L317)


<code>PROCEDURE PutLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L323)


<code>PROCEDURE GetLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);</code> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L335)

