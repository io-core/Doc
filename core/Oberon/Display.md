
## [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

Procedures:

[27](https://github.com/io-core/Oberon/blob/main/Display.Mod#27) `  PROCEDURE Handle*(F: Frame; VAR M: FrameMsg);`
[34](https://github.com/io-core/Oberon/blob/main/Display.Mod#34) `  PROCEDURE Dot*(col, x, y, mode: INTEGER);`
[50](https://github.com/io-core/Oberon/blob/main/Display.Mod#50) `  PROCEDURE ReplConst*(col, x, y, w, h, mode: INTEGER);`
[92](https://github.com/io-core/Oberon/blob/main/Display.Mod#92) `  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)`
[121](https://github.com/io-core/Oberon/blob/main/Display.Mod#121) `  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)`
[168](https://github.com/io-core/Oberon/blob/main/Display.Mod#168) `  PROCEDURE CopyPattern*(col, patadr, x, y, mode: INTEGER);  (*only for modes = paint, invert*)`
[173](https://github.com/io-core/Oberon/blob/main/Display.Mod#173) `  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER); (*only for mode = replace*)`
[230](https://github.com/io-core/Oberon/blob/main/Display.Mod#230) `  PROCEDURE CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER); (*only for mode = replace*)`
[286](https://github.com/io-core/Oberon/blob/main/Display.Mod#286) `  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER);`
[291](https://github.com/io-core/Oberon/blob/main/Display.Mod#291) `  PROCEDURE ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER);`
[319](https://github.com/io-core/Oberon/blob/main/Display.Mod#319) `  PROCEDURE InitResolution;`
