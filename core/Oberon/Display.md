
## [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

Procedures:

[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L27) `  PROCEDURE Handle*(F: Frame; VAR M: FrameMsg);`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L34) `  PROCEDURE Dot*(col, x, y, mode: INTEGER);`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L50) `  PROCEDURE ReplConst*(col, x, y, w, h, mode: INTEGER);`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L92) `  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L121) `  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L168) `  PROCEDURE CopyPattern*(col, patadr, x, y, mode: INTEGER);  (*only for modes = paint, invert*)`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L173) `  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER); (*only for mode = replace*)`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L230) `  PROCEDURE CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER); (*only for mode = replace*)`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L286) `  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER);`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L291) `  PROCEDURE ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER);`
[](https://github.com/io-core/Oberon/blob/main/Display.Mod#L319) `  PROCEDURE InitResolution;`
