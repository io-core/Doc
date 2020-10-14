
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

## Checking Symbols and Types
`Check` consumes the current token if it matches the expected symbol, otherwise an error is marked.
[90](https://github.com/io-core/Build/blob/main/ORP.Mod#90) `  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);`
`Qualident` generates a reference to a previously defined item if possible otherwise an error is marked.
[98](https://github.com/io-core/Build/blob/main/ORP.Mod#98) `  PROCEDURE qualident(VAR obj: ORB.Object);`
`CheckBool` marks an error if the item is not a boolean.
[115](https://github.com/io-core/Build/blob/main/ORP.Mod#115) `  PROCEDURE CheckBool(VAR x: ORG.Item);`
`CheckInt` marks an error if the item is not an Int.
[123](https://github.com/io-core/Build/blob/main/ORP.Mod#123) `  PROCEDURE CheckInt(VAR x: ORG.Item);`
`CheckReal` marks an error if the item is not a Real.
[131](https://github.com/io-core/Build/blob/main/ORP.Mod#131) `  PROCEDURE CheckReal(VAR x: ORG.Item);`
`CheckSet` marks an error if the item is not a Set.
[139](https://github.com/io-core/Build/blob/main/ORP.Mod#139) `  PROCEDURE CheckSet(VAR x: ORG.Item);`
`CheckSetVal` marks an error if the item is not a Set Value.
[147](https://github.com/io-core/Build/blob/main/ORP.Mod#147) `  PROCEDURE CheckSetVal(VAR x: ORG.Item);`
`CheckConst` marks an error if the value is not a Constant.
[158](https://github.com/io-core/Build/blob/main/ORP.Mod#158) `  PROCEDURE CheckConst(VAR x: ORG.Item);`
`CheckReadOnly` marks an error if the value is not read-only.
[166](https://github.com/io-core/Build/blob/main/ORP.Mod#166) `  PROCEDURE CheckReadOnly(VAR x: ORG.Item);`
`CheckExport` checks for an export symbol and marks an error if export not at top level.
[174](https://github.com/io-core/Build/blob/main/ORP.Mod#174) `  PROCEDURE CheckExport(VAR expo: BOOLEAN);`
`IsExtension` determines if type t1 is an extension of t0.
[186](https://github.com/io-core/Build/blob/main/ORP.Mod#186) `  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;`
`CheckReceiver` ensures that an object is compatible with its receiver or marks an error.
[194](https://github.com/io-core/Build/blob/main/ORP.Mod#194) `  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);`
`DisallowedMethods` blocks methods from binding to rec and its base types.
[202](https://github.com/io-core/Build/blob/main/ORP.Mod#202) `  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)`
## Expressions
`TypeTest` marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.
[216](https://github.com/io-core/Build/blob/main/ORP.Mod#216) `  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);`
`selector` generates the array item, procedure, or method dereference on an array or record.
[242](https://github.com/io-core/Build/blob/main/ORP.Mod#242) `  PROCEDURE selector(VAR x: ORG.Item);`
`EqualSignatures` verifies that a procedure may be assigned to a procedure variable.
[318](https://github.com/io-core/Build/blob/main/ORP.Mod#318) `  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;`
`CompTypes` verifies assigment compatibility by type.
[348](https://github.com/io-core/Build/blob/main/ORP.Mod#348) `  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;`
`Parameter` consumes a function call parameter and produces function call proloogue code for the parameter.
[362](https://github.com/io-core/Build/blob/main/ORP.Mod#362) `  PROCEDURE Parameter(par: ORB.Object);`
`IParameter` consumes an Interface call parameter and produces Interface call prologue code for the parameter.
[393](https://github.com/io-core/Build/blob/main/ORP.Mod#393) `  PROCEDURE IParameter(par: ORB.Object);`
`ParamList` consumes the function call parameters, resulting in a function call prologue.
[424](https://github.com/io-core/Build/blob/main/ORP.Mod#424) `  PROCEDURE ParamList(VAR x: ORG.Item);`
`IParamList` consumes the Interface call parameters, resulting in a Interface call prologue.
[449](https://github.com/io-core/Build/blob/main/ORP.Mod#449) `  PROCEDURE IParamList(VAR x: ORG.Item);`
`StandFunc` consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`
[476](https://github.com/io-core/Build/blob/main/ORP.Mod#476) `  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);`
`element` produces a reference to an element in a set.
[523](https://github.com/io-core/Build/blob/main/ORP.Mod#523) `  PROCEDURE element(VAR x: ORG.Item);`
`set` produces a set from elements.
[535](https://github.com/io-core/Build/blob/main/ORP.Mod#535) `  PROCEDURE set(VAR x: ORG.Item);`

[552](https://github.com/io-core/Build/blob/main/ORP.Mod#552) `  PROCEDURE factor(VAR x: ORG.Item);`

[587](https://github.com/io-core/Build/blob/main/ORP.Mod#587) `  PROCEDURE term(VAR x: ORG.Item);`

[613](https://github.com/io-core/Build/blob/main/ORP.Mod#613) `  PROCEDURE SimpleExpression(VAR x: ORG.Item);`

[634](https://github.com/io-core/Build/blob/main/ORP.Mod#634) `  PROCEDURE expression0(VAR x: ORG.Item);`
## Statements

[685](https://github.com/io-core/Build/blob/main/ORP.Mod#685) `  PROCEDURE StandProc(pno: LONGINT);`

[735](https://github.com/io-core/Build/blob/main/ORP.Mod#735) `  PROCEDURE StatSequence;`
[740](https://github.com/io-core/Build/blob/main/ORP.Mod#740) `    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);`

[757](https://github.com/io-core/Build/blob/main/ORP.Mod#757) `    PROCEDURE TypeCasePart;`

[770](https://github.com/io-core/Build/blob/main/ORP.Mod#770) `    PROCEDURE CaseLabel(VAR x: ORG.Item);`

[781](https://github.com/io-core/Build/blob/main/ORP.Mod#781) `    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);`

[811](https://github.com/io-core/Build/blob/main/ORP.Mod#811) `    PROCEDURE CaseExpression(VAR x: ORG.Item);`
[816](https://github.com/io-core/Build/blob/main/ORP.Mod#816) `    PROCEDURE NumericCasePart;`

## Types and Declarations

[942](https://github.com/io-core/Build/blob/main/ORP.Mod#942) `  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);`

[961](https://github.com/io-core/Build/blob/main/ORP.Mod#961) `  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);`

[984](https://github.com/io-core/Build/blob/main/ORP.Mod#984) `  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);`

[1033](https://github.com/io-core/Build/blob/main/ORP.Mod#1033) `  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);`

[1055](https://github.com/io-core/Build/blob/main/ORP.Mod#1055) `  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);`

[1082](https://github.com/io-core/Build/blob/main/ORP.Mod#1082) `  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);`

[1104](https://github.com/io-core/Build/blob/main/ORP.Mod#1104) `  PROCEDURE CheckRecLevel(lev: INTEGER);`

[1112](https://github.com/io-core/Build/blob/main/ORP.Mod#1112) `  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);`

[1145](https://github.com/io-core/Build/blob/main/ORP.Mod#1145) `  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);`

[1193](https://github.com/io-core/Build/blob/main/ORP.Mod#1193) `  PROCEDURE Declarations(VAR varsize: LONGINT);`

[1266](https://github.com/io-core/Build/blob/main/ORP.Mod#1266) `  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);`

[1291](https://github.com/io-core/Build/blob/main/ORP.Mod#1291) `  PROCEDURE ProcedureDecl;`

[1301](https://github.com/io-core/Build/blob/main/ORP.Mod#1301) `    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);`

[1370](https://github.com/io-core/Build/blob/main/ORP.Mod#1370) `  PROCEDURE ImportList;`

[1392](https://github.com/io-core/Build/blob/main/ORP.Mod#1392) `  PROCEDURE Module;`

[1435](https://github.com/io-core/Build/blob/main/ORP.Mod#1435) `  PROCEDURE Option(VAR S: Texts.Scanner);`

[1446](https://github.com/io-core/Build/blob/main/ORP.Mod#1446) `  PROCEDURE Compile*;`
