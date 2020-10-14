
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

Procedures:


<code>  PROCEDURE incR;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L67)


<code>  PROCEDURE Put0(op, a, b, c: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L72)


<code>  PROCEDURE Put1(op, a, b, im: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L77)


<code>  PROCEDURE Put1a(op, a, b, im: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L83)


<code>  PROCEDURE Put1b(r, mno, off, disp: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L99)


<code>  PROCEDURE Put2(op, a, b, off: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L104)


<code>  PROCEDURE Put3(op, cond, off: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L109)


<code>  PROCEDURE Put3a(op, mno, pno, disp: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L114)


<code>  PROCEDURE PutPair(base, op, a, b, off, format: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L119)


<code>  PROCEDURE CheckRegs*;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L131)


<code>  PROCEDURE SetCC(VAR x: Item; n: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L138)


<code>  PROCEDURE Trap(cond, num: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L142)


<code>  PROCEDURE NilCheck;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L146)


<code>  PROCEDURE negated(cond: LONGINT): LONGINT;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L152)


<code>  PROCEDURE fix(at, with: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L158)


<code>  PROCEDURE fix1(at, with: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L163)


<code>  PROCEDURE FixLinkWith(L, x: LONGINT); (*fixup with offset to x*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L170)


<code>  PROCEDURE FixLink*(L: LONGINT); (*fixup with offset to pc*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L183)


<code>  PROCEDURE FixLinkPair(L, adr: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L187)


<code>  PROCEDURE merged(L0, L1: LONGINT): LONGINT;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L198)


<code>  PROCEDURE load(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L210)


<code>  PROCEDURE loadAdr(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L239)


<code>  PROCEDURE loadCond(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L254)


<code>  PROCEDURE loadTypTagAdr(T: ORB.Type);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L269)


<code>  PROCEDURE loadStringAdr(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L277)


<code>  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L285)


<code>  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L289)


<code>  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT);  (*copies string from ORS-buffer to ORG-string array*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L293)


<code>  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L303)


<code>  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L314)


<code>  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L325)


<code>  PROCEDURE DeRef*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L360)


<code>  PROCEDURE Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L374)


<code>  PROCEDURE Q(T: ORB.Type; VAR tdw: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L382)


<code>  PROCEDURE FindRefFlds(ftyp: SET; typ: ORB.Type; off: LONGINT; VAR tdw: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L390)


<code>  PROCEDURE BuildTD(T: ORB.Type; VAR tdw: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L401)


<code>  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L435)


<code>  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L461)


<code>  PROCEDURE And1*(VAR x: Item);   (* x := x & *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L466)


<code>  PROCEDURE And2*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L470)


<code>  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L474)


<code>  PROCEDURE Or2*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L478)


<code>  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L484)


<code>  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L501)


<code>  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L518)


<code>  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L524)


<code>  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L536)


<code>  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L565)


<code>  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L577)


<code>  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L584)


<code>  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L604)


<code>  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L612)


<code>  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L642)


<code>  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L655)


<code>  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L663)


<code>  PROCEDURE StrToChar*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L677)


<code>  PROCEDURE Store*(VAR x, y: Item); (* x := y *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L681)


<code>  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L694)


<code>  PROCEDURE StoreToInterface*(VAR x, y: Item); (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L723)


<code>  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y, frame = 0 *) </code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L736)


<code>  PROCEDURE OpenArrayParam*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L753)


<code>  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L762)


<code>  PROCEDURE ValueParam*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L776)


<code>  PROCEDURE StringParam*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L780)


<code>  PROCEDURE ReceiverParam*(VAR x: Item; par: ORB.Object);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L784)


<code>  PROCEDURE For0*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L793)


<code>  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L797)


<code>  PROCEDURE For2*(VAR x, y, w: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L810)


<code>  PROCEDURE Here*(): LONGINT;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L816)


<code>  PROCEDURE FJump*(VAR L: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L820)


<code>  PROCEDURE CFJump*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L824)


<code>  PROCEDURE BJump*(L: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L828)


<code>  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L832)


<code>  PROCEDURE Fixup*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L836)


<code>  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L840)


<code>  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L847)


<code>  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L854)


<code>  PROCEDURE Call*(VAR x: Item; r: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L861)


<code>  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L891)


<code>  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L905)


<code>  PROCEDURE CaseHead*(VAR x: Item; VAR L0: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L919)


<code>  PROCEDURE CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange);  (*L1 = label for else*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L929)


<code>  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L945)


<code>  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L961)


<code>  PROCEDURE Assert*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L971)


<code>  PROCEDURE New*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L980)


<code>  PROCEDURE Pack*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1001)


<code>  PROCEDURE Unpk*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1007)


<code>  PROCEDURE Led*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1014)


<code>  PROCEDURE Get*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1018)


<code>  PROCEDURE Put*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1022)


<code>  PROCEDURE Copy*(VAR x, y, z: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1026)


<code>  PROCEDURE LDPSR*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1039)


<code>  PROCEDURE LDREG*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1043)


<code>  PROCEDURE Abs*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1052)


<code>  PROCEDURE Odd*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1062)


<code>  PROCEDURE Floor*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1066)


<code>  PROCEDURE Float*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1070)


<code>  PROCEDURE Ord*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1074)


<code>  PROCEDURE Len*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1081)


<code>  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1092)


<code>  PROCEDURE ADC*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1101)


<code>  PROCEDURE SBC*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1105)


<code>  PROCEDURE UML*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1109)


<code>  PROCEDURE Bit*(VAR x, y: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1113)


<code>  PROCEDURE Register*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1121)


<code>  PROCEDURE H*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1126)


<code>  PROCEDURE Adr*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1131)


<code>  PROCEDURE Condition*(VAR x: Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1140)


<code>  PROCEDURE Open*(v: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1144)


<code>  PROCEDURE SetDataSize*(dc: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1151)


<code>  PROCEDURE Header*;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1155)


<code>  PROCEDURE NofRefs(ftyp: SET; typ: ORB.Type): LONGINT;</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1162)


<code>  PROCEDURE FindRefs(VAR R: Files.Rider; ftyp: SET; typ: ORB.Type; off: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1174)


<code>  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1185)

