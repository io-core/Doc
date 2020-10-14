
## [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

Procedures:


<code>  PROCEDURE Handle*(F: Frame; VAR M: FrameMsg);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L27)


<code>  PROCEDURE Dot*(col, x, y, mode: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L34)


<code>  PROCEDURE ReplConst*(col, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L50)


<code>  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L92)


<code>  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L121)


<code>  PROCEDURE CopyPattern*(col, patadr, x, y, mode: INTEGER);  (*only for modes = paint, invert*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L168)


<code>  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER); (*only for mode = replace*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L173)


<code>  PROCEDURE CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER); (*only for mode = replace*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L230)


<code>  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L286)


<code>  PROCEDURE ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L291)


<code>  PROCEDURE InitResolution;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L319)

