
## [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

Procedures:


<pre>  PROCEDURE Handle*(F: Frame; VAR M: FrameMsg);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L27)


<pre>  PROCEDURE Dot*(col, x, y, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L34)


<pre>  PROCEDURE ReplConst*(col, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L50)


<pre>  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L92)


<pre>  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L121)


<pre>  PROCEDURE CopyPattern*(col, patadr, x, y, mode: INTEGER);  (*only for modes = paint, invert*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L168)


<pre>  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER); (*only for mode = replace*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L173)


<pre>  PROCEDURE CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER); (*only for mode = replace*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L230)


<pre>  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L286)


<pre>  PROCEDURE ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L291)


<pre>  PROCEDURE InitResolution;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L319)

