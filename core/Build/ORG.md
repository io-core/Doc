
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

(N.Wirth, 16.4.2016 / 4.4.2017 / 31.5.2019  Oberon compiler; code generator for RISC)

**ORG** is called from ORP and generates machine code various Oberon language constructs for the Oberon RISC5 architeture.


  ## Imports:
` SYSTEM Files ORS ORB OXG`

## Constants:
```

    WordSize* = 4;
    StkOrg0 = -64; VarOrg0 = 0;  (*for RISC-0 only*)
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

```
## Types:
```
 
    Item* = RECORD
      mode*: INTEGER;
      type*: ORB.Type;
      a*, b*, r: LONGINT;
      rdo*: BOOLEAN  (*read only*)
    END ;

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
 
    pc*, pcb*, varsize: LONGINT;   (*program counter, data index*)
    tdx, strx: LONGINT;
    entry: LONGINT;   (*main entry point*)
    RH: LONGINT;  (*available registers R[0] ... R[H-1]*)
    frame: LONGINT;  (*frame offset changed in SaveRegs and RestoreRegs*)
    check: BOOLEAN;  (*emit run-time checks*)
    version: INTEGER;  (* 0 = RISC-0, 1 = RISC-5 *)
    relmap: ARRAY 6 OF INTEGER;  (*condition codes for relations*)
    xPut0: PROCEDURE  (VAR pc, pcb: LONGINT; op, a, b, c: LONGINT);
    xPut1: PROCEDURE  (o: INTEGER; VAR pc, pcb: LONGINT; op, a, b, im: LONGINT);
    xPut1a: PROCEDURE (o: INTEGER; VAR pc, pcb, RH: LONGINT; op, a, b, im: LONGINT);
    xPut2: PROCEDURE  (VAR pc, pcb: LONGINT; op, a, b, off: LONGINT);
    xPut3: PROCEDURE  (VAR pc, pcb: LONGINT; op, cond, off: LONGINT);
    xHeader: PROCEDURE (VAR pc, pcb, RH, entry, version: LONGINT);

```
## Procedures:
---
## ---------- Instruction assemblers according to formats

`  PROCEDURE incR;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L74)


`  PROCEDURE CheckRegs*;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L79)


`  PROCEDURE SetCC(VAR x: Item; n: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L86)


`  PROCEDURE Trap(cond, num: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L90)

## ---------- Handling of forward reference, fixups of instruction operands

`  PROCEDURE negated(cond: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L98)


`  PROCEDURE FixOne*(at: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L104)


`  PROCEDURE FixLink*(L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L108)

## ----------  Loading of operands and addresses into registers
---
**GetSB** loads the static base of a module

`  PROCEDURE GetSB(base: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L122)

---
**NilCheck** ensures a pointer is not NIL

`  PROCEDURE NilCheck;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L133)

---
**load** generates loading the contents of a variable

`  PROCEDURE load(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L141)

---
**loadAdr** generates loading the location of a variable

`  PROCEDURE loadAdr(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L179)

---
**loadCond** generates loading a boolean

`  PROCEDURE loadCond(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L200)

---
**loadTypTagAdr** generates loading a type tag address

`  PROCEDURE loadTypTagAdr(T: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L217)

---
**loadStringAdr** generates loading a string address

`  PROCEDURE loadStringAdr(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L226)

## ----------  Items: Conversion from constants or from Objects on the Heap to Items on the Stack
---
**MakeConstItem** prepares

`  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L240)

---
**MakeRealItem** prepares

`  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L248)

---
**MakeStringItem** prepares

`  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT); (*copies string from ORS-buffer to ORG-string array*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L257)

---
**MakeItem** prepares

`  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L275)

## ----------  Code generation for Selectors, Variables, Constants
---
**Field** locates a record field

`  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L294)

---
**Index** locates an array element

`  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L309)

---
**DeRef** generates a dereference

`  PROCEDURE DeRef*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L348)

---
**Q** prepares

`  PROCEDURE Q(T: ORB.Type; VAR dcw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L365)

---
**FindPtrFlds** prepares

`  PROCEDURE FindPtrFlds(typ: ORB.Type; off: LONGINT; VAR dcw: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L377)

---
**BuildTD** prepares

`  PROCEDURE BuildTD*(T: ORB.Type; VAR dc: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L394)

---
**TypeTest** generates a type test

`  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L414)

## ----------  Code generation for Boolean operators
---
**Not** generates

`  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L448)

---
**And1** generates

`  PROCEDURE And1*(VAR x: Item);   (* x := x & *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L459)

---
**And2** generates

`  PROCEDURE And2*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L469)

---
**Or1** generates

`  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L479)

---
**Or2** generates

`  PROCEDURE Or2*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L489)

## ----------  Code generation for arithmetic operators

`  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L501)

---
**AddOp** generates an add operation

`  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L522)

---
**log2** generates a log2 operation

`  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L543)

---
**MulOp** generates a multipy operation

`  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L553)

---
**DivOp** generates a divide operation

`  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L569)

## ----------  Code generation for REAL operators
---
**RealOp** generates operations on reals

`  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L606)

## ----------  Code generation for set operators
---
**Singleton** generates a set of one set item.

`  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L626)

---
**Set** generates a set value from two set items.

`  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L637)

---
**In** generates a test for if an item is in a set

`  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L660)

---
**SetOp** generates operations on sets

`  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L672)

## ----------  Code generation for relations
---
**IntRelation** generates an integer comparison

`  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L710)

---
**RealRelation** generates a real comparison

`  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L727)

---
**StringRelation** generates a string comparison

`  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L739)

## ----------  Code generation of Assigments
---
**StrToChar** ??

`  PROCEDURE StrToChar*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L761)

---
**Store** generates the copying of the value of one word-sized variable into another word-sized variable.

`  PROCEDURE Store*(VAR x, y: Item); (* x := y *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L769)

---
**StoreStruct** generates copying the contents of one structure into another structure.

`  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L788)

---
**CopyString** generates copying the contents of one string variable into another string variable.

`  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y *) ` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L822)

## ----------  Code generation for parameters
---
**OpenArrayParam** generates placing the address of an open array variable in a register, allocating the register.

`  PROCEDURE OpenArrayParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L846)

---
**VarParam** generates placing the address of a variable in a register, allocating the register.

`  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L856)

---
**ValueParam** generates placing a value in a register.

`  PROCEDURE ValueParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L871)

---
**StringParam** generates placing the location of a string in a register, allocating the register.

`  PROCEDURE StringParam*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L879)

## ----------  For Statements
---
**For0** generates the initial part of a FOR statement

`  PROCEDURE For0*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L893)

---
**FOR1** generates the central part of a FOR statement

`  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L901)

---
**FOR2** generates the final part of a FOR statement.

`  PROCEDURE For2*(VAR x, y, w: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L918)

## ----------  Branches, procedure calls, procedure prolog and epilog
---
**Here** returns the next available code location.

`  PROCEDURE Here*(): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L932)

---
**FJump** generates a forward jump.

`  PROCEDURE FJump*(VAR L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L940)

---
**CFJump** generates a conditional forward jump

`  PROCEDURE CFJump*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L948)

---
**BJump** generates a backwards jump.

`  PROCEDURE BJump*(L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L958)

---
**CBJump** generates a conditional backwards jump.

`  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L966)

---
**Fixup** fixes ???

`  PROCEDURE Fixup*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L976)

---
**SaveRegs** saves register values in preparation for a procedure call.

`  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L984)

---
**RestoreRegs** brings values back into registers after a procedure call.

`  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L995)

---
**PrepCall** generates generates a sequence that preapreas for a procedure call.

`  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1006)

---
**Call** generates the procedure call sequence.

`  PROCEDURE Call*(VAR x: Item; r: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1017)

---
**Enter** generates the procedure entry sequence.

`  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1045)

---
**Return** generates the procedure return sequence.

`  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1063)

## ----------  In-line code procedures
---
**Increment** generates an inline routine that increments a variable.

`  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1085)

---
**Include** generates a routine that ??

`  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1105)

---
**Assert** generates an inline routine that traps on a condition.

`  PROCEDURE Assert*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1119)

---
**New** generates an inline routine that allocates heap memory via trap 0.

`  PROCEDURE New*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1133)

---
**Pack** generates an inline routine that ??

`  PROCEDURE Pack*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1141)

---
**Unpk** generates in inline routine that ??

`  PROCEDURE Unpk*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1151)

---
**Led** generates an inline routine that displays a bit pattern on the LED display.

`  PROCEDURE Led*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1162)

---
**Get** generates an inline routine that loads a value from an IO register.

`  PROCEDURE Get*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1170)

---
**Put** generates an inline routine that stores a value in an IO register.

`  PROCEDURE Put*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1178)

---
**Copy** generates an inline memory copy routine.     

`  PROCEDURE Copy*(VAR x, y, z: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1186)

---
**LDPSR** places the processor status register in a variable     

`  PROCEDURE LDPSR*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1203)

---
**LDREG** places a register value in a variable     

`  PROCEDURE LDREG*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1211)

## ----------  In-line code functions
---
**Abs** generates an inline functionn that takes the absolute value     

`  PROCEDURE Abs*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1228)

---
**Odd** generates an inlinen function that checks whether a value is odd.     

`  PROCEDURE Odd*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1242)

---
**Floor** generates an inline function that produces the floor of a value.     

`  PROCEDURE Floor*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1250)

---
**Float** generates an inline function that produces a float.     

`  PROCEDURE Float*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1258)

---
**Ord** generates an inline function that presents the ordinal value of its parameter.     

`  PROCEDURE Ord*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1266)

---
**Len** generates an inline function that presents the length of an array.     

`  PROCEDURE Len*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1275)

---
**Shift** generates an inline function that performs bit shifts.      

`  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1288)

---
**ADC** generates an inline function that Adds with Carry     

`  PROCEDURE ADC*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1301)

---
**SBC** generates an inline function that Subtracts with Carry 

`  PROCEDURE SBC*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1309)

---
**UML** generates an inline function ??     

`  PROCEDURE UML*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1317)

---
**Bit** generates an inline function presenting the yth bit of x      

`  PROCEDURE Bit*(VAR x, y: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1325)

---
**Register** generates an inline function presenting a general register's contents      

`  PROCEDURE Register*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1337)

---
**H** genrates an inline funtion presenting the contents of the H register.     

`  PROCEDURE H*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1346)

---
**Adr** generates an inline function presenting the memory address of its parameter.      

`  PROCEDURE Adr*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1355)

---
**Condition** generates an inline function presenting a condition.     

`  PROCEDURE Condition*(VAR x: Item);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1368)

---
**Open** initializes the ORG module code generation engine.     

`  PROCEDURE Open*(v: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1376)

---
**SetDataSize** sets the amount of space reserved for module global variables.     

`  PROCEDURE SetDataSize*(dc: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1394)

---
**Header** prepares the code introductory sequence for a compiled module     

`  PROCEDURE Header*;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1402)

---
**NofPtrs** determines the number of Garbage Collection Roots.

`  PROCEDURE NofPtrs(typ: ORB.Type): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1411)

---
**FindPtrs** locates Garbage Collection roots.

`  PROCEDURE FindPtrs(VAR R: Files.Rider; typ: ORB.Type; adr: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1428)

---
**Close** writes the completed binary to disk.

`  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1447)

---
**The initialzation code for this module** merely sets the 6 values in the global relmap array.

This module's global variables are initialized by ORP calling ORG.Open, once it has begun parsing the source code's Module
definition and determined that its module imports are available and of compatible object filetype.
