
## [MODULE OXG](https://github.com/io-core/Build/blob/main/OXG.Mod)
Module OXG implements the processor-specific backends used by ORG

(C.Perkins 2020)

**OXG** is called from ORP and generates machine code various Oberon language constructs for the Oberon RISC5 architeture.


  ## Imports:
` SYSTEM Files ORS ORB`

## Constants:
```
     (*% *)
    WordSize* = 4;
    RStkOrg0 = -64;
    IStkOrg0 = -64;
    AStkOrg0 = -64;
    aStkOrg0 = -64;
    VStkOrg0 = -64;
    vStkOrg0 = -64;
    MT = 12; SP = 14; LNK = 15;   (*dedicated registers*)
    maxCode = 8000; maxStrx = 6400; maxTD = 160; C24 = 1000000H;
    Reg = 10; RegI = 11; Cond = 12;  (*internal item modes*)

    (*frequently used opcodes*)  U = 2000H; V = 1000H;
    Mov = 0; Lsl = 1; Asr = 2; Ror= 3; And = 4; Ann = 5; Ior = 6; Xor = 7;
    Add = 8; Sub = 9; Cmp = 9; Mul = 10; Div = 11;
    Fad = 12; Fsb = 13; Fml = 14; Fdv = 15; MovU = 16;
    Ldr = 8; Str = 10;
    BR = 0; BLR = 1; BC = 2; BL = 3;
    MI = 0; PL = 8; EQ = 1; NE = 9; LT = 5; GE = 13; LE = 6; GT = 14;
    (* %*)

```
## Types:
```
      (*% *)
    (* %*)

```
## Variables:
```
       (*% *)
    code*: ARRAY maxCode OF LONGINT;
    data*: ARRAY maxTD OF LONGINT;  (*type descriptors*)
    str*: ARRAY maxStrx OF CHAR;
    fixorgP*, fixorgD*, fixorgT*: LONGINT;   (*origins of lists of locations to be fixed up by loader*)
    err: ARRAY 32 OF CHAR;
    regmap: ARRAY 16 OF INTEGER; (*shuffle of registers for allocation/use*)
    (* %*)

```
## Procedures:
---

`  PROCEDURE setFixOrgP*(v: LONGINT);  (*% *)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L52)

---
**setFixOrgP**

`  PROCEDURE setFixOrgD*(v: LONGINT);  (*% *)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L61)

---
**setFixOrgD**

`  PROCEDURE setFixOrgT*(v: LONGINT);  (*% *)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L70)

---
**setFixOrgT**

`  PROCEDURE setRegMap*;               (*% *)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L79)

---
**setRegMap**
## ---------- Utility Operations
---
**Put1Byte** places a byte in in the instruction stream which is expected to have 8 zero bits at that location.

`  PROCEDURE Put1Byte(a: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L108)

---
**Put2Bytes** places two bytes in in the instruction stream.

`  PROCEDURE Put2Bytes(a, b: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L120)

---
**Put3Bytes** places three bytes in in the instruction stream.

`  PROCEDURE Put3Bytes(a, b, c: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L130)

---
**Put4Bytes** places four bytes in in the instruction stream.

`  PROCEDURE Put4Bytes(a, b, c, d: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L141)

---
**Put4Integer** places an integer as 4 bytes in in the instruction stream.

`  PROCEDURE Put4Integer(i: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L153)

## ---------- RISC5 instruction generation
---
**RPut0** PutRegFromRegOpReg

`  PROCEDURE RPut0*(VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L172)

---
**RPut1** PutRegFromRegOpImmSmall

`  PROCEDURE RPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L182)

---
**RPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE RPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L202)

---
**RPut2** PutRegLdStRegOffset

`  PROCEDURE RPut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L216)

---
**RPut3** PutBrCondOffset

`  PROCEDURE RPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L225)

---
**RHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE RHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L234)

## ---------- X8664 instruction generation
---
**IPut0** PutRegFromRegOpReg

`  PROCEDURE IPut0*(VAR pc, pcb: LONGINT; op, ai, bi, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L249)

---
**IPut1** PutRegFromRegOpImmSmall

`  PROCEDURE IPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, ai, bi, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L278)

---
**IPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE IPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L309)

---
**IPut2** PutRegLdStRegOffset

`  PROCEDURE IPut2*(VAR pc, pcb: LONGINT; op, ai, bi, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L325)

---
**IPut3** PutBrCondOffset

`  PROCEDURE IPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L345)

---
**IHeader** prepares the code introductory sequence for a compiled X8664 module

`  PROCEDURE IHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L395)

## ---------- ARM64 instruction generation
---
**APut0** PutRegFromRegOpReg

`  PROCEDURE APut0*(VAR pc, pcb: LONGINT; op, ai, bi, ci: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L413)

---
**APut1** PutRegFromRegOpImmSmall

`  PROCEDURE APut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, ai, bi, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L441)

---
**APut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE APut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L470)

---
**APut2** PutRegLdStRegOffset

`  PROCEDURE APut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L484)

---
**APut3** PutBrCondOffset

`  PROCEDURE APut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L493)

---
**AHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE AHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L516)

## ---------- ARM32 instruction generation
---
**aPut0** PutRegFromRegOpReg

`  PROCEDURE aPut0*(VAR pc, pcb: LONGINT; op, ai, bi, ci: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L535)

---
**aPut1** PutRegFromRegOpImmSmall

`  PROCEDURE aPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, ai, bi, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L568)

---
**aPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE aPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L612)

---
**aPut2** PutRegLdStRegOffset

`  PROCEDURE aPut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L626)

---
**aPut3** PutBrCondOffset

`  PROCEDURE aPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L635)

---
**aHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE aHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L658)

## ---------- RISCV64 instruction generation
---
**vUJ** convert an integer to UJ immediate format

`  PROCEDURE vUJ( i : LONGINT ): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L681)

---
**VPut0** PutRegFromRegOpReg

`  PROCEDURE VPut0*(VAR pc, pcb: LONGINT; op, ai, bi, ci: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L695)

---
**VPut1** PutRegFromRegOpImmSmall

`  PROCEDURE VPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, ai, bi, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L728)

---
**VPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE VPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L771)

---
**VPut2** PutRegLdStRegOffset

`  PROCEDURE VPut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L785)

---
**VPut3** PutBrCondOffset

`  PROCEDURE VPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L794)

---
**VHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE VHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L817)

## ---------- RISCV32 instruction generation
---
**vPut0** PutRegFromRegOpReg

`  PROCEDURE vPut0*(VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L838)

---
**vPut1** PutRegFromRegOpImmSmall

`  PROCEDURE vPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L846)

---
**vPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE vPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L854)

---
**vPut2** PutRegLdStRegOffset

`  PROCEDURE vPut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L862)

---
**vPut3** PutBrCondOffset

`  PROCEDURE vPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L870)

---
**vHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE vHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L878)


`  PROCEDURE fix*(at, with: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L891)


`  PROCEDURE FixOne*(pc,pcb,at: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L898)


`  PROCEDURE FixLink*(pc,pcb,L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L902)


`  PROCEDURE FixLinkWith*(L0, dst: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L910)


`  PROCEDURE merged*(L0, L1: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L921)

---
**MakeStringItem** prepares

`  PROCEDURE InternString*(VAR strx: LONGINT; len: LONGINT); (*copies string from ORS-buffer to ORG-string array*)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L938)

---
**SetCode** prepares

`  PROCEDURE SetCode*(i,v: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L953)

---
**SetData** prepares

`  PROCEDURE SetData*(i,v: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L961)

---
**NofPtrs** determines the number of Garbage Collection Roots.

`  PROCEDURE NofPtrs(typ: ORB.Type): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L970)

---
**FindPtrs** locates Garbage Collection roots.

`  PROCEDURE FindPtrs(VAR R: Files.Rider; typ: ORB.Type; adr: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L987)

---
**Close** writes the completed binary to disk.

`  PROCEDURE Close*(VAR pc, pcb: LONGINT; ` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1005)

