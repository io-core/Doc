
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

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

```
## Procedures:
---

`  PROCEDURE incR;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L67)


`  PROCEDURE Put0(op, a, b, c: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L72)


`  PROCEDURE Put1(op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L77)


`  PROCEDURE Put1a(op, a, b, im: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L83)


`  PROCEDURE Put1b(r, mno, off, disp: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L99)


`  PROCEDURE Put2(op, a, b, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L104)


`  PROCEDURE Put3(op, cond, off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L109)


`  PROCEDURE Put3a(op, mno, pno, disp: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L114)


`  PROCEDURE PutPair(base, op, a, b, off, format: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L119)


`  PROCEDURE CheckRegs*;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L131)


`  PROCEDURE SetCC(VAR x: Item; n: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L138)


`  PROCEDURE Trap(cond, num: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L142)


`  PROCEDURE NilCheck;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L146)


`  PROCEDURE negated(cond: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L152)


`  PROCEDURE fix(at, with: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L158)


`  PROCEDURE fix1(at, with: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L163)


`  PROCEDURE FixLinkWith(L, x: LONGINT); (*fixup with offset to x*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L170)


`  PROCEDURE FixLink*(L: LONGINT); (*fixup with offset to pc*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L183)


`  PROCEDURE FixLinkPair(L, adr: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L187)


`  PROCEDURE merged(L0, L1: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L198)


`  PROCEDURE load(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L210)


`  PROCEDURE loadAdr(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L239)


`  PROCEDURE loadCond(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L254)


`  PROCEDURE loadTypTagAdr(T: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L269)


`  PROCEDURE loadStringAdr(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L277)


`  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L285)


`  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L289)


`  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT);  (*copies string from ORS-buffer to ORG-string array*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L293)


`  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L303)


`  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L314)


`  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L325)


`  PROCEDURE DeRef*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L360)


`  PROCEDURE Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L374)


`  PROCEDURE Q(T: ORB.Type; VAR tdw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L382)


`  PROCEDURE FindRefFlds(ftyp: SET; typ: ORB.Type; off: LONGINT; VAR tdw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L390)


`  PROCEDURE BuildTD(T: ORB.Type; VAR tdw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L401)


`  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L435)


`  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L461)


`  PROCEDURE And1*(VAR x: Item);   (* x := x & *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L466)


`  PROCEDURE And2*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L470)


`  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L474)


`  PROCEDURE Or2*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L478)


`  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L484)


`  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L501)


`  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L518)


`  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L524)


`  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L536)


`  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L565)


`  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L577)


`  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L584)


`  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L604)


`  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L612)


`  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L642)


`  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L655)


`  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L663)


`  PROCEDURE StrToChar*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L677)


`  PROCEDURE Store*(VAR x, y: Item); (* x := y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L681)


`  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L694)


`  PROCEDURE StoreToInterface*(VAR x, y: Item); (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L723)


`  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y, frame = 0 *) ` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L736)


`  PROCEDURE OpenArrayParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L753)


`  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L762)


`  PROCEDURE ValueParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L776)


`  PROCEDURE StringParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L780)


`  PROCEDURE ReceiverParam*(VAR x: Item; par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L784)


`  PROCEDURE For0*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L793)


`  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L797)


`  PROCEDURE For2*(VAR x, y, w: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L810)


`  PROCEDURE Here*(): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L816)


`  PROCEDURE FJump*(VAR L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L820)


`  PROCEDURE CFJump*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L824)


`  PROCEDURE BJump*(L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L828)


`  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L832)


`  PROCEDURE Fixup*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L836)


`  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L840)


`  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L847)


`  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L854)


`  PROCEDURE Call*(VAR x: Item; r: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L861)


`  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L891)


`  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L905)


`  PROCEDURE CaseHead*(VAR x: Item; VAR L0: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L919)


`  PROCEDURE CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange);  (*L1 = label for else*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L929)


`  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L945)


`  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L961)


`  PROCEDURE Assert*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L971)


`  PROCEDURE New*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L980)


`  PROCEDURE Pack*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1001)


`  PROCEDURE Unpk*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1007)


`  PROCEDURE Led*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1014)


`  PROCEDURE Get*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1018)


`  PROCEDURE Put*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1022)


`  PROCEDURE Copy*(VAR x, y, z: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1026)


`  PROCEDURE LDPSR*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1039)


`  PROCEDURE LDREG*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1043)


`  PROCEDURE Abs*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1052)


`  PROCEDURE Odd*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1062)


`  PROCEDURE Floor*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1066)


`  PROCEDURE Float*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1070)


`  PROCEDURE Ord*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1074)


`  PROCEDURE Len*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1081)


`  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1092)


`  PROCEDURE ADC*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1101)


`  PROCEDURE SBC*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1105)


`  PROCEDURE UML*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1109)


`  PROCEDURE Bit*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1113)


`  PROCEDURE Register*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1121)


`  PROCEDURE H*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1126)


`  PROCEDURE Adr*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1131)


`  PROCEDURE Condition*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1140)


`  PROCEDURE Open*(v: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1144)


`  PROCEDURE SetDataSize*(dc: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1151)


`  PROCEDURE Header*;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1155)


`  PROCEDURE NofRefs(ftyp: SET; typ: ORB.Type): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1162)


`  PROCEDURE FindRefs(VAR R: Files.Rider; ftyp: SET; typ: ORB.Type; off: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1174)


`  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1185)

