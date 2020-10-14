
#### [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

Procedures:

```
  PROCEDURE Handle*(F: Frame; VAR M: FrameMsg);
```
```
  PROCEDURE Dot*(col, x, y, mode: INTEGER);
```
```
  PROCEDURE ReplConst*(col, x, y, w, h, mode: INTEGER);
```
```
  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)
```
```
  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)
```
```
  PROCEDURE CopyPattern*(col, patadr, x, y, mode: INTEGER);  (*only for modes = paint, invert*)
```
```
  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER); (*only for mode = replace*)
```
```
  PROCEDURE CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER); (*only for mode = replace*)
```
```
  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER);
```
```
  PROCEDURE ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER);
```
```
  PROCEDURE InitResolution;
```
