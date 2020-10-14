
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

## Checking Symbols and Types
`Check` consumes the current token if it matches the expected symbol, otherwise an error is marked.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L90) `  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);`
`Qualident` generates a reference to a previously defined item if possible otherwise an error is marked.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L98) `  PROCEDURE qualident(VAR obj: ORB.Object);`
`CheckBool` marks an error if the item is not a boolean.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L115) `  PROCEDURE CheckBool(VAR x: ORG.Item);`
`CheckInt` marks an error if the item is not an Int.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L123) `  PROCEDURE CheckInt(VAR x: ORG.Item);`
`CheckReal` marks an error if the item is not a Real.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L131) `  PROCEDURE CheckReal(VAR x: ORG.Item);`
`CheckSet` marks an error if the item is not a Set.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L139) `  PROCEDURE CheckSet(VAR x: ORG.Item);`
`CheckSetVal` marks an error if the item is not a Set Value.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L147) `  PROCEDURE CheckSetVal(VAR x: ORG.Item);`
`CheckConst` marks an error if the value is not a Constant.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L158) `  PROCEDURE CheckConst(VAR x: ORG.Item);`
`CheckReadOnly` marks an error if the value is not read-only.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L166) `  PROCEDURE CheckReadOnly(VAR x: ORG.Item);`
`CheckExport` checks for an export symbol and marks an error if export not at top level.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L174) `  PROCEDURE CheckExport(VAR expo: BOOLEAN);`
`IsExtension` determines if type t1 is an extension of t0.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L186) `  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;`
`CheckReceiver` ensures that an object is compatible with its receiver or marks an error.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L194) `  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);`
`DisallowedMethods` blocks methods from binding to rec and its base types.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L202) `  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)`
## Expressions
`TypeTest` marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L216) `  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);`
`selector` generates the array item, procedure, or method dereference on an array or record.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L242) `  PROCEDURE selector(VAR x: ORG.Item);`
`EqualSignatures` verifies that a procedure may be assigned to a procedure variable.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L318) `  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;`
`CompTypes` verifies assigment compatibility by type.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L348) `  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;`
`Parameter` consumes a function call parameter and produces function call proloogue code for the parameter.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L362) `  PROCEDURE Parameter(par: ORB.Object);`
`IParameter` consumes an Interface call parameter and produces Interface call prologue code for the parameter.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L393) `  PROCEDURE IParameter(par: ORB.Object);`
`ParamList` consumes the function call parameters, resulting in a function call prologue.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L424) `  PROCEDURE ParamList(VAR x: ORG.Item);`
`IParamList` consumes the Interface call parameters, resulting in a Interface call prologue.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L449) `  PROCEDURE IParamList(VAR x: ORG.Item);`
`StandFunc` consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L476) `  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);`
`element` produces a reference to an element in a set.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L523) `  PROCEDURE element(VAR x: ORG.Item);`
`set` produces a set from elements.
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L535) `  PROCEDURE set(VAR x: ORG.Item);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L552) `  PROCEDURE factor(VAR x: ORG.Item);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L587) `  PROCEDURE term(VAR x: ORG.Item);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L613) `  PROCEDURE SimpleExpression(VAR x: ORG.Item);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L634) `  PROCEDURE expression0(VAR x: ORG.Item);`
## Statements

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L685) `  PROCEDURE StandProc(pno: LONGINT);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L735) `  PROCEDURE StatSequence;`
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L740) `    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L757) `    PROCEDURE TypeCasePart;`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L770) `    PROCEDURE CaseLabel(VAR x: ORG.Item);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L781) `    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L811) `    PROCEDURE CaseExpression(VAR x: ORG.Item);`
[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L816) `    PROCEDURE NumericCasePart;`

## Types and Declarations

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L942) `  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L961) `  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L984) `  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1033) `  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1055) `  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1082) `  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1104) `  PROCEDURE CheckRecLevel(lev: INTEGER);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1112) `  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1145) `  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1193) `  PROCEDURE Declarations(VAR varsize: LONGINT);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1266) `  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1291) `  PROCEDURE ProcedureDecl;`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1301) `    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1370) `  PROCEDURE ImportList;`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1392) `  PROCEDURE Module;`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1435) `  PROCEDURE Option(VAR S: Texts.Scanner);`

[(src)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1446) `  PROCEDURE Compile*;`
