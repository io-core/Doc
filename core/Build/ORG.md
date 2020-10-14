
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

Procedures:

```
  PROCEDURE incR;
```
```
  PROCEDURE Put0(op, a, b, c: LONGINT);
```
```
  PROCEDURE Put1(op, a, b, im: LONGINT);
```
```
  PROCEDURE Put1a(op, a, b, im: LONGINT);
```
```
  PROCEDURE Put1b(r, mno, off, disp: LONGINT);
```
```
  PROCEDURE Put2(op, a, b, off: LONGINT);
```
```
  PROCEDURE Put3(op, cond, off: LONGINT);
```
```
  PROCEDURE Put3a(op, mno, pno, disp: LONGINT);
```
```
  PROCEDURE PutPair(base, op, a, b, off, format: LONGINT);
```
```
  PROCEDURE CheckRegs*;
```
```
  PROCEDURE SetCC(VAR x: Item; n: LONGINT);
```
```
  PROCEDURE Trap(cond, num: LONGINT);
```
```
  PROCEDURE NilCheck;
```
```
  PROCEDURE negated(cond: LONGINT): LONGINT;
```
```
  PROCEDURE fix(at, with: LONGINT);
```
```
  PROCEDURE fix1(at, with: LONGINT);
```
```
  PROCEDURE FixLinkWith(L, x: LONGINT); (*fixup with offset to x*)
```
```
  PROCEDURE FixLink*(L: LONGINT); (*fixup with offset to pc*)
```
```
  PROCEDURE FixLinkPair(L, adr: LONGINT);
```
```
  PROCEDURE merged(L0, L1: LONGINT): LONGINT;
```
```
  PROCEDURE load(VAR x: Item);
```
```
  PROCEDURE loadAdr(VAR x: Item);
```
```
  PROCEDURE loadCond(VAR x: Item);
```
```
  PROCEDURE loadTypTagAdr(T: ORB.Type);
```
```
  PROCEDURE loadStringAdr(VAR x: Item);
```
```
  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);
```
```
  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);
```
```
  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT);  (*copies string from ORS-buffer to ORG-string array*)
```
```
  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);
```
```
  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)
```
```
  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)
```
```
  PROCEDURE DeRef*(VAR x: Item);
```
```
  PROCEDURE Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN);
```
```
  PROCEDURE Q(T: ORB.Type; VAR tdw: LONGINT);
```
```
  PROCEDURE FindRefFlds(ftyp: SET; typ: ORB.Type; off: LONGINT; VAR tdw: LONGINT);
```
```
  PROCEDURE BuildTD(T: ORB.Type; VAR tdw: LONGINT);
```
```
  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);
```
```
  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)
```
```
  PROCEDURE And1*(VAR x: Item);   (* x := x & *)
```
```
  PROCEDURE And2*(VAR x, y: Item);
```
```
  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)
```
```
  PROCEDURE Or2*(VAR x, y: Item);
```
```
  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)
```
```
  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)
```
```
  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;
```
```
  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)
```
```
  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)
```
```
  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)
```
```
  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)
```
```
  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)
```
```
  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)
```
```
  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)
```
```
  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)
```
```
  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)
```
```
  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)
```
```
  PROCEDURE StrToChar*(VAR x: Item);
```
```
  PROCEDURE Store*(VAR x, y: Item); (* x := y *)
```
```
  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)
```
```
  PROCEDURE StoreToInterface*(VAR x, y: Item); (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)
```
```
  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y, frame = 0 *) 
```
```
  PROCEDURE OpenArrayParam*(VAR x: Item);
```
```
  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);
```
```
  PROCEDURE ValueParam*(VAR x: Item);
```
```
  PROCEDURE StringParam*(VAR x: Item);
```
```
  PROCEDURE ReceiverParam*(VAR x: Item; par: ORB.Object);
```
```
  PROCEDURE For0*(VAR x, y: Item);
```
```
  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);
```
```
  PROCEDURE For2*(VAR x, y, w: Item);
```
```
  PROCEDURE Here*(): LONGINT;
```
```
  PROCEDURE FJump*(VAR L: LONGINT);
```
```
  PROCEDURE CFJump*(VAR x: Item);
```
```
  PROCEDURE BJump*(L: LONGINT);
```
```
  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);
```
```
  PROCEDURE Fixup*(VAR x: Item);
```
```
  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)
```
```
  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)
```
```
  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);
```
```
  PROCEDURE Call*(VAR x: Item; r: LONGINT);
```
```
  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);
```
```
  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);
```
```
  PROCEDURE CaseHead*(VAR x: Item; VAR L0: LONGINT);
```
```
  PROCEDURE CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange);  (*L1 = label for else*)
```
```
  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);
```
```
  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);
```
```
  PROCEDURE Assert*(VAR x: Item);
```
```
  PROCEDURE New*(VAR x, y: Item);
```
```
  PROCEDURE Pack*(VAR x, y: Item);
```
```
  PROCEDURE Unpk*(VAR x, y: Item);
```
```
  PROCEDURE Led*(VAR x: Item);
```
```
  PROCEDURE Get*(VAR x, y: Item);
```
```
  PROCEDURE Put*(VAR x, y: Item);
```
```
  PROCEDURE Copy*(VAR x, y, z: Item);
```
```
  PROCEDURE LDPSR*(VAR x: Item);
```
```
  PROCEDURE LDREG*(VAR x, y: Item);
```
```
  PROCEDURE Abs*(VAR x: Item);
```
```
  PROCEDURE Odd*(VAR x: Item);
```
```
  PROCEDURE Floor*(VAR x: Item);
```
```
  PROCEDURE Float*(VAR x: Item);
```
```
  PROCEDURE Ord*(VAR x: Item);
```
```
  PROCEDURE Len*(VAR x: Item);
```
```
  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);
```
```
  PROCEDURE ADC*(VAR x, y: Item);
```
```
  PROCEDURE SBC*(VAR x, y: Item);
```
```
  PROCEDURE UML*(VAR x, y: Item);
```
```
  PROCEDURE Bit*(VAR x, y: Item);
```
```
  PROCEDURE Register*(VAR x: Item);
```
```
  PROCEDURE H*(VAR x: Item);
```
```
  PROCEDURE Adr*(VAR x: Item);
```
```
  PROCEDURE Condition*(VAR x: Item);
```
```
  PROCEDURE Open*(v: INTEGER);
```
```
  PROCEDURE SetDataSize*(dc: LONGINT);
```
```
  PROCEDURE Header*;
```
```
  PROCEDURE NofRefs(ftyp: SET; typ: ORB.Type): LONGINT;
```
```
  PROCEDURE FindRefs(VAR R: Files.Rider; ftyp: SET; typ: ORB.Type; off: LONGINT);
```
```
  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);
```
