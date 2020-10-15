
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

(N.Wirth, 16.4.2016 / 4.4.2017 / 31.5.2019  Oberon compiler; code generator for RISC / AP 1.9.20 Extended Oberon / CP 10.20 Integrated Oberon)

**ORG** is called from ORP and generates machine code various Oberon-2i language constructs for the Oberon RISC5 architeture.


  ## Imports:
` SYSTEM Files ORS ORB`

## Constants:
```
 WordSize* = 4;
    StkOrg0 = -64; VarOrg0 = 0;  (*for RISC-0 only*)
    TR = 13; SP = 14; LNK = 15;   (*dedicated registers*)
    maxCode = 8800; maxStrx = 3200; maxTD = 160; maxSet = WordSize*8;
    Reg = 10; RegI = 11; Cond = 12;  (*internal item modes*)
    Zero = 0; D = 4B00H; (*denormalized zero with an exponent of 127 + 24 = 151, used for FLOOR/FLT conversions*)
    F2 = -2;  (*F2 memory instruction*)
    F3 = -1; BCT = 0E7000000H; RTI = 10H; STI = 20H;  (*F3 branch instructions*)
    C4 = 10H; C6 = 40H; C8 = 100H; C10 = 400H; C12 = 1000H; C14 = 4000H; C16 = 10000H; C18 = 40000H;
    C20 = 100000H; C22 = 400000H; C24 = 1000000H; C26 = 4000000H; C28 = 10000000H; C30 = 40000000H;

  (*frequently used opcodes*)  U = 2000H; V = 1000H;
    Mov = 0; Lsl = 1; Asr = 2; Ror= 3; And = 4; Ann = 5; Ior = 6; Xor = 7;
    Add = 8; Sub = 9; Cmp = 9; Mul = 10; Div = 11;
    Fad = 12; Fsb = 13; Fml = 14; Fdv = 15;
    Ldr = 8; Str = 10;
    BR = 0; BLR = 1; BC = 2; BL = 3;
    MI = 0; PL = 8; EQ = 1; NE = 9; CS = 2; CC = 10; LT = 5; GE = 13; LE = 6; GT = 14;

```
## Types:
```
 Item* = RECORD
      mode*: INTEGER;
      type*: ORB.Type;
      a*, b*, r: LONGINT;
      rdo*: BOOLEAN  (*read only*)
    END ;
    LabelRange* = RECORD low*, high*, label*: INTEGER END ;

  (* Item forms and meaning of fields:
    mode    r      a       b
    --------------------------------
    Const   -     value (proc adr)  (immediate value)
    Var     base   off     -               (direct adr)
    Par      -     off0     off1         (indirect adr)
    Reg    regno
    RegI   regno   off     -
    Cond  cond   Fchain  Tchain  *)

```
## Variables:
```
 pc*: LONGINT;    (*program counter*)
    varx, strx, tdw: LONGINT;  (*varx and strx in bytes, tdw in words*)
    entry: LONGINT;   (*main entry point*)
    RH: LONGINT;  (*available registers R[0] ... R[H-1]*)
    frame: LONGINT;  (*frame offset changed in SaveRegs and RestoreRegs*)
    fixorgP, fixorgD, fixorgT, fixorgM: LONGINT;   (*origins of lists of locations to be fixed up by loader*)
    check: BOOLEAN;  (*emit run-time checks*)
    version: INTEGER;  (* 0 = RISC-0, 1 = RISC-5 *)
    relmap: ARRAY 6 OF INTEGER;  (*condition codes for relations*)
    code: ARRAY maxCode OF LONGINT;
    str: ARRAY maxStrx OF CHAR;  (*strings*)
    td: ARRAY maxTD OF LONGINT;  (*type descriptors*)

```
## Procedures:
---
## Instruction assemblers according to formats
---
**incR** allocates the next register as in use or marks an error signalling overflow.

`  PROCEDURE incR;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L81)


`  PROCEDURE Put0(op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L86)


`  PROCEDURE Put1(op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L91)


`  PROCEDURE Put1a(op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L97)


`  PROCEDURE Put1b(r, mno, off, disp: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L113)


`  PROCEDURE Put2(op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L118)


`  PROCEDURE Put3(op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L123)


`  PROCEDURE Put3a(op, mno, pno, disp: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L128)


`  PROCEDURE PutPair(base, op, a, b, off, format: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L133)


`  PROCEDURE CheckRegs*;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L145)


`  PROCEDURE SetCC(VAR x: Item; n: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L152)


`  PROCEDURE Trap(cond, num: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L156)


`  PROCEDURE NilCheck;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L160)

## Handling of forward reference, fixups of instruction operands

`  PROCEDURE negated(cond: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L170)


`  PROCEDURE fix(at, with: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L176)


`  PROCEDURE fix1(at, with: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L181)


`  PROCEDURE FixLinkWith(L, x: LONGINT); (*fixup with offset to x*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L188)


`  PROCEDURE FixLink*(L: LONGINT); (*fixup with offset to pc*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L201)


`  PROCEDURE FixLinkPair(L, adr: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L205)


`  PROCEDURE merged(L0, L1: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L216)

## Loading of operands and addresses into registers

`  PROCEDURE load(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L232)


`  PROCEDURE loadAdr(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L261)


`  PROCEDURE loadCond(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L276)


`  PROCEDURE loadTypTagAdr(T: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L291)


`  PROCEDURE loadStringAdr(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L299)

## Items: Conversion from constants or from Objects on the Heap to Items on the Stack

`  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L311)


`  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L315)


`  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT);  (*copies string from ORS-buffer to ORG-string array*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L319)


`  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L329)

## Code generation for Selectors, Variables, Constants

`  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L344)


`  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L355)


`  PROCEDURE DeRef*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L390)


`  PROCEDURE Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L404)


`  PROCEDURE Q(T: ORB.Type; VAR tdw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L412)


`  PROCEDURE FindRefFlds(ftyp: SET; typ: ORB.Type; off: LONGINT; VAR tdw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L420)


`  PROCEDURE BuildTD(T: ORB.Type; VAR tdw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L431)


`  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L465)

## Code generation for Boolean operators

`  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L495)


`  PROCEDURE And1*(VAR x: Item);   (* x := x & *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L500)


`  PROCEDURE And2*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L504)


`  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L508)


`  PROCEDURE Or2*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L512)

## Code generation for arithmetic operators

`  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L522)


`  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L539)


`  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L556)


`  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L562)


`  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L574)

## Code generation for REAL operators

`  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L607)

## Code generation for set operators

`  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L623)


`  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L630)


`  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L650)


`  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L658)

## Code generation for relations

`  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L692)


`  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L705)


`  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L713)

## Code generation of Assigments

`  PROCEDURE StrToChar*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L731)


`  PROCEDURE Store*(VAR x, y: Item); (* x := y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L735)


`  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L748)


`  PROCEDURE StoreToInterface*(VAR x, y: Item); (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L777)


`  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y, frame = 0 *) ` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L790)

## Code generation for parameters

`  PROCEDURE OpenArrayParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L811)


`  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L820)


`  PROCEDURE ValueParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L834)


`  PROCEDURE StringParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L838)


`  PROCEDURE ReceiverParam*(VAR x: Item; par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L842)

## For Statements

`  PROCEDURE For0*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L855)


`  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L859)


`  PROCEDURE For2*(VAR x, y, w: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L872)

## Branches, procedure calls, procedure prolog and epilog

`  PROCEDURE Here*(): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L882)


`  PROCEDURE FJump*(VAR L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L886)


`  PROCEDURE CFJump*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L890)


`  PROCEDURE BJump*(L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L894)


`  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L898)


`  PROCEDURE Fixup*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L902)


`  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L906)


`  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L913)


`  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L920)


`  PROCEDURE Call*(VAR x: Item; r: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L927)


`  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L957)


`  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L971)

## Case Statements

`  PROCEDURE CaseHead*(VAR x: Item; VAR L0: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L989)


`  PROCEDURE CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange);  (*L1 = label for else*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L999)

## In-line code procedures

`  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1019)


`  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1035)


`  PROCEDURE Assert*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1045)


`  PROCEDURE New*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1054)


`  PROCEDURE Pack*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1075)


`  PROCEDURE Unpk*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1081)


`  PROCEDURE Led*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1088)


`  PROCEDURE Get*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1092)


`  PROCEDURE Put*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1096)


`  PROCEDURE Copy*(VAR x, y, z: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1100)


`  PROCEDURE LDPSR*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1113)


`  PROCEDURE LDREG*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1117)

## In-line code functions

`  PROCEDURE Abs*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1130)


`  PROCEDURE Odd*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1140)


`  PROCEDURE Floor*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1144)


`  PROCEDURE Float*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1148)


`  PROCEDURE Ord*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1152)


`  PROCEDURE Len*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1159)


`  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1170)


`  PROCEDURE ADC*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1179)


`  PROCEDURE SBC*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1183)


`  PROCEDURE UML*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1187)


`  PROCEDURE Bit*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1191)


`  PROCEDURE Register*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1199)


`  PROCEDURE H*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1204)


`  PROCEDURE Adr*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1209)


`  PROCEDURE Condition*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1218)


`  PROCEDURE Open*(v: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1222)


`  PROCEDURE SetDataSize*(dc: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1229)


`  PROCEDURE Header*;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1233)


`  PROCEDURE NofRefs(ftyp: SET; typ: ORB.Type): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1240)


`  PROCEDURE FindRefs(VAR R: Files.Rider; ftyp: SET; typ: ORB.Type; off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1252)


`  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1263)

