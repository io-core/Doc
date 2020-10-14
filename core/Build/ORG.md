
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

Procedures:


<pre>  PROCEDURE incR;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L67)


<pre>  PROCEDURE Put0(op, a, b, c: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L72)


<pre>  PROCEDURE Put1(op, a, b, im: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L77)


<pre>  PROCEDURE Put1a(op, a, b, im: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L83)


<pre>  PROCEDURE Put1b(r, mno, off, disp: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L99)


<pre>  PROCEDURE Put2(op, a, b, off: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L104)


<pre>  PROCEDURE Put3(op, cond, off: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L109)


<pre>  PROCEDURE Put3a(op, mno, pno, disp: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L114)


<pre>  PROCEDURE PutPair(base, op, a, b, off, format: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L119)


<pre>  PROCEDURE CheckRegs*;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L131)


<pre>  PROCEDURE SetCC(VAR x: Item; n: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L138)


<pre>  PROCEDURE Trap(cond, num: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L142)


<pre>  PROCEDURE NilCheck;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L146)


<pre>  PROCEDURE negated(cond: LONGINT): LONGINT;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L152)


<pre>  PROCEDURE fix(at, with: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L158)


<pre>  PROCEDURE fix1(at, with: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L163)


<pre>  PROCEDURE FixLinkWith(L, x: LONGINT); (*fixup with offset to x*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L170)


<pre>  PROCEDURE FixLink*(L: LONGINT); (*fixup with offset to pc*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L183)


<pre>  PROCEDURE FixLinkPair(L, adr: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L187)


<pre>  PROCEDURE merged(L0, L1: LONGINT): LONGINT;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L198)


<pre>  PROCEDURE load(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L210)


<pre>  PROCEDURE loadAdr(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L239)


<pre>  PROCEDURE loadCond(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L254)


<pre>  PROCEDURE loadTypTagAdr(T: ORB.Type);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L269)


<pre>  PROCEDURE loadStringAdr(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L277)


<pre>  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L285)


<pre>  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L289)


<pre>  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT);  (*copies string from ORS-buffer to ORG-string array*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L293)


<pre>  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L303)


<pre>  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L314)


<pre>  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L325)


<pre>  PROCEDURE DeRef*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L360)


<pre>  PROCEDURE Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L374)


<pre>  PROCEDURE Q(T: ORB.Type; VAR tdw: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L382)


<pre>  PROCEDURE FindRefFlds(ftyp: SET; typ: ORB.Type; off: LONGINT; VAR tdw: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L390)


<pre>  PROCEDURE BuildTD(T: ORB.Type; VAR tdw: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L401)


<pre>  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L435)


<pre>  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L461)


<pre>  PROCEDURE And1*(VAR x: Item);   (* x := x & *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L466)


<pre>  PROCEDURE And2*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L470)


<pre>  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L474)


<pre>  PROCEDURE Or2*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L478)


<pre>  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L484)


<pre>  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L501)


<pre>  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L518)


<pre>  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L524)


<pre>  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L536)


<pre>  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L565)


<pre>  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L577)


<pre>  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L584)


<pre>  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L604)


<pre>  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L612)


<pre>  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L642)


<pre>  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L655)


<pre>  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L663)


<pre>  PROCEDURE StrToChar*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L677)


<pre>  PROCEDURE Store*(VAR x, y: Item); (* x := y *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L681)


<pre>  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L694)


<pre>  PROCEDURE StoreToInterface*(VAR x, y: Item); (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L723)


<pre>  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y, frame = 0 *) </pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L736)


<pre>  PROCEDURE OpenArrayParam*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L753)


<pre>  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L762)


<pre>  PROCEDURE ValueParam*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L776)


<pre>  PROCEDURE StringParam*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L780)


<pre>  PROCEDURE ReceiverParam*(VAR x: Item; par: ORB.Object);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L784)


<pre>  PROCEDURE For0*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L793)


<pre>  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L797)


<pre>  PROCEDURE For2*(VAR x, y, w: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L810)


<pre>  PROCEDURE Here*(): LONGINT;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L816)


<pre>  PROCEDURE FJump*(VAR L: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L820)


<pre>  PROCEDURE CFJump*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L824)


<pre>  PROCEDURE BJump*(L: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L828)


<pre>  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L832)


<pre>  PROCEDURE Fixup*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L836)


<pre>  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L840)


<pre>  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L847)


<pre>  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L854)


<pre>  PROCEDURE Call*(VAR x: Item; r: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L861)


<pre>  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L891)


<pre>  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L905)


<pre>  PROCEDURE CaseHead*(VAR x: Item; VAR L0: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L919)


<pre>  PROCEDURE CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange);  (*L1 = label for else*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L929)


<pre>  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L945)


<pre>  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L961)


<pre>  PROCEDURE Assert*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L971)


<pre>  PROCEDURE New*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L980)


<pre>  PROCEDURE Pack*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1001)


<pre>  PROCEDURE Unpk*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1007)


<pre>  PROCEDURE Led*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1014)


<pre>  PROCEDURE Get*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1018)


<pre>  PROCEDURE Put*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1022)


<pre>  PROCEDURE Copy*(VAR x, y, z: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1026)


<pre>  PROCEDURE LDPSR*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1039)


<pre>  PROCEDURE LDREG*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1043)


<pre>  PROCEDURE Abs*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1052)


<pre>  PROCEDURE Odd*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1062)


<pre>  PROCEDURE Floor*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1066)


<pre>  PROCEDURE Float*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1070)


<pre>  PROCEDURE Ord*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1074)


<pre>  PROCEDURE Len*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1081)


<pre>  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1092)


<pre>  PROCEDURE ADC*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1101)


<pre>  PROCEDURE SBC*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1105)


<pre>  PROCEDURE UML*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1109)


<pre>  PROCEDURE Bit*(VAR x, y: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1113)


<pre>  PROCEDURE Register*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1121)


<pre>  PROCEDURE H*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1126)


<pre>  PROCEDURE Adr*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1131)


<pre>  PROCEDURE Condition*(VAR x: Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1140)


<pre>  PROCEDURE Open*(v: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1144)


<pre>  PROCEDURE SetDataSize*(dc: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1151)


<pre>  PROCEDURE Header*;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1155)


<pre>  PROCEDURE NofRefs(ftyp: SET; typ: ORB.Type): LONGINT;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1162)


<pre>  PROCEDURE FindRefs(VAR R: Files.Rider; ftyp: SET; typ: ORB.Type; off: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1174)


<pre>  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod#L1185)

