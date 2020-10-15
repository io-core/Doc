
## [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)

  ## Imports:
` SYSTEM`

  ## Constants:
```
 TrapAdr* = 04H; timer = -64;

```
  ## Types:
```
 Handler* = PROCEDURE(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;

```
  TYPE Handler* = PROCEDURE(src, dst: LONGINT; s: ARRAY OF CHAR; ## Variables:
```
 continue: BOOLEAN): INTEGER;
  ## Variables:
```
 allocated*: INTEGER;
    heapOrg*, heapLim*: INTEGER;
    stackOrg*, stackSize*, MemLim*: INTEGER;
    clock: INTEGER;
    list0, list1, list2, list3: INTEGER;  (*lists of free blocks of size n*256, 128, 64, 32 bytes*)
  PROCEDURE GetBlock(## Variables:
```
 p: LONGINT; len: LONGINT);
    (*len is multiple of 256*)
    ## Variables:
```
 q0, q1, q2, size: LONGINT; done: BOOLEAN;
    ## Variables:
```
 q0, q1, q2, size: LONGINT; done: BOOLEAN;
  BEGIN q0 := 0; q1 := list0; done := FALSE;
    WHILE ~done & (q1 # 0) DO
      SYSTEM.GET(q1, size); SYSTEM.GET(q1+8, q2);
      IF size < len THEN (*no fit*) q0 := q1; q1 := q2
      ELSIF size = len THEN (*extract -> p*)
        done := TRUE; p := q1;
        IF q0 # 0 THEN SYSTEM.PUT(q0+8, q2) ELSE list0 := q2 END
      ELSE (*reduce size*)
        done := TRUE; p := q1; q1 := q1 + len;
        SYSTEM.PUT(q1, size-len); SYSTEM.PUT(q1+4, -1); SYSTEM.PUT(q1+8, q2);
        IF q0 # 0 THEN SYSTEM.PUT(q0+8, q1) ELSE list0 := q1 END
      END
    END ;
    IF ~done THEN p := 0 END
  END GetBlock;
  PROCEDURE GetBlock128(## Variables:
```
 p: LONGINT);
    ## Variables:
```
 q: LONGINT;
    ## Variables:
```
 q: LONGINT;
  BEGIN
    IF list1 # 0 THEN p := list1; SYSTEM.GET(list1+8, list1)
    ELSE GetBlock(q, 256); p := q;
      IF q # 0 THEN SYSTEM.PUT(q+128, 128); SYSTEM.PUT(q+132, -1); SYSTEM.PUT(q+136, list1); list1 := q + 128 END
    END
  END GetBlock128;
  PROCEDURE GetBlock64(## Variables:
```
 p: LONGINT);
    ## Variables:
```
 q: LONGINT;
    ## Variables:
```
 q: LONGINT;
  BEGIN
    IF list2 # 0 THEN p := list2; SYSTEM.GET(list2+8, list2)
    ELSE GetBlock128(q); p := q;
      IF q # 0 THEN SYSTEM.PUT(q+64, 64); SYSTEM.PUT(q+68, -1); SYSTEM.PUT(q+72, list2); list2 := q + 64 END
    END
  END GetBlock64;
  PROCEDURE GetBlock32(## Variables:
```
 p: LONGINT);
    ## Variables:
```
 q: LONGINT;
    ## Variables:
```
 q: LONGINT;
  BEGIN
    IF list3 # 0 THEN p := list3; SYSTEM.GET(list3+8, list3)
    ELSE GetBlock64(q); p := q;
      IF q # 0 THEN SYSTEM.PUT(q+32, 32); SYSTEM.PUT(q+36, -1); SYSTEM.PUT(q+40, list3); list3 := q + 32 END
    END
  END GetBlock32;
  PROCEDURE New*(## Variables:
```
 ptr: LONGINT; tag, len, elemsize: LONGINT);
    (*called by NEW via TR; ptr is a pointer; tag (or tag-1) is a pointer or blktyp; len and elemsize describe arrays*)
    ## Variables:
```
 p, size, lim: LONGINT;
    ## Variables:
```
 p, size, lim: LONGINT;
  BEGIN
    IF tag MOD 4 = 0 THEN (*record block*)
      SYSTEM.GET(tag, size);  (*size already converted for heap allocation with 8 byte prefix*)
      IF size = 32 THEN GetBlock32(p)
      ELSIF size = 64 THEN GetBlock64(p)
      ELSIF size = 128 THEN GetBlock128(p)
      ELSE GetBlock(p, size)
      END ;
      IF p = 0 THEN ptr := 0
      ELSE ptr := p+8; SYSTEM.PUT(p, tag); lim := p + size; INC(p, 4); INC(allocated, size);
        WHILE p < lim DO SYSTEM.PUT(p, 0); INC(p, 4) END
      END
    ELSE (*array block*)
      size := len*elemsize;  (*convert size for heap allocation with 24 byte prefix*)
      IF size <= 8 THEN size := 32; GetBlock32(p)
      ELSIF size <= 40 THEN size := 64; GetBlock64(p)
      ELSIF size <= 104 THEN size := 128; GetBlock128(p)
      ELSE size := (size+279) DIV 256 * 256; GetBlock(p, size)
      END ;
      IF p = 0 THEN ptr := 0
      ELSE ptr := p+8; SYSTEM.PUT(p, tag); SYSTEM.PUT(p+4, 0); SYSTEM.PUT(p+8, len);
        SYSTEM.PUT(p+12, elemsize); SYSTEM.PUT(p+16, size); lim := p + size; INC(p, 20); INC(allocated, size);
        WHILE p < lim DO SYSTEM.PUT(p, 0); INC(p, 4) END
      END
    END
  END New;
    ## Variables:
```
 pvadr, offadr, offset, tag, p, q, r, pos, len, elemsize, blktyp: LONGINT;
  BEGIN SYSTEM.GET(pref, pvadr); (*pointers < heapOrg considered NIL*)
    WHILE pvadr # 0 DO SYSTEM.GET(pvadr, p);
      IF p >= heapOrg THEN SYSTEM.GET(p-4, offadr);
        IF offadr = 0 THEN q := p;  (*mark elements in data structure with root p*)
          REPEAT SYSTEM.GET(p-4, offadr); SYSTEM.GET(p-8, tag); blktyp := tag MOD 4;
            IF blktyp = 0 THEN (*record*) pos := p;
              IF offadr = 0 THEN offadr := tag + 16 ELSE INC(offadr, 4) END ;
              SYSTEM.PUT(p-4, offadr); SYSTEM.GET(offadr, offset)
            ELSIF blktyp = 1 THEN (*array of record*)
              IF offadr = 0 THEN offadr := tag + 15; pos := p + 16; SYSTEM.PUT(p+12, pos) ELSE INC(offadr, 4); SYSTEM.GET(p+12, pos) END ;
              SYSTEM.GET(offadr, offset);
              IF offset = -1 THEN SYSTEM.GET(p, len); SYSTEM.GET(p+4, elemsize); INC(pos, elemsize);
                IF pos < p + 16 + len*elemsize THEN offadr := tag + 15; SYSTEM.GET(offadr, offset); SYSTEM.PUT(p+12, pos) END
              END ;
              SYSTEM.PUT(p-4, offadr)
            ELSIF blktyp = 2 THEN (*array of pointer*) pos := p + 16;
              IF offadr = 0 THEN offset := 0; SYSTEM.PUT(p-4, p+12) (*offadr*)
              ELSE SYSTEM.GET(p, len); SYSTEM.GET(p+12, offset); INC(offset, 4);
                IF offset >= len*4 THEN offset := -1 END
              END ;
              SYSTEM.PUT(p+12, offset)
            ELSE (*array of basic type (tag = 3) or array of procedure (tag = 7)*)
              offset := -1; SYSTEM.PUT(p+12, -1); SYSTEM.PUT(p-4, p+12) (*offadr*)
            END ;
            IF offset # -1 THEN (*down*)
              SYSTEM.GET(pos+offset, r);
              IF r >= heapOrg THEN SYSTEM.GET(r-4, offadr);
                IF offadr = 0 THEN SYSTEM.PUT(pos+offset, q); q := p; p := r END
              END
            ELSE (*up*) SYSTEM.GET(q-4, offadr); SYSTEM.GET(offadr, offset);
              IF p # q THEN SYSTEM.GET(q-8, tag); blktyp := tag MOD 4;
                IF blktyp = 0 THEN pos := q ELSIF blktyp = 1 THEN SYSTEM.GET(q+12, pos) ELSE pos := q + 16 END ;
                SYSTEM.GET(pos+offset, r); SYSTEM.PUT(pos+offset, p); p := q; q := r
              END
            END
          UNTIL (p = q) & (offset = -1)
        END
      END ;
      INC(pref, 4); SYSTEM.GET(pref, pvadr)
    END
  END Mark;
    ## Variables:
```
 p, q, mark, tag, size: LONGINT;
  BEGIN p := heapOrg;
    REPEAT SYSTEM.GET(p+4, mark); q := p;
      WHILE mark = 0 DO SYSTEM.GET(p, tag);
        IF tag MOD 4 = 0 THEN (*record*) SYSTEM.GET(tag, size) ELSE (*array*) SYSTEM.GET(p+16, size) END ;
        INC(p, size);
        IF p < heapLim THEN SYSTEM.GET(p+4, mark) ELSE mark := -1 END
      END ;
      size := p - q; DEC(allocated, size);  (*size of free block*)
      IF size > 0 THEN
        IF size MOD 64 # 0 THEN
          SYSTEM.PUT(q, 32); SYSTEM.PUT(q+4, -1); SYSTEM.PUT(q+8, list3); list3 := q; INC(q, 32); DEC(size, 32)
        END ;
        IF size MOD 128 # 0 THEN
          SYSTEM.PUT(q, 64); SYSTEM.PUT(q+4, -1); SYSTEM.PUT(q+8, list2); list2 := q; INC(q, 64); DEC(size, 64)
        END ;
        IF size MOD 256 # 0 THEN
          SYSTEM.PUT(q, 128); SYSTEM.PUT(q+4, -1); SYSTEM.PUT(q+8,  list1); list1 := q; INC(q, 128); DEC(size, 128)
        END ;
        IF size > 0 THEN
          SYSTEM.PUT(q, size); SYSTEM.PUT(q+4, -1); SYSTEM.PUT(q+8, list0); list0 := q; INC(q, size)
        END
      END ;
      IF mark > 0 THEN SYSTEM.GET(p, tag);
        IF tag MOD 4 = 0 THEN (*record*) SYSTEM.GET(tag, size) ELSE (*array*) SYSTEM.GET(p+16, size) END ;
        SYSTEM.PUT(p+4, 0); INC(p, size)
      ELSIF p < heapLim THEN (*free*) SYSTEM.GET(p, size); INC(p, size)
      END
    UNTIL p >= heapLim
  END Collect;
  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; ## Variables:
```
 resTyp, resPtr, resPvr: INTEGER);
    ## Variables:
```
 offadr, offset, p, r, mark, tag, size, pos, len, elemsize, blktyp: LONGINT; continue: BOOLEAN;
    ## Variables:
```
 offadr, offset, p, r, mark, tag, size, pos, len, elemsize, blktyp: LONGINT; continue: BOOLEAN;
  BEGIN p := heapOrg; resTyp := 0; resPtr := 0; resPvr := 0; continue := (typ # NIL) OR (ptr # NIL) OR (pvr # NIL);
    REPEAT SYSTEM.GET(p+4, mark);
      IF mark < 0 THEN (*free*) SYSTEM.GET(p, size)
      ELSE (*allocated*) SYSTEM.GET(p, tag); blktyp := tag MOD 4;
        IF blktyp = 0 THEN (*record*) SYSTEM.GET(tag, size) ELSE (*array*) SYSTEM.GET(p+16, size) END ;
        IF mark > 0 THEN (*marked*) SYSTEM.PUT(p+4, 0);
          IF continue THEN
            IF blktyp = 0 THEN (*record*)
              IF typ # NIL THEN INC(resTyp, typ(p, tag, s, continue)) END ;
              IF continue & ((ptr # NIL) OR (pvr # NIL)) THEN offadr := tag + 16; SYSTEM.GET(offadr, offset);
                WHILE continue & (offset # -1) DO (*pointers*)
                  IF ptr # NIL THEN SYSTEM.GET(p+8+offset, r); INC(resPtr, ptr(p+8+offset, r, s, continue)) END ;
                  INC(offadr, 4); SYSTEM.GET(offadr, offset)
                END ;
                IF continue & (pvr # NIL) THEN INC(offadr, 4); SYSTEM.GET(offadr, offset);
                  WHILE continue & (offset # -1) DO (*procedures*) SYSTEM.GET(p+8+offset, r);
                    INC(resPvr, pvr(p+8+offset, r, s, continue));
                    INC(offadr, 4); SYSTEM.GET(offadr, offset)
                  END
                END
              END
            ELSIF blktyp = 1 THEN (*array of record*)
              IF typ # NIL THEN INC(resTyp, typ(p, tag-1, s, continue)) END ;
              IF continue & ((ptr # NIL) OR (pvr # NIL)) THEN offadr := tag + 15; SYSTEM.GET(offadr, offset);
                SYSTEM.GET(p+8, len); SYSTEM.GET(p+12, elemsize); len := p + 24 + len*elemsize;
                WHILE continue & (offset # -1) DO (*pointers*)
                  IF ptr # NIL THEN pos := p + 24;
                    WHILE continue & (pos < len) DO SYSTEM.GET(pos+offset, r);
                      INC(resPtr, ptr(pos+offset, r, s, continue)); INC(pos, elemsize)
                    END
                  END ;
                  INC(offadr, 4); SYSTEM.GET(offadr, offset)
                END ;
                IF continue & (pvr # NIL) THEN INC(offadr, 4); SYSTEM.GET(offadr, offset);
                  WHILE continue & (offset # -1) DO (*procedures*) pos := p + 24;
                    WHILE continue & (pos < len) DO SYSTEM.GET(pos+offset, r);
                      INC(resPvr, pvr(pos+offset, r, s, continue)); INC(pos, elemsize)
                    END ;
                    INC(offadr, 4); SYSTEM.GET(offadr, offset)
                  END
                END
              END
            ELSIF blktyp = 2 THEN (*array of pointer*)
              IF ptr # NIL THEN SYSTEM.GET(p+8, len); pos := p + 24; len := pos + len*4;
                WHILE continue & (pos < len) DO SYSTEM.GET(pos, r);
                  INC(resPtr, ptr(pos, r, s, continue)); INC(pos, 4)
                END
              END
            ELSIF (tag = 7) & (pvr # NIL) THEN (*array of procedure*)
              SYSTEM.GET(p+8, len); pos := p + 24; len := pos + len*4;
              WHILE continue & (pos < len) DO SYSTEM.GET(pos, r);
                INC(resPvr, pvr(pos, r, s, continue)); INC(pos, 4)
              END
            END
          END
        END
      END ;
      INC(p, size)
    UNTIL p >= heapLim
  END Scan;
    ## Variables:
```
 t: INTEGER;
  BEGIN SYSTEM.GET(timer, t); RETURN t
  END Time;
  PROCEDURE Trap(## Variables:
```
 a: INTEGER; b, c, d: INTEGER);
    ## Variables:
```
 u, v, w: INTEGER;
    ## Variables:
```
 u, v, w: INTEGER;
  BEGIN u := SYSTEM.REG(15); SYSTEM.GET(u - 4, v); w := v DIV 10H MOD 10H; (*trap number*)
    IF w = 0 THEN New(a, b, c, d)
    ELSE (*stop*) LED(w + 192); REPEAT UNTIL FALSE
    END
  END Trap;
```
## Procedures:
---

`  PROCEDURE GetBlock(VAR p: LONGINT; len: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L37)


`  PROCEDURE GetBlock128(VAR p: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L56)


`  PROCEDURE GetBlock64(VAR p: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L65)


`  PROCEDURE GetBlock32(VAR p: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L74)


`  PROCEDURE New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L83)


`  PROCEDURE Mark*(pref: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L115)


`  PROCEDURE Collect*;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L159)


`  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L193)


`  PROCEDURE Time*(): INTEGER;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L258)


`  PROCEDURE Clock*(): INTEGER;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L263)


`  PROCEDURE SetClock*(dt: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L267)


`  PROCEDURE Install*(Padr, at: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L271)


`  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L275)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L283)

