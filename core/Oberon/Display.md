
## [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

  ## Imports:
` SYSTEM`

## Constants:
```
  
    replace* = 0; paint* = 1; invert* = 2;  (*modes*)
    (* base = 0E7F00H;  adr of 1024 x 768 pixel, monocolor display frame*)

  TYPE Frame* = POINTER TO FrameDesc;
```
## Types:
```
 Frame* = POINTER TO FrameDesc;
    FrameMsg* = RECORD END ;
    Handler* = PROCEDURE (F: Frame; VAR M: FrameMsg);
```
    Handler* = PROCEDURE (F: Frame; VAR M: FrameMsg);
    FrameDesc* = RECORD next*, dsc*: Frame;
        X*, Y*, W*, H*: INTEGER;
        handle*: Handler
      END ;

```
## Procedures:
---

`  PROCEDURE Handle*(F: Frame; VAR M: FrameMsg);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L27)


`  PROCEDURE Dot*(col, x, y, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L34)


`  PROCEDURE ReplConst*(col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L50)


`  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L92)


`  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L121)


`  PROCEDURE CopyPattern*(col, patadr, x, y, mode: INTEGER);  (*only for modes = paint, invert*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L168)


`  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER); (*only for mode = replace*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L173)


`  PROCEDURE CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER); (*only for mode = replace*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L230)


`  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L286)


`  PROCEDURE ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L291)


`  PROCEDURE InitResolution;` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L319)

