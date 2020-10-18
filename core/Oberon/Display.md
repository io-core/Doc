
## [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

(NW 5.11.2013 / 17.1.2019 / AP 9.3.20 Extended Oberon / CP 10.20 Integrated Oberon)

**Display** is the interface to the hardware framebuffer in Oberon.

On initialization the origial base address is queried for a magic value to determine
if the base has moved and if the resolution is something other than 1024x768.

Only monochrome screens are implemented in this version of Display.Mod


  ## Imports:
` SYSTEM`

## Constants:
```
  
    replace* = 0; paint* = 1; invert* = 2;  (*modes*)
    (* base = 0E7F00H;  adr of 1024 x 768 pixel, monocolor display frame*)

```
## Types:
```
 Frame* = POINTER TO FrameDesc;
    FrameMsg* = RECORD END ;
```
    Handler* = PROCEDURE (F: Frame; VAR M: FrameMsg);
    FrameDesc* = RECORD next*, dsc*: Frame;
        X*, Y*, W*, H*: INTEGER;
        handle*: Handler
      END ;

```
## Procedures:
---
---
**Handle** passes through messages to the frame message handler.

`  PROCEDURE Handle*(F: Frame; VAR M: FrameMsg);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L41)

## ---------- Raster Ops
---
**Dot** sets a pixel.

`  PROCEDURE Dot*(col, x, y, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L56)

---
**ReplConst** paints or inverts a rectangular region of the display.

`  PROCEDURE ReplConst*(col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L76)


`  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L118)

---
**CopyPatternClipped** copies a bitmap pattern (e.g. icon, font glyph) to a clipped location on the display.

`  PROCEDURE CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER);  (*only for modes = paint, invert*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L151)

---
**CopyPattern** calls CopyPatternClipped with a relaxed clipping boundary.

`  PROCEDURE CopyPattern*(col, patadr, x, y, mode: INTEGER);  (*only for modes = paint, invert*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L202)


`  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER); (*only for mode = replace*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L207)

---
**CopyImage** copies one rectangular portion of the display area to another portion of the display area. 

`  PROCEDURE CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER); (*only for mode = replace*)` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L268)

---
**CopyBlock** calls CopyImage with the current screen Depth and Span. 

`  PROCEDURE CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L328)

---
**ReplPattern** repeats a pixel pattern (e.g. icon, font glyph) over a rectangular portion of the display. 

`  PROCEDURE ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L337)

## ---------- Initialization
---
**InitResolution** queries the start of the framebuffer memory to determine if the acutal 
framebuffer has moved and if it is other than 1024x768x1

`  PROCEDURE InitResolution;` [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod#L374)

---
**The initialziation code for this module** calls the InitResolution procedure 
and then defines the arrow, star, hook, updown, and icons and the grey pattern. 
