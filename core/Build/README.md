## Build
This package provides the compiler and associated program building and debugging tools for Oberon.


### _Package Overview:_
Oberon uses a one-pass compiler with four parts, each depending on the next for functionaltiy:

 * A recursive-descent parser of the Oberon language, ORP
 * A generator of target-specific opcodes (RISC5), ORG
 * A symbol table and frame tracker, ORB
 * A scanner and tokenizer, ORS

In addition, several tools link and examine the binary modules produced by the compiler:

 * A linker and loader, Linker
 * A bootload firmware generator, ORF
 * A tool for examining modules, ORTool

### _Package Use:_

To compile the inner core:
```
ORP.Compile Kernel.Mod/s, Filedir.Mod/s, Files.Mod/s, Modules.Mod/s ~
```
To link the inner core modules into a bootable binary:
```
Linker.Link Modules ~
```
To Install the binary into the boot region of the current disk image:
```
Linker.Load Modules.bin ~
```
To compile an example module:
```
ORP.Compile Sierpinski.Mod ~
```
To examine the symbol file of the compiled example:
```
ORTool.DecSym Sierpinski.smb
```
To Examine the binary of the compiled example:
```
ORTool.DecObj Sierpinski.rsc
```

### _Modules in this package:_

#### [MODULE ORP](https://github.com/io-core/doc/blob/main/core/Build/ORP.md) [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod)

Module ORP reads the source code of an Oberon program and produces a RISC5 executable binary module.


  **imports:** ` Texts Oberon ORS ORB ORG`

**Procedures:**
```
  Compile*

```


#### [MODULE ORG](https://github.com/io-core/doc/blob/main/core/Build/ORG.md) [(source)](https://github.com/io-core/Build/blob/main/ORG.Mod)
Module ORG generates the processor-specific instructions for executing an Oberon program. 

ORG uses SYSTEM, Files, ORS, ORB



  **imports:** ` SYSTEM Files ORS ORB`

**Procedures:**
```
  CheckRegs*

  FixOne*(at: LONGINT)

  FixLink*(L: LONGINT)

  MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)

  MakeRealItem*(VAR x: Item; val: REAL)

  MakeStringItem*(VAR x: Item; len: LONGINT) (*copies string from ORS-buffer to ORG-string array*)

  MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)

  Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)

  Index*(VAR x, y: Item)   (* x := x[y] *)

  DeRef*(VAR x: Item)

  BuildTD*(T: ORB.Type; VAR dc: LONGINT)

  TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)

  Not*(VAR x: Item)   (* x :=  x *)

  And1*(VAR x: Item)   (* x := x & *)

  And2*(VAR x, y: Item)

  Or1*(VAR x: Item)   (* x := x OR *)

  Or2*(VAR x, y: Item)

  Neg*(VAR x: Item)   (* x := -x *)

  AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)

  MulOp*(VAR x, y: Item)   (* x := x * y *)

  DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)

  Singleton*(VAR x: Item)  (* x := {x} *)

  Set*(VAR x, y: Item)   (* x := {x .. y} *)

  In*(VAR x, y: Item)  (* x := x IN y *)

  SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StrToChar*(VAR x: Item)

  Store*(VAR x, y: Item) (* x := y *)

  StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)

  CopyString*(VAR x, y: Item)  (* x := y *) 

  OpenArrayParam*(VAR x: Item)

  VarParam*(VAR x: Item; ftype: ORB.Type)

  ValueParam*(VAR x: Item)

  StringParam*(VAR x: Item)

  For0*(VAR x, y: Item)

  For1*(VAR x, y, z, w: Item; VAR L: LONGINT)

  For2*(VAR x, y, w: Item)

  Here*(): LONGINT

  FJump*(VAR L: LONGINT)

  CFJump*(VAR x: Item)

  BJump*(L: LONGINT)

  CBJump*(VAR x: Item; L: LONGINT)

  Fixup*(VAR x: Item)

  PrepCall*(VAR x: Item; VAR r: LONGINT)

  Call*(VAR x: Item; r: LONGINT)

  Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)

  Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)

  Increment*(upordown: LONGINT; VAR x, y: Item)

  Include*(inorex: LONGINT; VAR x, y: Item)

  Assert*(VAR x: Item)

  New*(VAR x: Item)

  Pack*(VAR x, y: Item)

  Unpk*(VAR x, y: Item)

  Led*(VAR x: Item)

  Get*(VAR x, y: Item)

  Put*(VAR x, y: Item)

  Copy*(VAR x, y, z: Item)

  LDPSR*(VAR x: Item)

  LDREG*(VAR x, y: Item)

  Abs*(VAR x: Item)

  Odd*(VAR x: Item)

  Floor*(VAR x: Item)

  Float*(VAR x: Item)

  Ord*(VAR x: Item)

  Len*(VAR x: Item)

  Shift*(fct: LONGINT; VAR x, y: Item)

  ADC*(VAR x, y: Item)

  SBC*(VAR x, y: Item)

  UML*(VAR x, y: Item)

  Bit*(VAR x, y: Item)

  Register*(VAR x: Item)

  H*(VAR x: Item)

  Adr*(VAR x: Item)

  Condition*(VAR x: Item)

  Open*(v: INTEGER)

  SetDataSize*(dc: LONGINT)

  Header*

  Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

```


#### [MODULE ORB](https://github.com/io-core/doc/blob/main/core/Build/ORB.md) [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod)
Module ORB manages the symbol table for the Oberon compiler and reads and writes 'smb' files



  **imports:** ` Files ORS`

**Procedures:**
```
  NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER)  (*insert new Object with name id*)

  thisObj*(): Object

  thisimport*(mod: Object): Object

  thisfield*(rec: Type): Object

  OpenScope*

  CloseScope*

  MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR)

  Import*(VAR modid, modid1: ORS.Ident)

  Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT)

  Clear*

  Init*(wordsize: INTEGER) 

```


#### [MODULE ORS](https://github.com/io-core/doc/blob/main/core/Build/ORS.md) [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod)
Module ORS does lexical analysis of the Oberon source code and defines symbols and operations


  **imports:** ` SYSTEM Texts Oberon`

**Procedures:**
```
  CopyId*(VAR ident: Ident)

  Pos*(): LONGINT

  Mark*(msg: ARRAY OF CHAR)

  Get*(VAR sym: INTEGER)

  Init*(T: Texts.Text; pos: LONGINT)

```


#### [MODULE OXTool](https://github.com/io-core/doc/blob/main/core/Build/OXTool.md) [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod)
Module OXTool provides symbol file, module file, and loaded module reporting tools.

ORP.Compile Target.Mod/s ~
OXTool.DecSym Target.smb ~ (if a regular module)
OXTool.DecObj Target.rsc ~ (if a regular module)
OXTool.DecBin Target.bin ~ (if a bare metal module)


  **imports:** ` SYSTEM Files Modules Input Texts Viewers MenuViewers TextFrames Oberon OXDis`

**Procedures:**
```
  Clear*  (*used to clear output*)

  Recall*

  DecSym*  (*decode symbol file*)

  DecBin*   (*decode bare metal binary file*)

  DecObj*   (*decode object file*)

```


#### [MODULE OXDis](https://github.com/io-core/doc/blob/main/core/Build/OXDis.md) [(source)](https://github.com/io-core/Build/blob/main/OXDis.Mod)
Module OXDis provides an interface for disassembling opcodes.


  **imports:** ` SYSTEM Files ORDis OIDis OADis OaDis OvDis`

**Procedures:**
```
  decode*():INTEGER

  originate*(r: Files.Rider; f: Files.File; offset, extent, index, arch: INTEGER): INTEGER

```


#### [MODULE ORDis](https://github.com/io-core/doc/blob/main/core/Build/ORDis.md) [(source)](https://github.com/io-core/Build/blob/main/ORDis.Mod)
Module ORDis disassembles RISC5 opcodes.


  **imports:** ` SYSTEM Files Oberon`

**Procedures:**
```
  decode*():INTEGER

  init*(VAR f: Files.File; i, o, e: INTEGER)

  originate*(r: Files.Rider; f: Files.File; offset, extent, index: INTEGER): INTEGER

```


#### [MODULE OIDis](https://github.com/io-core/doc/blob/main/core/Build/OIDis.md) [(source)](https://github.com/io-core/Build/blob/main/OIDis.Mod)
Module OIDis disassembles x86_64 opcodes.


  **imports:** ` SYSTEM Files Oberon`

**Procedures:**
```
  decode*():INTEGER

  init*(VAR f: Files.File; i, o, e: INTEGER)

  originate*(r: Files.Rider; f: Files.File; offset, extent, index: INTEGER): INTEGER

```


#### [MODULE OADis](https://github.com/io-core/doc/blob/main/core/Build/OADis.md) [(source)](https://github.com/io-core/Build/blob/main/OADis.Mod)
Module OADis disassembles aarch64 opcodes.


  **imports:** ` SYSTEM Files Oberon`

**Procedures:**
```
  decode*():INTEGER

  init*(VAR f: Files.File; i, o, e: INTEGER)

  originate*(r: Files.Rider; f: Files.File; offset, extent, index: INTEGER): INTEGER

```


#### [MODULE OaDis](https://github.com/io-core/doc/blob/main/core/Build/OaDis.md) [(source)](https://github.com/io-core/Build/blob/main/OaDis.Mod)
Module OaDis disassembles 32-bit ARM opcodes.


  **imports:** ` SYSTEM Files Oberon`

**Procedures:**
```
  opFormat*(w: LONGINT): LONGINT

  PlaceInt* (x: LONGINT;VAR s: ARRAY OF CHAR; p: INTEGER; VAR c:INTEGER)

  decode*():INTEGER

  init*(VAR f: Files.File; i, o, e: INTEGER)

  originate*(r: Files.Rider; f: Files.File; offset, extent, index: INTEGER): INTEGER

```


#### [MODULE OvDis](https://github.com/io-core/doc/blob/main/core/Build/OvDis.md) [(source)](https://github.com/io-core/Build/blob/main/OvDis.Mod)
Module OvDis disassembles 32-bit RISCV opcodes.


  **imports:** ` SYSTEM Files Oberon`

**Procedures:**
```
  opFormat*(w: LONGINT): LONGINT

  decode*():INTEGER

  init*(VAR f: Files.File; i, o, e: INTEGER)

  originate*(r: Files.Rider; f: Files.File; offset, extent, index: INTEGER): INTEGER

```


#### [MODULE ORC](https://github.com/io-core/doc/blob/main/core/Build/ORC.md) [(source)](https://github.com/io-core/Build/blob/main/ORC.Mod)

  **imports:** ` SYSTEM Files Texts Oberon V24`

**Procedures:**
```
  Flush*

  Open*

  TestReq*

  Load*  (*linked boot file  F.bin*)

  Send*

  Receive*

  Close*

  SR*  (*send, then receive sequence of items*)

```


#### [MODULE OIP](https://github.com/io-core/doc/blob/main/core/Build/OIP.md) [(source)](https://github.com/io-core/Build/blob/main/OIP.Mod)

Module OIP reads the source code of an Oberon program and produces an executable x86_64 binary module.


  **imports:** ` Texts Oberon ORS ORB OIG`

**Procedures:**
```
  Compile*

```


#### [MODULE OIG](https://github.com/io-core/doc/blob/main/core/Build/OIG.md) [(source)](https://github.com/io-core/Build/blob/main/OIG.Mod)
Module OIG generates the x86_64 processor-specific instructions for executing an Oberon program. 


  **imports:** ` SYSTEM Files ORS ORB`

**Procedures:**
```
  CheckRegs*

  FixOne*(at: LONGINT)

  FixLink*(L: LONGINT)

  MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)

  MakeRealItem*(VAR x: Item; val: REAL)

  MakeStringItem*(VAR x: Item; len: LONGINT) (*copies string from ORS-buffer to ORG-string array*)

  MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)

  Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)

  Index*(VAR x, y: Item)   (* x := x[y] *)

  DeRef*(VAR x: Item)

  BuildTD*(T: ORB.Type; VAR dc: LONGINT)

  TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)

  Not*(VAR x: Item)   (* x :=  x *)

  And1*(VAR x: Item)   (* x := x & *)

  And2*(VAR x, y: Item)

  Or1*(VAR x: Item)   (* x := x OR *)

  Or2*(VAR x, y: Item)

  Neg*(VAR x: Item)   (* x := -x *)

  AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)

  MulOp*(VAR x, y: Item)   (* x := x * y *)

  DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)

  Singleton*(VAR x: Item)  (* x := {x} *)

  Set*(VAR x, y: Item)   (* x := {x .. y} *)

  In*(VAR x, y: Item)  (* x := x IN y *)

  SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StrToChar*(VAR x: Item)

  Store*(VAR x, y: Item) (* x := y *)

  StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)

  CopyString*(VAR x, y: Item)  (* x := y *) 

  OpenArrayParam*(VAR x: Item)

  VarParam*(VAR x: Item; ftype: ORB.Type)

  ValueParam*(VAR x: Item)

  StringParam*(VAR x: Item)

  For0*(VAR x, y: Item)

  For1*(VAR x, y, z, w: Item; VAR L: LONGINT)

  For2*(VAR x, y, w: Item)

  Here*(): LONGINT

  FJump*(VAR L: LONGINT)

  CFJump*(VAR x: Item)

  BJump*(L: LONGINT)

  CBJump*(VAR x: Item; L: LONGINT)

  Fixup*(VAR x: Item)

  PrepCall*(VAR x: Item; VAR r: LONGINT)

  Call*(VAR x: Item; r: LONGINT)

  Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)

  Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)

  Increment*(upordown: LONGINT; VAR x, y: Item)

  Include*(inorex: LONGINT; VAR x, y: Item)

  Assert*(VAR x: Item)

  New*(VAR x: Item)

  Pack*(VAR x, y: Item)

  Unpk*(VAR x, y: Item)

  Led*(VAR x: Item)

  Get*(VAR x, y: Item)

  Put*(VAR x, y: Item)

  Copy*(VAR x, y, z: Item)

  LDPSR*(VAR x: Item)

  LDREG*(VAR x, y: Item)

  Abs*(VAR x: Item)

  Odd*(VAR x: Item)

  Floor*(VAR x: Item)

  Float*(VAR x: Item)

  Ord*(VAR x: Item)

  Len*(VAR x: Item)

  Shift*(fct: LONGINT; VAR x, y: Item)

  ADC*(VAR x, y: Item)

  SBC*(VAR x, y: Item)

  UML*(VAR x, y: Item)

  Bit*(VAR x, y: Item)

  Register*(VAR x: Item)

  H*(VAR x: Item)

  Adr*(VAR x: Item)

  Condition*(VAR x: Item)

  Open*(v: INTEGER)

  SetDataSize*(dc: LONGINT)

  Header*

  Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

```


#### [MODULE OAP](https://github.com/io-core/doc/blob/main/core/Build/OAP.md) [(source)](https://github.com/io-core/Build/blob/main/OAP.Mod)

Module OAP reads the source code of an Oberon program and produces an aarch64 executable binary module.


  **imports:** ` Texts Oberon ORS ORB OAG`

**Procedures:**
```
  Compile*

```


#### [MODULE OAG](https://github.com/io-core/doc/blob/main/core/Build/OAG.md) [(source)](https://github.com/io-core/Build/blob/main/OAG.Mod)
Module OAG generates the aarch-64 processor-specific instructions for executing an Oberon program. 


  **imports:** ` SYSTEM Files ORS ORB`

**Procedures:**
```
  CheckRegs*

  FixOne*(at: LONGINT)

  FixLink*(L: LONGINT)

  MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)

  MakeRealItem*(VAR x: Item; val: REAL)

  MakeStringItem*(VAR x: Item; len: LONGINT) (*copies string from ORS-buffer to ORG-string array*)

  MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)

  Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)

  Index*(VAR x, y: Item)   (* x := x[y] *)

  DeRef*(VAR x: Item)

  BuildTD*(T: ORB.Type; VAR dc: LONGINT)

  TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)

  Not*(VAR x: Item)   (* x :=  x *)

  And1*(VAR x: Item)   (* x := x & *)

  And2*(VAR x, y: Item)

  Or1*(VAR x: Item)   (* x := x OR *)

  Or2*(VAR x, y: Item)

  Neg*(VAR x: Item)   (* x := -x *)

  AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)

  MulOp*(VAR x, y: Item)   (* x := x * y *)

  DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)

  Singleton*(VAR x: Item)  (* x := {x} *)

  Set*(VAR x, y: Item)   (* x := {x .. y} *)

  In*(VAR x, y: Item)  (* x := x IN y *)

  SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StrToChar*(VAR x: Item)

  Store*(VAR x, y: Item) (* x := y *)

  StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)

  CopyString*(VAR x, y: Item)  (* x := y *) 

  OpenArrayParam*(VAR x: Item)

  VarParam*(VAR x: Item; ftype: ORB.Type)

  ValueParam*(VAR x: Item)

  StringParam*(VAR x: Item)

  For0*(VAR x, y: Item)

  For1*(VAR x, y, z, w: Item; VAR L: LONGINT)

  For2*(VAR x, y, w: Item)

  Here*(): LONGINT

  FJump*(VAR L: LONGINT)

  CFJump*(VAR x: Item)

  BJump*(L: LONGINT)

  CBJump*(VAR x: Item; L: LONGINT)

  Fixup*(VAR x: Item)

  PrepCall*(VAR x: Item; VAR r: LONGINT)

  Call*(VAR x: Item; r: LONGINT)

  Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)

  Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)

  Increment*(upordown: LONGINT; VAR x, y: Item)

  Include*(inorex: LONGINT; VAR x, y: Item)

  Assert*(VAR x: Item)

  New*(VAR x: Item)

  Pack*(VAR x, y: Item)

  Unpk*(VAR x, y: Item)

  Led*(VAR x: Item)

  Get*(VAR x, y: Item)

  Put*(VAR x, y: Item)

  Copy*(VAR x, y, z: Item)

  LDPSR*(VAR x: Item)

  LDREG*(VAR x, y: Item)

  Abs*(VAR x: Item)

  Odd*(VAR x: Item)

  Floor*(VAR x: Item)

  Float*(VAR x: Item)

  Ord*(VAR x: Item)

  Len*(VAR x: Item)

  Shift*(fct: LONGINT; VAR x, y: Item)

  ADC*(VAR x, y: Item)

  SBC*(VAR x, y: Item)

  UML*(VAR x, y: Item)

  Bit*(VAR x, y: Item)

  Register*(VAR x: Item)

  H*(VAR x: Item)

  Adr*(VAR x: Item)

  Condition*(VAR x: Item)

  Open*(v: INTEGER)

  SetDataSize*(dc: LONGINT)

  Header*

  Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

```


#### [MODULE OaP](https://github.com/io-core/doc/blob/main/core/Build/OaP.md) [(source)](https://github.com/io-core/Build/blob/main/OaP.Mod)

Module OaP reads the source code of an Oberon program and produces a 32-bit ARM executable binary module.


  **imports:** ` Texts Oberon ORS ORB OaG`

**Procedures:**
```
  Compile*

```


#### [MODULE OaG](https://github.com/io-core/doc/blob/main/core/Build/OaG.md) [(source)](https://github.com/io-core/Build/blob/main/OaG.Mod)
Module OaG generates the 32-bit ARM processor-specific instructions for executing an Oberon program. 


  **imports:** ` SYSTEM Files ORS ORB`

**Procedures:**
```
  CheckRegs*

  FixOne*(at: LONGINT)

  FixLink*(L: LONGINT)

  MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)

  MakeRealItem*(VAR x: Item; val: REAL)

  MakeStringItem*(VAR x: Item; len: LONGINT) (*copies string from ORS-buffer to ORG-string array*)

  MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)

  Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)

  Index*(VAR x, y: Item)   (* x := x[y] *)

  DeRef*(VAR x: Item)

  BuildTD*(T: ORB.Type; VAR dc: LONGINT)

  TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)

  Not*(VAR x: Item)   (* x :=  x *)

  And1*(VAR x: Item)   (* x := x & *)

  And2*(VAR x, y: Item)

  Or1*(VAR x: Item)   (* x := x OR *)

  Or2*(VAR x, y: Item)

  Neg*(VAR x: Item)   (* x := -x *)

  AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)

  MulOp*(VAR x, y: Item)   (* x := x * y *)

  DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)

  Singleton*(VAR x: Item)  (* x := {x} *)

  Set*(VAR x, y: Item)   (* x := {x .. y} *)

  In*(VAR x, y: Item)  (* x := x IN y *)

  SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StrToChar*(VAR x: Item)

  Store*(VAR x, y: Item) (* x := y *)

  StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)

  CopyString*(VAR x, y: Item)  (* x := y *) 

  OpenArrayParam*(VAR x: Item)

  VarParam*(VAR x: Item; ftype: ORB.Type)

  ValueParam*(VAR x: Item)

  StringParam*(VAR x: Item)

  For0*(VAR x, y: Item)

  For1*(VAR x, y, z, w: Item; VAR L: LONGINT)

  For2*(VAR x, y, w: Item)

  Here*(): LONGINT

  FJump*(VAR L: LONGINT)

  CFJump*(VAR x: Item)

  BJump*(L: LONGINT)

  CBJump*(VAR x: Item; L: LONGINT)

  Fixup*(VAR x: Item)

  PrepCall*(VAR x: Item; VAR r: LONGINT)

  Call*(VAR x: Item; r: LONGINT)

  Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)

  Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)

  Increment*(upordown: LONGINT; VAR x, y: Item)

  Include*(inorex: LONGINT; VAR x, y: Item)

  Assert*(VAR x: Item)

  New*(VAR x: Item)

  Pack*(VAR x, y: Item)

  Unpk*(VAR x, y: Item)

  Led*(VAR x: Item)

  Get*(VAR x, y: Item)

  Put*(VAR x, y: Item)

  Copy*(VAR x, y, z: Item)

  LDPSR*(VAR x: Item)

  LDREG*(VAR x, y: Item)

  Abs*(VAR x: Item)

  Odd*(VAR x: Item)

  Floor*(VAR x: Item)

  Float*(VAR x: Item)

  Ord*(VAR x: Item)

  Len*(VAR x: Item)

  Shift*(fct: LONGINT; VAR x, y: Item)

  ADC*(VAR x, y: Item)

  SBC*(VAR x, y: Item)

  UML*(VAR x, y: Item)

  Bit*(VAR x, y: Item)

  Register*(VAR x: Item)

  H*(VAR x: Item)

  Adr*(VAR x: Item)

  Condition*(VAR x: Item)

  Open*(v: INTEGER)

  SetDataSize*(dc: LONGINT)

  Header*

  Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

```


#### [MODULE OVP](https://github.com/io-core/doc/blob/main/core/Build/OVP.md) [(source)](https://github.com/io-core/Build/blob/main/OVP.Mod)

Module OVP reads the source code of an Oberon program and produces an 64-bit RISCV executable binary module.


  **imports:** ` Texts Oberon ORS ORB OVG`

**Procedures:**
```
  Compile*

```


#### [MODULE OVG](https://github.com/io-core/doc/blob/main/core/Build/OVG.md) [(source)](https://github.com/io-core/Build/blob/main/OVG.Mod)
Module OVG generates the 64-bit RISCV processor-specific instructions for executing an Oberon program. 


  **imports:** ` SYSTEM Files ORS ORB`

**Procedures:**
```
  CheckRegs*

  FixOne*(at: LONGINT)

  FixLink*(L: LONGINT)

  MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)

  MakeRealItem*(VAR x: Item; val: REAL)

  MakeStringItem*(VAR x: Item; len: LONGINT) (*copies string from ORS-buffer to ORG-string array*)

  MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)

  Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)

  Index*(VAR x, y: Item)   (* x := x[y] *)

  DeRef*(VAR x: Item)

  BuildTD*(T: ORB.Type; VAR dc: LONGINT)

  TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)

  Not*(VAR x: Item)   (* x :=  x *)

  And1*(VAR x: Item)   (* x := x & *)

  And2*(VAR x, y: Item)

  Or1*(VAR x: Item)   (* x := x OR *)

  Or2*(VAR x, y: Item)

  Neg*(VAR x: Item)   (* x := -x *)

  AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)

  MulOp*(VAR x, y: Item)   (* x := x * y *)

  DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)

  Singleton*(VAR x: Item)  (* x := {x} *)

  Set*(VAR x, y: Item)   (* x := {x .. y} *)

  In*(VAR x, y: Item)  (* x := x IN y *)

  SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StrToChar*(VAR x: Item)

  Store*(VAR x, y: Item) (* x := y *)

  StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)

  CopyString*(VAR x, y: Item)  (* x := y *) 

  OpenArrayParam*(VAR x: Item)

  VarParam*(VAR x: Item; ftype: ORB.Type)

  ValueParam*(VAR x: Item)

  StringParam*(VAR x: Item)

  For0*(VAR x, y: Item)

  For1*(VAR x, y, z, w: Item; VAR L: LONGINT)

  For2*(VAR x, y, w: Item)

  Here*(): LONGINT

  FJump*(VAR L: LONGINT)

  CFJump*(VAR x: Item)

  BJump*(L: LONGINT)

  CBJump*(VAR x: Item; L: LONGINT)

  Fixup*(VAR x: Item)

  PrepCall*(VAR x: Item; VAR r: LONGINT)

  Call*(VAR x: Item; r: LONGINT)

  Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)

  Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)

  Increment*(upordown: LONGINT; VAR x, y: Item)

  Include*(inorex: LONGINT; VAR x, y: Item)

  Assert*(VAR x: Item)

  New*(VAR x: Item)

  Pack*(VAR x, y: Item)

  Unpk*(VAR x, y: Item)

  Led*(VAR x: Item)

  Get*(VAR x, y: Item)

  Put*(VAR x, y: Item)

  Copy*(VAR x, y, z: Item)

  LDPSR*(VAR x: Item)

  LDREG*(VAR x, y: Item)

  Abs*(VAR x: Item)

  Odd*(VAR x: Item)

  Floor*(VAR x: Item)

  Float*(VAR x: Item)

  Ord*(VAR x: Item)

  Len*(VAR x: Item)

  Shift*(fct: LONGINT; VAR x, y: Item)

  ADC*(VAR x, y: Item)

  SBC*(VAR x, y: Item)

  UML*(VAR x, y: Item)

  Bit*(VAR x, y: Item)

  Register*(VAR x: Item)

  H*(VAR x: Item)

  Adr*(VAR x: Item)

  Condition*(VAR x: Item)

  Open*(v: INTEGER)

  SetDataSize*(dc: LONGINT)

  Header*

  Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

```


#### [MODULE OvP](https://github.com/io-core/doc/blob/main/core/Build/OvP.md) [(source)](https://github.com/io-core/Build/blob/main/OvP.Mod)

Module OvP reads the source code of an Oberon program and produces a 32-bit RISCV executable binary module.


  **imports:** ` Texts Oberon ORS ORB OvG`

**Procedures:**
```
  Compile*

```


#### [MODULE OvG](https://github.com/io-core/doc/blob/main/core/Build/OvG.md) [(source)](https://github.com/io-core/Build/blob/main/OvG.Mod)
Module OvG generates the 32-bit RISCV processor-specific instructions for executing an Oberon program. 


  **imports:** ` SYSTEM Files ORS ORB`

**Procedures:**
```
  CheckRegs*

  FixOne*(at: LONGINT)

  FixLink*(L: LONGINT)

  MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)

  MakeRealItem*(VAR x: Item; val: REAL)

  MakeStringItem*(VAR x: Item; len: LONGINT) (*copies string from ORS-buffer to ORG-string array*)

  MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)

  Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)

  Index*(VAR x, y: Item)   (* x := x[y] *)

  DeRef*(VAR x: Item)

  BuildTD*(T: ORB.Type; VAR dc: LONGINT)

  TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)

  Not*(VAR x: Item)   (* x :=  x *)

  And1*(VAR x: Item)   (* x := x & *)

  And2*(VAR x, y: Item)

  Or1*(VAR x: Item)   (* x := x OR *)

  Or2*(VAR x, y: Item)

  Neg*(VAR x: Item)   (* x := -x *)

  AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)

  MulOp*(VAR x, y: Item)   (* x := x * y *)

  DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)

  Singleton*(VAR x: Item)  (* x := {x} *)

  Set*(VAR x, y: Item)   (* x := {x .. y} *)

  In*(VAR x, y: Item)  (* x := x IN y *)

  SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StrToChar*(VAR x: Item)

  Store*(VAR x, y: Item) (* x := y *)

  StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)

  CopyString*(VAR x, y: Item)  (* x := y *) 

  OpenArrayParam*(VAR x: Item)

  VarParam*(VAR x: Item; ftype: ORB.Type)

  ValueParam*(VAR x: Item)

  StringParam*(VAR x: Item)

  For0*(VAR x, y: Item)

  For1*(VAR x, y, z, w: Item; VAR L: LONGINT)

  For2*(VAR x, y, w: Item)

  Here*(): LONGINT

  FJump*(VAR L: LONGINT)

  CFJump*(VAR x: Item)

  BJump*(L: LONGINT)

  CBJump*(VAR x: Item; L: LONGINT)

  Fixup*(VAR x: Item)

  PrepCall*(VAR x: Item; VAR r: LONGINT)

  Call*(VAR x: Item; r: LONGINT)

  Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)

  Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)

  Increment*(upordown: LONGINT; VAR x, y: Item)

  Include*(inorex: LONGINT; VAR x, y: Item)

  Assert*(VAR x: Item)

  New*(VAR x: Item)

  Pack*(VAR x, y: Item)

  Unpk*(VAR x, y: Item)

  Led*(VAR x: Item)

  Get*(VAR x, y: Item)

  Put*(VAR x, y: Item)

  Copy*(VAR x, y, z: Item)

  LDPSR*(VAR x: Item)

  LDREG*(VAR x, y: Item)

  Abs*(VAR x: Item)

  Odd*(VAR x: Item)

  Floor*(VAR x: Item)

  Float*(VAR x: Item)

  Ord*(VAR x: Item)

  Len*(VAR x: Item)

  Shift*(fct: LONGINT; VAR x, y: Item)

  ADC*(VAR x, y: Item)

  SBC*(VAR x, y: Item)

  UML*(VAR x, y: Item)

  Bit*(VAR x, y: Item)

  Register*(VAR x: Item)

  H*(VAR x: Item)

  Adr*(VAR x: Item)

  Condition*(VAR x: Item)

  Open*(v: INTEGER)

  SetDataSize*(dc: LONGINT)

  Header*

  Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

```


#### [MODULE ODP](https://github.com/io-core/doc/blob/main/core/Build/ODP.md) [(source)](https://github.com/io-core/Build/blob/main/ODP.Mod)

  **imports:** ` Texts Oberon ORS ORB ODG`

**Procedures:**
```
  Generate*

```


#### [MODULE ODG](https://github.com/io-core/doc/blob/main/core/Build/ODG.md) [(source)](https://github.com/io-core/Build/blob/main/ODG.Mod)

  **imports:** ` SYSTEM Files ORS ORB`

**Procedures:**
```
  CheckRegs*

  FixOne*(at: LONGINT)

  FixLink*(L: LONGINT)

  MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)

  MakeRealItem*(VAR x: Item; val: REAL)

  MakeStringItem*(VAR x: Item; len: LONGINT) (*copies string from ORS-buffer to ORG-string array*)

  MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)

  Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)

  Index*(VAR x, y: Item)   (* x := x[y] *)

  DeRef*(VAR x: Item)

  BuildTD*(T: ORB.Type; VAR dc: LONGINT)

  TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)

  Not*(VAR x: Item)   (* x :=  x *)

  And1*(VAR x: Item)   (* x := x & *)

  And2*(VAR x, y: Item)

  Or1*(VAR x: Item)   (* x := x OR *)

  Or2*(VAR x, y: Item)

  Neg*(VAR x: Item)   (* x := -x *)

  AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)

  MulOp*(VAR x, y: Item)   (* x := x * y *)

  DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)

  Singleton*(VAR x: Item)  (* x := {x} *)

  Set*(VAR x, y: Item)   (* x := {x .. y} *)

  In*(VAR x, y: Item)  (* x := x IN y *)

  SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)

  IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)

  StrToChar*(VAR x: Item)

  Store*(VAR x, y: Item) (* x := y *)

  StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)

  CopyString*(VAR x, y: Item)  (* x := y *) 

  OpenArrayParam*(VAR x: Item)

  VarParam*(VAR x: Item; ftype: ORB.Type)

  ValueParam*(VAR x: Item)

  StringParam*(VAR x: Item)

  For0*(VAR x, y: Item)

  For1*(VAR x, y, z, w: Item; VAR L: LONGINT)

  For2*(VAR x, y, w: Item)

  Here*(): LONGINT

  FJump*(VAR L: LONGINT)

  CFJump*(VAR x: Item)

  BJump*(L: LONGINT)

  CBJump*(VAR x: Item; L: LONGINT)

  Fixup*(VAR x: Item)

  PrepCall*(VAR x: Item; VAR r: LONGINT)

  Call*(VAR x: Item; r: LONGINT)

  Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)

  Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)

  Increment*(upordown: LONGINT; VAR x, y: Item)

  Include*(inorex: LONGINT; VAR x, y: Item)

  Assert*(VAR x: Item)

  New*(VAR x: Item)

  Pack*(VAR x, y: Item)

  Unpk*(VAR x, y: Item)

  Led*(VAR x: Item)

  Get*(VAR x, y: Item)

  Put*(VAR x, y: Item)

  Copy*(VAR x, y, z: Item)

  LDPSR*(VAR x: Item)

  LDREG*(VAR x, y: Item)

  Abs*(VAR x: Item)

  Odd*(VAR x: Item)

  Floor*(VAR x: Item)

  Float*(VAR x: Item)

  Ord*(VAR x: Item)

  Len*(VAR x: Item)

  Shift*(fct: LONGINT; VAR x, y: Item)

  ADC*(VAR x, y: Item)

  SBC*(VAR x, y: Item)

  UML*(VAR x, y: Item)

  Bit*(VAR x, y: Item)

  Register*(VAR x: Item)

  H*(VAR x: Item)

  Adr*(VAR x: Item)

  Condition*(VAR x: Item)

  Open*(v: INTEGER)

  SetDataSize*(dc: LONGINT)

  Header*

  Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

```


#### [MODULE ORLinker](https://github.com/io-core/doc/blob/main/core/Build/ORLinker.md) [(source)](https://github.com/io-core/Build/blob/main/ORLinker.Mod)
Module ORLinker transforms a RISC5 linkable binary module into a standalone binary suitable for installation in the boot area of an Oberon filesystem.

```
ORP.Compile Modules.Mod
ORLinker.Link Modules
ORLinker.Load Modules

ORP.Compile BareMetalR.Mod
ORLinker.Strip BareMetalR
``` 


  **imports:** ` SYSTEM Files Modules Kernel Texts Oberon`

**Procedures:**
```
  LinkOne*(name: ARRAY OF CHAR; VAR newmod: Modules.Module)

  Load*

  Strip*

  Link*

  ThisCommand*(mod: Modules.Module; name: ARRAY OF CHAR): Modules.Command

```


#### [MODULE BareMetalR](https://github.com/io-core/doc/blob/main/core/Build/BareMetalR.md) [(source)](https://github.com/io-core/Build/blob/main/BareMetalR.Mod)
Module BareMetalR exercises features of the compiler in bringing Oberon up from bare metal on RISC5.


**Procedures:**
```
```


#### [MODULE BareMetalI](https://github.com/io-core/doc/blob/main/core/Build/BareMetalI.md) [(source)](https://github.com/io-core/Build/blob/main/BareMetalI.Mod)
Module BareMetalI exercises features of the compiler in bringing Oberon up from bare metal on x86_64.


**Procedures:**
```
```


#### [MODULE BareMetalA](https://github.com/io-core/doc/blob/main/core/Build/BareMetalA.md) [(source)](https://github.com/io-core/Build/blob/main/BareMetalA.Mod)
Module BareMetalA exercises features of the compiler in bringing Oberon up from bare metal on aarch64.


**Procedures:**
```
```


#### [MODULE BareMetala](https://github.com/io-core/doc/blob/main/core/Build/BareMetala.md) [(source)](https://github.com/io-core/Build/blob/main/BareMetala.Mod)
Module BareMetala exercises features of the compiler in bringing Oberon up from bare metal on 32-bit ARM.


**Procedures:**
```
```


#### [MODULE BareMetalV](https://github.com/io-core/doc/blob/main/core/Build/BareMetalV.md) [(source)](https://github.com/io-core/Build/blob/main/BareMetalV.Mod)
Module BareMetalV exercises features of the compiler in bringing Oberon up from bare metal on 64-bit RISCV.


**Procedures:**
```
```


#### [MODULE BareMetalv](https://github.com/io-core/doc/blob/main/core/Build/BareMetalv.md) [(source)](https://github.com/io-core/Build/blob/main/BareMetalv.Mod)
Module BareMetalv exercises features of the compiler in bringing Oberon up from bare metal on 32-bit RISCV.


**Procedures:**
```
```
