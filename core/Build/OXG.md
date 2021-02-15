
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
    Ldr = 8; Ldb = 9; Str = 10; Stb = 11;
    BR = 0; BLR = 1; BC = 2; BL = 3;
    MI = 0; PL = 8; EQ = 1; NE = 9; LT = 5; GE = 13; LE = 6; GT = 14;
    BMI =  0; BEQ =  1; BCS =  2; BVS =  3; 
    BLS =  4; BLT =  5; BLE =  6; B   =  7;
    BPL =  8; BNE =  9; BVC = 10; BCC = 11;
    BHI = 12; BGE = 13; BGT = 14; BNO = 15;
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
    it0: ARRAY 16 OF INTEGER;
    it1: ARRAY 16 OF INTEGER;
    it2: ARRAY 4 OF INTEGER;
    it3: ARRAY 16 OF INTEGER;
    (* %*)

```
## Procedures:
---

`  PROCEDURE setFixOrgP*(v: LONGINT);  (*%P *)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L62)

---
**setFixOrgP**

`  PROCEDURE setFixOrgD*(v: LONGINT);  (*%P *)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L71)

---
**setFixOrgD**

`  PROCEDURE setFixOrgT*(v: LONGINT);  (*%P *)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L80)

---
**setFixOrgT**
## ---------- Utility Operations
---
**Put1Byte** places a byte in in the instruction stream which is expected to have 8 zero bits at that location.

`  PROCEDURE Put1Byte(a: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L99)

---
**Put2Bytes** places two bytes in in the instruction stream.

`  PROCEDURE Put2Bytes(a, b: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L111)

---
**Put3Bytes** places three bytes in in the instruction stream.

`  PROCEDURE Put3Bytes(a, b, c: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L121)

---
**Put4Bytes** places four bytes in in the instruction stream.

`  PROCEDURE Put4Bytes(a, b, c, d: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L132)

---
**Put4Integer** places an integer as 4 bytes in in the instruction stream.

`  PROCEDURE Put4Integer(i: INTEGER; VAR pc, pcb: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L144)

## ---------- RISC5 instruction generation
---
**RPut0** PutRegFromRegOpReg

`  PROCEDURE RPut0*(VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L163)

---
**RPut1** PutRegFromRegOpImmSmall

`  PROCEDURE RPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L173)

---
**RPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE RPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L193)

---
**RPut2** PutRegLdStRegOffset

`  PROCEDURE RPut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L207)

---
**RPut3** PutBrCondOffset

`  PROCEDURE RPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L217)

---
**RHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE RHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L227)

## ---------- i64 instruction generation
---
**ISetTables** maps registers between the RISC5 model machine and the x86_64 actual machine and prepares opcode tables for x86_64.

`  PROCEDURE ISetTables;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L243)

---
**IPut0** places a register <= Register Operation Register instruction in the code array.

When the destination register (ai) is not the same as the first operand register (bi) 
the AX register is used as an intermediate register.


`  PROCEDURE IPut0*(VAR pc, pcb: LONGINT; op, ai, bi, ci: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L276)

---
**IPut1** places a register <= Register Operation Immediate instruction in the code array.

When the destination register (ai) is not the same as the first operand register (bi)
the AX register is used as an intermediate register.

The immediate value may be up to 32-bits in size.

If the 'U' bit is set and the operation is a move, the value is shifted left 32-bits.


`  PROCEDURE IPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, ai, bi, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L310)

---
**IPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE IPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L345)

---
**IPut2** PutRegLdStRegOffset

`  PROCEDURE IPut2*(VAR pc, pcb: LONGINT; op, ai, bi, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L361)

---
**IPut3** PutBrCondOffset

`  PROCEDURE IPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L381)

---
**IHeader** prepares the code introductory sequence for a compiled X8664 module

`  PROCEDURE IHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L435)

## ---------- ARM64 instruction generation
---
**ASetTables** maps registers between the RISC5 model machine and the aarch64 actual machine and prepares opcode tables for aarch64.

`  PROCEDURE ASetTables;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L454)

---
**APut0** PutRegFromRegOpReg

`  PROCEDURE APut0*(VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L484)

---
**APut1** PutRegFromRegOpImmSmall

`  PROCEDURE APut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L506)

---
**APut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE APut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L522)

---
**APut2** PutRegLdStRegOffset

`  PROCEDURE APut2*(VAR pc, pcb: LONGINT; op, ai, bi, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L542)

---
**APut3** PutBrCondOffset

`  PROCEDURE APut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L560)

---
**AHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE AHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L588)

## ---------- ARM32 instruction generation
---
**aSetTables** maps registers between the RISC5 model machine and the arm actual machine and prepares opcode tables for arm 32-bit.

`  PROCEDURE aSetTables;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L608)

---
**aUMT** convert an integer to mov m/t immediate format

`  PROCEDURE aUMT( i : LONGINT ): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L634)

---
**aPut0** PutRegFromRegOpReg

`  PROCEDURE aPut0*(VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L647)

---
**aPut1** PutRegFromRegOpImmSmall

`  PROCEDURE aPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L659)

---
**aPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE aPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L686)

---
**aPut2** PutRegLdStRegOffset

`  PROCEDURE aPut2*(VAR pc, pcb: LONGINT; op, ai, bi, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L703)

---
**aPut3** PutBrCondOffset

`  PROCEDURE aPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L721)

---
**aHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE aHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L745)

## ---------- RISCV64 instruction generation
---
**VSetTables** maps registers between the RISC5 model machine and the rv64 actual machine and prepares opcode tables for riscv64.

`  PROCEDURE VSetTables;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L767)

---
**vUJ** convert an integer to UJ immediate format

`  PROCEDURE vUJ( i : LONGINT ): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L796)

---
**VPut0** PutRegFromRegOpReg

`  PROCEDURE VPut0*(VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L810)

---
**VPut1** PutRegFromRegOpImmSmall

`  PROCEDURE VPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L824)

---
**VPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE VPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L842)

---
**VPut2** PutRegLdStRegOffset

`  PROCEDURE VPut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L859)

---
**VPut3** PutBrCondOffset

`  PROCEDURE VPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L872)

---
**VHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE VHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L895)

## ---------- RISCV32 instruction generation
---
**vSetTables** configures opcode tables for riscv32.

`  PROCEDURE vSetTables;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L916)

---
**vPut0** PutRegFromRegOpReg

`  PROCEDURE vPut0*(VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L927)

---
**vPut1** PutRegFromRegOpImmSmall

`  PROCEDURE vPut1*(o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L935)

---
**vPut1a** PutRegFromRegOpImmLargeViaRH

`  PROCEDURE vPut1a*(o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L943)

---
**vPut2** PutRegLdStRegOffset

`  PROCEDURE vPut2*(VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L951)

---
**vPut3** PutBrCondOffset

`  PROCEDURE vPut3*(VAR pc, pcb: LONGINT; op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L959)

---
**vHeader** prepares the code introductory sequence for a compiled module

`  PROCEDURE vHeader*(VAR pc, pcb, RH, entry, version: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L967)

---
**setRegMap**

`  PROCEDURE setRegMap*;               ` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L983)


`  PROCEDURE fix*(at, with: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L996)


`  PROCEDURE FixOne*(pc,pcb,at: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1003)


`  PROCEDURE FixLink*(pc,pcb,L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1007)


`  PROCEDURE FixLinkWith*(L0, dst: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1015)


`  PROCEDURE merged*(L0, L1: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1026)

---
**MakeStringItem** prepares

`  PROCEDURE InternString*(VAR strx: LONGINT; len: LONGINT); (*copies string from ORS-buffer to ORG-string array*)` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1043)

---
**SetCode** prepares

`  PROCEDURE SetCode*(i,v: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1058)

---
**SetData** prepares

`  PROCEDURE SetData*(i,v: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1066)

---
**NofPtrs** determines the number of Garbage Collection Roots.

`  PROCEDURE NofPtrs(typ: ORB.Type): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1075)

---
**FindPtrs** locates Garbage Collection roots.

`  PROCEDURE FindPtrs(VAR R: Files.Rider; typ: ORB.Type; adr: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1092)

---
**Close** writes the completed binary to disk.

`  PROCEDURE Close*(VAR pc, pcb: LONGINT; ` [(source)](https://github.com/io-core/Build/blob/main/OXG.Mod#L1110)

