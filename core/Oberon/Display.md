
## [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)

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
    Handler* = PROCEDURE (F: Frame; ## Variables:
```
 M: FrameMsg);
    FrameDesc* = RECORD next*, dsc*: Frame;
        X*, Y*, W*, H*: INTEGER;
        handle*: Handler
      END ;
  ## Variables:
```
 Base*, Width*, Height*, Depth*, Span, Pack, black*, white*, bgcolor*, fgcolor*: INTEGER;
    arrow*, star*, hook*, updown*, block*, cross*, grey*: INTEGER;
    (*a pattern is an array of bytes; the first is its width (< 32), the second its height, the rest the raster*)
  PROCEDURE Handle*(F: Frame; ## Variables:
```
 M: FrameMsg);
  BEGIN
    IF (F # NIL) & (F.handle # NIL) THEN F.handle(F, M) END
  END Handle;
    ## Variables:
```
 a, v, b: INTEGER; u, s: SET;
  BEGIN a := Base + (x DIV Pack)*4 + y*Span;
    SYSTEM.GET(a, u);
    IF Depth = 1 THEN
      s := {x MOD 32}
    ELSE
      s := {(x MOD Pack)*Depth .. (((x+1) MOD Pack)*Depth)-1};
    END;
    IF mode = paint THEN SYSTEM.PUT(a, u + s)
    ELSIF mode = invert THEN SYSTEM.PUT(a, u / s)
    ELSE (*mode = replace*)
      IF col # black THEN SYSTEM.PUT(a, u + s) ELSE SYSTEM.PUT(a, u - s) END
    END
  END Dot;
    ## Variables:
```
 al, ar, a0, a1, i: INTEGER; left, right, mid, pix, pixl, pixr: SET;
  BEGIN
    al := Base + y*Span;
    ar := ((x+w-1) DIV Pack)*4 + al;
    al := (x DIV Pack)*4 + al;
    IF ar = al THEN
      mid := {(x MOD Pack)*Depth .. ((((x+w) MOD Pack))*Depth)-1};
      a1 := al;
      FOR i := 1 TO h DO
        SYSTEM.GET(a1, pix);
        IF mode = invert THEN SYSTEM.PUT(a1, pix / mid)
        ELSIF (mode = replace) & (col = black) THEN (*erase*) SYSTEM.PUT(a1, pix - mid)
        ELSE (* (mode = paint) OR (mode = replace) & (col # black) *) SYSTEM.PUT(a1, pix + mid)
        END;
        INC(a1, Span)
      END
    ELSE
      left  := {(x MOD Pack)*Depth .. 31};
      right := {0 .. ((((x+w) MOD Pack))*Depth)-1};
      a0 := al;
      FOR i := 1 TO h DO
        SYSTEM.GET(a0, pixl); SYSTEM.GET(ar, pixr);
        IF mode = invert THEN
          SYSTEM.PUT(a0, pixl / left);
          FOR a1 := a0+4 TO ar-4 BY 4 DO SYSTEM.GET(a1, pix); SYSTEM.PUT(a1, -pix) END ;
          SYSTEM.PUT(ar, pixr / right)
        ELSIF (mode = replace) & (col = black) THEN (*erase*)
          SYSTEM.PUT(a0, pixl - left);
          FOR a1 := a0+4 TO ar-4 BY 4 DO SYSTEM.PUT(a1, {}) END ;
          SYSTEM.PUT(ar, pixr - right)
        ELSE (* (mode = paint) OR (mode = replace) & (col # black) *)
          SYSTEM.PUT(a0, pixl + left);
          FOR a1 := a0+4 TO ar-4 BY 4 DO SYSTEM.PUT(a1, {0 .. 31}) END ;
          SYSTEM.PUT(ar, pixr + right)
        END ;
        INC(ar, Span); INC(a0, Span)
      END
    END
  END ReplConst;
    ## Variables:
```
 a, a0, pwd: INTEGER;
      w, h, pbt: BYTE; pix, mask: SET;
  BEGIN (*0 <= top < h, 0 <= bot < h, top + bot < h, 0 <= right < w, 0 <= left < w, left + right < w*)
    SYSTEM.GET(patadr, w); SYSTEM.GET(patadr+1, h); INC(patadr, 2 + bot*((w + 7) DIV 8)); h := h - top - bot;
    a := Base + (x DIV 32)*4 + (y+bot)*128; x := x MOD 32; mask := -LSL({0 .. 31}, x);
    FOR a0 := a TO a + (h-1)*128 BY 128 DO
      (*build pattern line; w <= 32*)
      SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt;
      IF w > 8 THEN SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt*100H + pwd;
        IF w > 16 THEN SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt*10000H + pwd;
          IF w > 24 THEN SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt*1000000H + pwd END
        END
      END ;
      IF left + right > 0 THEN pwd := SYSTEM.VAL(INTEGER, SYSTEM.VAL(SET, pwd) * {left .. w-1} * {0 .. w-right-1}) END ;
      SYSTEM.GET(a0, pix);
      IF mode = invert THEN SYSTEM.PUT(a0, SYSTEM.VAL(SET, LSL(pwd, x)) / pix)
      ELSE SYSTEM.PUT(a0, SYSTEM.VAL(SET, LSL(pwd, x)) + pix)
      END ;
      IF x + w > 32 THEN (*spill over*)
        SYSTEM.GET(a0+4, pix);
        IF mode = invert THEN SYSTEM.PUT(a0+4, SYSTEM.VAL(SET, ASR(pwd, -x)) * mask/ pix)
        ELSE SYSTEM.PUT(a0+4, SYSTEM.VAL(SET, ASR(pwd, -x)) * mask+ pix)
        END
      END
    END
  END CopyPatternClipped;
*)
    ## Variables:
```
 a0, pwd, i, j: INTEGER;
      w, h, pbt: BYTE; b0,pix: SET;
  BEGIN SYSTEM.GET(patadr, w); SYSTEM.GET(patadr+1, h); INC(patadr, 2);
    a0 := Base + (x DIV Pack)*4 + y*Span;
    FOR i := 1 TO h DO
      (*build pattern line; w < 32*)
      SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt;
      IF w > 8 THEN SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt*100H + pwd;
        IF w > 16 THEN SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt*10000H + pwd;
          IF w > 24 THEN SYSTEM.GET(patadr, pbt); INC(patadr); pwd := pbt*1000000H + pwd END
        END
      END ;
      IF Depth = 1 THEN
        SYSTEM.GET(a0, pix);
        IF mode = invert THEN SYSTEM.PUT(a0, SYSTEM.VAL(SET, LSL(pwd, x MOD 32)) / pix)
        ELSE SYSTEM.PUT(a0, SYSTEM.VAL(SET, LSL(pwd, x MOD 32)) + pix)
        END;
      ELSE
    ## Variables:
```
 sa, da, sa0, sa1, d, len: INTEGER;
      u0, u1, u2, u3, v0, v1, v2, v3, n: INTEGER;
      end, step: INTEGER;
      src, dst, spill: SET;
      m0, m1, m2, m3: SET;
  BEGIN
    u0 := sx DIV 32; u1 := sx MOD 32; u2 := (sx+w) DIV 32; u3 := (sx+w) MOD 32;
    v0 := dx DIV 32; v1 := dx MOD 32; v2 := (dx+w) DIV 32; v3 := (dx+w) MOD 32;
    sa := Base + u0*4 + sy*128; da := Base + v0*4 + dy*128;
    d := da - sa; n := u1 - v1;   (*displacement in words and bits*)
    len := (u2 - u0) * 4;
    m0 := {v1 .. 31}; m2 := {v3 .. 31}; m3 := m0 / m2;
    IF d >= 0 THEN (*copy up, scan down*) sa0 := sa + (h-1)*128; end := sa-128; step := -128
    ELSE (*copy down, scan up*) sa0 := sa; end := sa + h*128; step := 128
    END ;
    WHILE sa0 # end DO
      IF n >= 0 THEN (*shift right*) m1 := {n .. 31};
        IF v1 + w >= 32 THEN
          SYSTEM.GET(sa0+len, src); src := ROR(src, n);
          SYSTEM.GET(sa0+len+d, dst);
          SYSTEM.PUT(sa0+len+d, (dst * m2) + (src - m2));
          spill := src - m1;
          FOR sa1 := sa0 + len-4 TO sa0+4  BY -4 DO
            SYSTEM.GET(sa1, src); src := ROR(src, n);
            SYSTEM.PUT(sa1+d, spill + (src * m1));
            spill := src - m1
          END ;
          SYSTEM.GET(sa0, src); src := ROR(src, n);
          SYSTEM.GET(sa0+d, dst);
          SYSTEM.PUT(sa0+d, (src * m0) + (dst - m0))
        ELSE SYSTEM.GET(sa0, src); src := ROR(src, n);
          SYSTEM.GET(sa0+d, dst);
          SYSTEM.PUT(sa0+d, (src * m3) + (dst - m3))
        END
      ELSE (*shift left*) m1 := {-n .. 31};
        SYSTEM.GET(sa0, src); src := ROR(src, n);
        SYSTEM.GET(sa0+d, dst);
        IF v1 + w < 32 THEN
          SYSTEM.PUT(sa0+d, (dst - m3) + (src * m3))
        ELSE SYSTEM.PUT(sa0+d, (dst - m0) + (src * m0));
          spill := src - m1;
          FOR sa1 := sa0+4 TO sa0 + len-4 BY 4 DO
            SYSTEM.GET(sa1, src); src := ROR(src, n);
            SYSTEM.PUT(sa1+d, spill + (src * m1));
            spill := src - m1
          END ;
          SYSTEM.GET(sa0+len, src); src := ROR(src, n);
          SYSTEM.GET(sa0+len+d, dst);
          SYSTEM.PUT(sa0+len+d, (src - m2) + (dst * m2))
        END
      END ;
      INC(sa0, step)
    END
  END CopyBlock;
*)
    ## Variables:
```
 sa, da, sa0, sa1, d, len: INTEGER;
      u0, u1, u2, u3, v0, v1, v2, v3, n: INTEGER;
      end, step: INTEGER;
      src, dst, spill: SET;
      m0, m1, m2, m3: SET;
  BEGIN
    u0 := sx DIV Pack; u1 := sx MOD Pack; u2 := (sx+sw) DIV Pack; u3 := (sx+sw) MOD Pack;
    v0 := dx DIV Pack; v1 := dx MOD Pack; v2 := (dx+sw) DIV Pack; v3 := (dx+sw) MOD Pack;
    sa := Base + u0*4 + sy*Span; da := Base + v0*4 + dy*Span;
    d := da - sa; n := u1 - v1;   (*displacement in words and bits*)
    len := (u2 - u0) * 4;
    m0 := {v1 .. 31}; m2 := {v3 .. 31}; m3 := m0 / m2;
    IF d >= 0 THEN (*copy up, scan down*) sa0 := sa + (sh-1)*Span; end := sa-Span; step := -Span
    ELSE (*copy down, scan up*) sa0 := sa; end := sa + sh*Span; step := Span
    END ;
    WHILE sa0 # end DO
      IF n >= 0 THEN (*shift right*) m1 := {n .. 31};
        IF v1 + sw >= 32 THEN
          SYSTEM.GET(sa0+len, src); src := ROR(src, n);
          SYSTEM.GET(sa0+len+d, dst);
          SYSTEM.PUT(sa0+len+d, (dst * m2) + (src - m2));
          spill := src - m1;
          FOR sa1 := sa0 + len-4 TO sa0+4  BY -4 DO
            SYSTEM.GET(sa1, src); src := ROR(src, n);
            SYSTEM.PUT(sa1+d, spill + (src * m1));
            spill := src - m1
          END ;
          SYSTEM.GET(sa0, src); src := ROR(src, n);
          SYSTEM.GET(sa0+d, dst);
          SYSTEM.PUT(sa0+d, (src * m0) + (dst - m0))
        ELSE SYSTEM.GET(sa0, src); src := ROR(src, n);
          SYSTEM.GET(sa0+d, dst);
          SYSTEM.PUT(sa0+d, (src * m3) + (dst - m3))
        END
      ELSE (*shift left*) m1 := {-n .. 31};
        SYSTEM.GET(sa0, src); src := ROR(src, n);
        SYSTEM.GET(sa0+d, dst);
        IF v1 + sw < 32 THEN
          SYSTEM.PUT(sa0+d, (dst - m3) + (src * m3))
        ELSE SYSTEM.PUT(sa0+d, (dst - m0) + (src * m0));
          spill := src - m1;
          FOR sa1 := sa0+4 TO sa0 + len-4 BY 4 DO
            SYSTEM.GET(sa1, src); src := ROR(src, n);
            SYSTEM.PUT(sa1+d, spill + (src * m1));
            spill := src - m1
          END ;
          SYSTEM.GET(sa0+len, src); src := ROR(src, n);
          SYSTEM.GET(sa0+len+d, dst);
          SYSTEM.PUT(sa0+len+d, (src - m2) + (dst * m2))
        END
      END ;
      INC(sa0, step)
    END
  END CopyImage;
    ## Variables:
```
 al, ar, a0, a1: INTEGER;
      pta0, pta1: INTEGER;  (*pattern addresses*)
      ph: BYTE;
      left, right, mid, pix, pixl, pixr, ptw: SET;
  BEGIN al := Base + y*128; SYSTEM.GET(patadr+1, ph);
    pta0 := patadr+4; pta1 := ph*4 + pta0;
    ar := ((x+w-1) DIV 32)*4 + al; al := (x DIV 32)*4 + al;
    IF ar = al THEN
      mid := {(x MOD 32) .. ((x+w-1) MOD 32)};
      FOR a1 := al TO al + (h-1)*128 BY 128 DO
        SYSTEM.GET(a1, pix); SYSTEM.GET(pta0, ptw); SYSTEM.PUT(a1, (pix - mid) + (pix/ptw * mid)); INC(pta0, 4);
        IF pta0 = pta1 THEN pta0 := patadr+4 END
      END
    ELSIF ar > al THEN
      left := {(x MOD 32) .. 31}; right := {0 .. ((x+w-1) MOD 32)};
      FOR a0 := al TO al + (h-1)*128 BY 128 DO
        SYSTEM.GET(a0, pixl); SYSTEM.GET(pta0, ptw); SYSTEM.PUT(a0, (pixl - left) + (pixl/ptw * left));
        FOR a1 := a0+4 TO ar-4 BY 4 DO SYSTEM.GET(a1, pix); SYSTEM.PUT(a1, pix/ptw) END ;
        SYSTEM.GET(ar, pixr); SYSTEM.PUT(ar, (pixr - right) + (pixr/ptw * right));
        INC(pta0, 4); INC(ar, 128);
        IF pta0 = pta1 THEN pta0 := patadr+4 END
      END
    END
  END ReplPattern;
  ## Variables:
```
 magic: INTEGER;
  BEGIN
    black := 0;
    white := 1;
    Pack  := 32;
    SYSTEM.GET(Base, magic);
    IF magic = 53697A65H THEN
      SYSTEM.GET(Base + 4, Width);
      SYSTEM.GET(Base + 8, Height);
      Depth := 1;
      Span := 128;
    ELSIF magic = 53697A66H THEN
      SYSTEM.GET(Base + 4, Width);
      SYSTEM.GET(Base + 8, Height);
      Depth := 1;
      Span := Width DIV 8
    ELSIF magic = 53697A67H THEN
      SYSTEM.GET(Base + 4, Width);
      SYSTEM.GET(Base + 8, Height);
      SYSTEM.GET(Base + 12, Base);
      Depth:=1;
      Span := Width DIV 8;
    ELSE
      Width := 1024; Height := 768; Span := 128; Depth := 1
    END;
    bgcolor := black;
    fgcolor := white;
  END InitResolution;
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

