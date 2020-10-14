
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

Procedures:

[](https://github.com/io-core/Build/blob/main/ORG.Mod#L67) `  PROCEDURE incR;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L72) `  PROCEDURE Put0(op, a, b, c: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L77) `  PROCEDURE Put1(op, a, b, im: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L83) `  PROCEDURE Put1a(op, a, b, im: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L99) `  PROCEDURE Put1b(r, mno, off, disp: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L104) `  PROCEDURE Put2(op, a, b, off: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L109) `  PROCEDURE Put3(op, cond, off: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L114) `  PROCEDURE Put3a(op, mno, pno, disp: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L119) `  PROCEDURE PutPair(base, op, a, b, off, format: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L131) `  PROCEDURE CheckRegs*;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L138) `  PROCEDURE SetCC(VAR x: Item; n: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L142) `  PROCEDURE Trap(cond, num: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L146) `  PROCEDURE NilCheck;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L152) `  PROCEDURE negated(cond: LONGINT): LONGINT;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L158) `  PROCEDURE fix(at, with: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L163) `  PROCEDURE fix1(at, with: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L170) `  PROCEDURE FixLinkWith(L, x: LONGINT); (*fixup with offset to x*)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L183) `  PROCEDURE FixLink*(L: LONGINT); (*fixup with offset to pc*)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L187) `  PROCEDURE FixLinkPair(L, adr: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L198) `  PROCEDURE merged(L0, L1: LONGINT): LONGINT;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L210) `  PROCEDURE load(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L239) `  PROCEDURE loadAdr(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L254) `  PROCEDURE loadCond(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L269) `  PROCEDURE loadTypTagAdr(T: ORB.Type);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L277) `  PROCEDURE loadStringAdr(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L285) `  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L289) `  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L293) `  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT);  (*copies string from ORS-buffer to ORG-string array*)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L303) `  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L314) `  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L325) `  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L360) `  PROCEDURE DeRef*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L374) `  PROCEDURE Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L382) `  PROCEDURE Q(T: ORB.Type; VAR tdw: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L390) `  PROCEDURE FindRefFlds(ftyp: SET; typ: ORB.Type; off: LONGINT; VAR tdw: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L401) `  PROCEDURE BuildTD(T: ORB.Type; VAR tdw: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L435) `  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L461) `  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L466) `  PROCEDURE And1*(VAR x: Item);   (* x := x & *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L470) `  PROCEDURE And2*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L474) `  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L478) `  PROCEDURE Or2*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L484) `  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L501) `  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L518) `  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L524) `  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L536) `  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L565) `  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L577) `  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L584) `  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L604) `  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L612) `  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L642) `  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L655) `  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L663) `  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L677) `  PROCEDURE StrToChar*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L681) `  PROCEDURE Store*(VAR x, y: Item); (* x := y *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L694) `  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L723) `  PROCEDURE StoreToInterface*(VAR x, y: Item); (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L736) `  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y, frame = 0 *) `
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L753) `  PROCEDURE OpenArrayParam*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L762) `  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L776) `  PROCEDURE ValueParam*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L780) `  PROCEDURE StringParam*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L784) `  PROCEDURE ReceiverParam*(VAR x: Item; par: ORB.Object);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L793) `  PROCEDURE For0*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L797) `  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L810) `  PROCEDURE For2*(VAR x, y, w: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L816) `  PROCEDURE Here*(): LONGINT;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L820) `  PROCEDURE FJump*(VAR L: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L824) `  PROCEDURE CFJump*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L828) `  PROCEDURE BJump*(L: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L832) `  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L836) `  PROCEDURE Fixup*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L840) `  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L847) `  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L854) `  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L861) `  PROCEDURE Call*(VAR x: Item; r: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L891) `  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L905) `  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L919) `  PROCEDURE CaseHead*(VAR x: Item; VAR L0: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L929) `  PROCEDURE CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange);  (*L1 = label for else*)`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L945) `  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L961) `  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L971) `  PROCEDURE Assert*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L980) `  PROCEDURE New*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1001) `  PROCEDURE Pack*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1007) `  PROCEDURE Unpk*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1014) `  PROCEDURE Led*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1018) `  PROCEDURE Get*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1022) `  PROCEDURE Put*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1026) `  PROCEDURE Copy*(VAR x, y, z: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1039) `  PROCEDURE LDPSR*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1043) `  PROCEDURE LDREG*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1052) `  PROCEDURE Abs*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1062) `  PROCEDURE Odd*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1066) `  PROCEDURE Floor*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1070) `  PROCEDURE Float*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1074) `  PROCEDURE Ord*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1081) `  PROCEDURE Len*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1092) `  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1101) `  PROCEDURE ADC*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1105) `  PROCEDURE SBC*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1109) `  PROCEDURE UML*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1113) `  PROCEDURE Bit*(VAR x, y: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1121) `  PROCEDURE Register*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1126) `  PROCEDURE H*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1131) `  PROCEDURE Adr*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1140) `  PROCEDURE Condition*(VAR x: Item);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1144) `  PROCEDURE Open*(v: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1151) `  PROCEDURE SetDataSize*(dc: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1155) `  PROCEDURE Header*;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1162) `  PROCEDURE NofRefs(ftyp: SET; typ: ORB.Type): LONGINT;`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1174) `  PROCEDURE FindRefs(VAR R: Files.Rider; ftyp: SET; typ: ORB.Type; off: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORG.Mod#L1185) `  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);`
