
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

## Checking Symbols and Types
**Check** consumes the current token if it matches the expected symbol, otherwise an error is marked.

`  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L90)

**Qualident** generates a reference to a previously defined item if possible otherwise an error is marked.

`  PROCEDURE qualident(VAR obj: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L98)

`CheckBool` marks an error if the item is not a boolean.

`  PROCEDURE CheckBool(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L115)

`CheckInt` marks an error if the item is not an Int.

`  PROCEDURE CheckInt(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L123)

`CheckReal` marks an error if the item is not a Real.

`  PROCEDURE CheckReal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L131)

`CheckSet` marks an error if the item is not a Set.

`  PROCEDURE CheckSet(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L139)

`CheckSetVal` marks an error if the item is not a Set Value.

`  PROCEDURE CheckSetVal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L147)

`CheckConst` marks an error if the value is not a Constant.

`  PROCEDURE CheckConst(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L158)

`CheckReadOnly` marks an error if the value is not read-only.

`  PROCEDURE CheckReadOnly(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L166)

`CheckExport` checks for an export symbol and marks an error if export not at top level.

`  PROCEDURE CheckExport(VAR expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L174)

`IsExtension` determines if type t1 is an extension of t0.

`  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L186)

`CheckReceiver` ensures that an object is compatible with its receiver or marks an error.

`  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L194)

`DisallowedMethods` blocks methods from binding to rec and its base types.

`  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L202)

## Expressions
`TypeTest` marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.

`  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L216)

`selector` generates the array item, procedure, or method dereference on an array or record.

`  PROCEDURE selector(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L242)

`EqualSignatures` verifies that a procedure may be assigned to a procedure variable.

`  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L318)

`CompTypes` verifies assigment compatibility by type.

`  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L348)

`Parameter` consumes a function call parameter and produces function call proloogue code for the parameter.

`  PROCEDURE Parameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L362)

`IParameter` consumes an Interface call parameter and produces Interface call prologue code for the parameter.

`  PROCEDURE IParameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L393)

`ParamList` consumes the function call parameters, resulting in a function call prologue.

`  PROCEDURE ParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L424)

`IParamList` consumes the Interface call parameters, resulting in a Interface call prologue.

`  PROCEDURE IParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L449)

`StandFunc` consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

`  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L476)

`element` produces a reference to an element in a set.

`  PROCEDURE element(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L523)

`set` produces a set from elements.

`  PROCEDURE set(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L535)



`  PROCEDURE factor(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L552)



`  PROCEDURE term(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L587)



`  PROCEDURE SimpleExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L613)



`  PROCEDURE expression0(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L634)

## Statements


`  PROCEDURE StandProc(pno: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L685)



`  PROCEDURE StatSequence;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L735)


`    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L740)



`    PROCEDURE TypeCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L757)



`    PROCEDURE CaseLabel(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L770)



`    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L781)



`    PROCEDURE CaseExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L811)


`    PROCEDURE NumericCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L816)


## Types and Declarations


`  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L942)



`  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L961)



`  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L984)



`  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1033)



`  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1055)



`  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1082)



`  PROCEDURE CheckRecLevel(lev: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1104)



`  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1112)



`  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1145)



`  PROCEDURE Declarations(VAR varsize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1193)



`  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1266)



`  PROCEDURE ProcedureDecl;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1291)



`    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1301)



`  PROCEDURE ImportList;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1370)



`  PROCEDURE Module;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1392)



`  PROCEDURE Option(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1435)



`  PROCEDURE Compile*;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1446)

