
## [MODULE Bitmaps](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod)

Procedures:


<pre>PROCEDURE New*(B: Bitmap; w, h, dpt: INTEGER) : Bitmap;</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L11)


<pre>PROCEDURE Get*(B: Bitmap; x, y: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L23)


<pre>PROCEDURE Clear*(B: Bitmap);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L31)


<pre>PROCEDURE Dot*(B: Bitmap; col, x, y, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L43)


<pre>PROCEDURE Src2Pix(x, w, src: INTEGER; VAR pix1, pix2: SET);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L60)


<pre>PROCEDURE Const2Pix(x, w, con: INTEGER; VAR pix1, pix2: SET);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L80)


<pre>PROCEDURE CopyPLine(x, src, dst, w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L100)


<pre>PROCEDURE ReplBLine0(col, x, dst, w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L120)


<pre>PROCEDURE CopyBLine1(x, src, dst, w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L143)


<pre>PROCEDURE CopyBLine0(x, src, dst, w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L159)


<pre>PROCEDURE CopyBLine2(x, src, dst, w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L169)


<pre>PROCEDURE CopyBlock*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L183)


<pre>PROCEDURE CopyPattern*(B: Bitmap; col, pat, x, y, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L209)


<pre>PROCEDURE ReplPattern*(B: Bitmap; col, pat, X, Y, W, H, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L225)


<pre>PROCEDURE ReplConst*(B: Bitmap; col, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L249)


<pre>PROCEDURE DisplayBlock*(B: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L264)


<pre>PROCEDURE GetPix*(VAR a: INTEGER; VAR bt: BYTE; depth: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L291)


<pre>PROCEDURE PutPix*(VAR a, x: INTEGER; bt: BYTE; depth: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L308)


<pre>PROCEDURE Copy*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L317)


<pre>PROCEDURE PutLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L323)


<pre>PROCEDURE GetLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER);</pre> [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod#L335)

