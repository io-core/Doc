
## [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)

Procedures:

[67](https://github.com/io-core/Build/blob/main/ORG.Mod#67) `  PROCEDURE incR;`
[72](https://github.com/io-core/Build/blob/main/ORG.Mod#72) `  PROCEDURE Put0(op, a, b, c: LONGINT);`
[77](https://github.com/io-core/Build/blob/main/ORG.Mod#77) `  PROCEDURE Put1(op, a, b, im: LONGINT);`
[83](https://github.com/io-core/Build/blob/main/ORG.Mod#83) `  PROCEDURE Put1a(op, a, b, im: LONGINT);`
[99](https://github.com/io-core/Build/blob/main/ORG.Mod#99) `  PROCEDURE Put1b(r, mno, off, disp: LONGINT);`
[104](https://github.com/io-core/Build/blob/main/ORG.Mod#104) `  PROCEDURE Put2(op, a, b, off: LONGINT);`
[109](https://github.com/io-core/Build/blob/main/ORG.Mod#109) `  PROCEDURE Put3(op, cond, off: LONGINT);`
[114](https://github.com/io-core/Build/blob/main/ORG.Mod#114) `  PROCEDURE Put3a(op, mno, pno, disp: LONGINT);`
[119](https://github.com/io-core/Build/blob/main/ORG.Mod#119) `  PROCEDURE PutPair(base, op, a, b, off, format: LONGINT);`
[131](https://github.com/io-core/Build/blob/main/ORG.Mod#131) `  PROCEDURE CheckRegs*;`
[138](https://github.com/io-core/Build/blob/main/ORG.Mod#138) `  PROCEDURE SetCC(VAR x: Item; n: LONGINT);`
[142](https://github.com/io-core/Build/blob/main/ORG.Mod#142) `  PROCEDURE Trap(cond, num: LONGINT);`
[146](https://github.com/io-core/Build/blob/main/ORG.Mod#146) `  PROCEDURE NilCheck;`
[152](https://github.com/io-core/Build/blob/main/ORG.Mod#152) `  PROCEDURE negated(cond: LONGINT): LONGINT;`
[158](https://github.com/io-core/Build/blob/main/ORG.Mod#158) `  PROCEDURE fix(at, with: LONGINT);`
[163](https://github.com/io-core/Build/blob/main/ORG.Mod#163) `  PROCEDURE fix1(at, with: LONGINT);`
[170](https://github.com/io-core/Build/blob/main/ORG.Mod#170) `  PROCEDURE FixLinkWith(L, x: LONGINT); (*fixup with offset to x*)`
[183](https://github.com/io-core/Build/blob/main/ORG.Mod#183) `  PROCEDURE FixLink*(L: LONGINT); (*fixup with offset to pc*)`
[187](https://github.com/io-core/Build/blob/main/ORG.Mod#187) `  PROCEDURE FixLinkPair(L, adr: LONGINT);`
[198](https://github.com/io-core/Build/blob/main/ORG.Mod#198) `  PROCEDURE merged(L0, L1: LONGINT): LONGINT;`
[210](https://github.com/io-core/Build/blob/main/ORG.Mod#210) `  PROCEDURE load(VAR x: Item);`
[239](https://github.com/io-core/Build/blob/main/ORG.Mod#239) `  PROCEDURE loadAdr(VAR x: Item);`
[254](https://github.com/io-core/Build/blob/main/ORG.Mod#254) `  PROCEDURE loadCond(VAR x: Item);`
[269](https://github.com/io-core/Build/blob/main/ORG.Mod#269) `  PROCEDURE loadTypTagAdr(T: ORB.Type);`
[277](https://github.com/io-core/Build/blob/main/ORG.Mod#277) `  PROCEDURE loadStringAdr(VAR x: Item);`
[285](https://github.com/io-core/Build/blob/main/ORG.Mod#285) `  PROCEDURE MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT);`
[289](https://github.com/io-core/Build/blob/main/ORG.Mod#289) `  PROCEDURE MakeRealItem*(VAR x: Item; val: REAL);`
[293](https://github.com/io-core/Build/blob/main/ORG.Mod#293) `  PROCEDURE MakeStringItem*(VAR x: Item; len: LONGINT);  (*copies string from ORS-buffer to ORG-string array*)`
[303](https://github.com/io-core/Build/blob/main/ORG.Mod#303) `  PROCEDURE MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT);`
[314](https://github.com/io-core/Build/blob/main/ORG.Mod#314) `  PROCEDURE Field*(VAR x: Item; y: ORB.Object);   (* x := x.y *)`
[325](https://github.com/io-core/Build/blob/main/ORG.Mod#325) `  PROCEDURE Index*(VAR x, y: Item);   (* x := x[y] *)`
[360](https://github.com/io-core/Build/blob/main/ORG.Mod#360) `  PROCEDURE DeRef*(VAR x: Item);`
[374](https://github.com/io-core/Build/blob/main/ORG.Mod#374) `  PROCEDURE Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN);`
[382](https://github.com/io-core/Build/blob/main/ORG.Mod#382) `  PROCEDURE Q(T: ORB.Type; VAR tdw: LONGINT);`
[390](https://github.com/io-core/Build/blob/main/ORG.Mod#390) `  PROCEDURE FindRefFlds(ftyp: SET; typ: ORB.Type; off: LONGINT; VAR tdw: LONGINT);`
[401](https://github.com/io-core/Build/blob/main/ORG.Mod#401) `  PROCEDURE BuildTD(T: ORB.Type; VAR tdw: LONGINT);`
[435](https://github.com/io-core/Build/blob/main/ORG.Mod#435) `  PROCEDURE TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN);`
[461](https://github.com/io-core/Build/blob/main/ORG.Mod#461) `  PROCEDURE Not*(VAR x: Item);   (* x := ~x *)`
[466](https://github.com/io-core/Build/blob/main/ORG.Mod#466) `  PROCEDURE And1*(VAR x: Item);   (* x := x & *)`
[470](https://github.com/io-core/Build/blob/main/ORG.Mod#470) `  PROCEDURE And2*(VAR x, y: Item);`
[474](https://github.com/io-core/Build/blob/main/ORG.Mod#474) `  PROCEDURE Or1*(VAR x: Item);   (* x := x OR *)`
[478](https://github.com/io-core/Build/blob/main/ORG.Mod#478) `  PROCEDURE Or2*(VAR x, y: Item);`
[484](https://github.com/io-core/Build/blob/main/ORG.Mod#484) `  PROCEDURE Neg*(VAR x: Item);   (* x := -x *)`
[501](https://github.com/io-core/Build/blob/main/ORG.Mod#501) `  PROCEDURE AddOp*(op: LONGINT; VAR x, y: Item);   (* x := x +- y *)`
[518](https://github.com/io-core/Build/blob/main/ORG.Mod#518) `  PROCEDURE log2(m: LONGINT; VAR e: LONGINT): LONGINT;`
[524](https://github.com/io-core/Build/blob/main/ORG.Mod#524) `  PROCEDURE MulOp*(VAR x, y: Item);   (* x := x * y *)`
[536](https://github.com/io-core/Build/blob/main/ORG.Mod#536) `  PROCEDURE DivOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)`
[565](https://github.com/io-core/Build/blob/main/ORG.Mod#565) `  PROCEDURE RealOp*(op: INTEGER; VAR x, y: Item);   (* x := x op y *)`
[577](https://github.com/io-core/Build/blob/main/ORG.Mod#577) `  PROCEDURE Singleton*(VAR x: Item);  (* x := {x} *)`
[584](https://github.com/io-core/Build/blob/main/ORG.Mod#584) `  PROCEDURE Set*(VAR x, y: Item);   (* x := {x .. y} *)`
[604](https://github.com/io-core/Build/blob/main/ORG.Mod#604) `  PROCEDURE In*(VAR x, y: Item);  (* x := x IN y *)`
[612](https://github.com/io-core/Build/blob/main/ORG.Mod#612) `  PROCEDURE SetOp*(op: LONGINT; VAR x, y: Item);   (* x := x op y *)`
[642](https://github.com/io-core/Build/blob/main/ORG.Mod#642) `  PROCEDURE IntRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)`
[655](https://github.com/io-core/Build/blob/main/ORG.Mod#655) `  PROCEDURE RealRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)`
[663](https://github.com/io-core/Build/blob/main/ORG.Mod#663) `  PROCEDURE StringRelation*(op: INTEGER; VAR x, y: Item);   (* x := x < y *)`
[677](https://github.com/io-core/Build/blob/main/ORG.Mod#677) `  PROCEDURE StrToChar*(VAR x: Item);`
[681](https://github.com/io-core/Build/blob/main/ORG.Mod#681) `  PROCEDURE Store*(VAR x, y: Item); (* x := y *)`
[694](https://github.com/io-core/Build/blob/main/ORG.Mod#694) `  PROCEDURE StoreStruct*(VAR x, y: Item); (* x := y, frame = 0 *)`
[723](https://github.com/io-core/Build/blob/main/ORG.Mod#723) `  PROCEDURE StoreToInterface*(VAR x, y: Item); (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)`
[736](https://github.com/io-core/Build/blob/main/ORG.Mod#736) `  PROCEDURE CopyString*(VAR x, y: Item);  (* x := y, frame = 0 *) `
[753](https://github.com/io-core/Build/blob/main/ORG.Mod#753) `  PROCEDURE OpenArrayParam*(VAR x: Item);`
[762](https://github.com/io-core/Build/blob/main/ORG.Mod#762) `  PROCEDURE VarParam*(VAR x: Item; ftype: ORB.Type);`
[776](https://github.com/io-core/Build/blob/main/ORG.Mod#776) `  PROCEDURE ValueParam*(VAR x: Item);`
[780](https://github.com/io-core/Build/blob/main/ORG.Mod#780) `  PROCEDURE StringParam*(VAR x: Item);`
[784](https://github.com/io-core/Build/blob/main/ORG.Mod#784) `  PROCEDURE ReceiverParam*(VAR x: Item; par: ORB.Object);`
[793](https://github.com/io-core/Build/blob/main/ORG.Mod#793) `  PROCEDURE For0*(VAR x, y: Item);`
[797](https://github.com/io-core/Build/blob/main/ORG.Mod#797) `  PROCEDURE For1*(VAR x, y, z, w: Item; VAR L: LONGINT);`
[810](https://github.com/io-core/Build/blob/main/ORG.Mod#810) `  PROCEDURE For2*(VAR x, y, w: Item);`
[816](https://github.com/io-core/Build/blob/main/ORG.Mod#816) `  PROCEDURE Here*(): LONGINT;`
[820](https://github.com/io-core/Build/blob/main/ORG.Mod#820) `  PROCEDURE FJump*(VAR L: LONGINT);`
[824](https://github.com/io-core/Build/blob/main/ORG.Mod#824) `  PROCEDURE CFJump*(VAR x: Item);`
[828](https://github.com/io-core/Build/blob/main/ORG.Mod#828) `  PROCEDURE BJump*(L: LONGINT);`
[832](https://github.com/io-core/Build/blob/main/ORG.Mod#832) `  PROCEDURE CBJump*(VAR x: Item; L: LONGINT);`
[836](https://github.com/io-core/Build/blob/main/ORG.Mod#836) `  PROCEDURE Fixup*(VAR x: Item);`
[840](https://github.com/io-core/Build/blob/main/ORG.Mod#840) `  PROCEDURE SaveRegs(r: LONGINT);  (* R[0 .. r-1]*)`
[847](https://github.com/io-core/Build/blob/main/ORG.Mod#847) `  PROCEDURE RestoreRegs(r: LONGINT); (*R[0 .. r-1]*)`
[854](https://github.com/io-core/Build/blob/main/ORG.Mod#854) `  PROCEDURE PrepCall*(VAR x: Item; VAR r: LONGINT);`
[861](https://github.com/io-core/Build/blob/main/ORG.Mod#861) `  PROCEDURE Call*(VAR x: Item; r: LONGINT);`
[891](https://github.com/io-core/Build/blob/main/ORG.Mod#891) `  PROCEDURE Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN);`
[905](https://github.com/io-core/Build/blob/main/ORG.Mod#905) `  PROCEDURE Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN);`
[919](https://github.com/io-core/Build/blob/main/ORG.Mod#919) `  PROCEDURE CaseHead*(VAR x: Item; VAR L0: LONGINT);`
[929](https://github.com/io-core/Build/blob/main/ORG.Mod#929) `  PROCEDURE CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange);  (*L1 = label for else*)`
[945](https://github.com/io-core/Build/blob/main/ORG.Mod#945) `  PROCEDURE Increment*(upordown: LONGINT; VAR x, y: Item);`
[961](https://github.com/io-core/Build/blob/main/ORG.Mod#961) `  PROCEDURE Include*(inorex: LONGINT; VAR x, y: Item);`
[971](https://github.com/io-core/Build/blob/main/ORG.Mod#971) `  PROCEDURE Assert*(VAR x: Item);`
[980](https://github.com/io-core/Build/blob/main/ORG.Mod#980) `  PROCEDURE New*(VAR x, y: Item);`
[1001](https://github.com/io-core/Build/blob/main/ORG.Mod#1001) `  PROCEDURE Pack*(VAR x, y: Item);`
[1007](https://github.com/io-core/Build/blob/main/ORG.Mod#1007) `  PROCEDURE Unpk*(VAR x, y: Item);`
[1014](https://github.com/io-core/Build/blob/main/ORG.Mod#1014) `  PROCEDURE Led*(VAR x: Item);`
[1018](https://github.com/io-core/Build/blob/main/ORG.Mod#1018) `  PROCEDURE Get*(VAR x, y: Item);`
[1022](https://github.com/io-core/Build/blob/main/ORG.Mod#1022) `  PROCEDURE Put*(VAR x, y: Item);`
[1026](https://github.com/io-core/Build/blob/main/ORG.Mod#1026) `  PROCEDURE Copy*(VAR x, y, z: Item);`
[1039](https://github.com/io-core/Build/blob/main/ORG.Mod#1039) `  PROCEDURE LDPSR*(VAR x: Item);`
[1043](https://github.com/io-core/Build/blob/main/ORG.Mod#1043) `  PROCEDURE LDREG*(VAR x, y: Item);`
[1052](https://github.com/io-core/Build/blob/main/ORG.Mod#1052) `  PROCEDURE Abs*(VAR x: Item);`
[1062](https://github.com/io-core/Build/blob/main/ORG.Mod#1062) `  PROCEDURE Odd*(VAR x: Item);`
[1066](https://github.com/io-core/Build/blob/main/ORG.Mod#1066) `  PROCEDURE Floor*(VAR x: Item);`
[1070](https://github.com/io-core/Build/blob/main/ORG.Mod#1070) `  PROCEDURE Float*(VAR x: Item);`
[1074](https://github.com/io-core/Build/blob/main/ORG.Mod#1074) `  PROCEDURE Ord*(VAR x: Item);`
[1081](https://github.com/io-core/Build/blob/main/ORG.Mod#1081) `  PROCEDURE Len*(VAR x: Item);`
[1092](https://github.com/io-core/Build/blob/main/ORG.Mod#1092) `  PROCEDURE Shift*(fct: LONGINT; VAR x, y: Item);`
[1101](https://github.com/io-core/Build/blob/main/ORG.Mod#1101) `  PROCEDURE ADC*(VAR x, y: Item);`
[1105](https://github.com/io-core/Build/blob/main/ORG.Mod#1105) `  PROCEDURE SBC*(VAR x, y: Item);`
[1109](https://github.com/io-core/Build/blob/main/ORG.Mod#1109) `  PROCEDURE UML*(VAR x, y: Item);`
[1113](https://github.com/io-core/Build/blob/main/ORG.Mod#1113) `  PROCEDURE Bit*(VAR x, y: Item);`
[1121](https://github.com/io-core/Build/blob/main/ORG.Mod#1121) `  PROCEDURE Register*(VAR x: Item);`
[1126](https://github.com/io-core/Build/blob/main/ORG.Mod#1126) `  PROCEDURE H*(VAR x: Item);`
[1131](https://github.com/io-core/Build/blob/main/ORG.Mod#1131) `  PROCEDURE Adr*(VAR x: Item);`
[1140](https://github.com/io-core/Build/blob/main/ORG.Mod#1140) `  PROCEDURE Condition*(VAR x: Item);`
[1144](https://github.com/io-core/Build/blob/main/ORG.Mod#1144) `  PROCEDURE Open*(v: INTEGER);`
[1151](https://github.com/io-core/Build/blob/main/ORG.Mod#1151) `  PROCEDURE SetDataSize*(dc: LONGINT);`
[1155](https://github.com/io-core/Build/blob/main/ORG.Mod#1155) `  PROCEDURE Header*;`
[1162](https://github.com/io-core/Build/blob/main/ORG.Mod#1162) `  PROCEDURE NofRefs(ftyp: SET; typ: ORB.Type): LONGINT;`
[1174](https://github.com/io-core/Build/blob/main/ORG.Mod#1174) `  PROCEDURE FindRefs(VAR R: Files.Rider; ftyp: SET; typ: ORB.Type; off: LONGINT);`
[1185](https://github.com/io-core/Build/blob/main/ORG.Mod#1185) `  PROCEDURE Close*(VAR modid: ORS.Ident; key, nofent: LONGINT);`
