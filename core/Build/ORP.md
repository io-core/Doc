
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

## Checking Symbols and Types
`Check` consumes the current token if it matches the expected symbol, otherwise an error is marked.

<code>  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L90)

`Qualident` generates a reference to a previously defined item if possible otherwise an error is marked.

<code>  PROCEDURE qualident(VAR obj: ORB.Object);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L98)

`CheckBool` marks an error if the item is not a boolean.

<code>  PROCEDURE CheckBool(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L115)

`CheckInt` marks an error if the item is not an Int.

<code>  PROCEDURE CheckInt(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L123)

`CheckReal` marks an error if the item is not a Real.

<code>  PROCEDURE CheckReal(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L131)

`CheckSet` marks an error if the item is not a Set.

<code>  PROCEDURE CheckSet(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L139)

`CheckSetVal` marks an error if the item is not a Set Value.

<code>  PROCEDURE CheckSetVal(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L147)

`CheckConst` marks an error if the value is not a Constant.

<code>  PROCEDURE CheckConst(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L158)

`CheckReadOnly` marks an error if the value is not read-only.

<code>  PROCEDURE CheckReadOnly(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L166)

`CheckExport` checks for an export symbol and marks an error if export not at top level.

<code>  PROCEDURE CheckExport(VAR expo: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L174)

`IsExtension` determines if type t1 is an extension of t0.

<code>  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L186)

`CheckReceiver` ensures that an object is compatible with its receiver or marks an error.

<code>  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L194)

`DisallowedMethods` blocks methods from binding to rec and its base types.

<code>  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L202)

## Expressions
`TypeTest` marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.

<code>  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L216)

`selector` generates the array item, procedure, or method dereference on an array or record.

<code>  PROCEDURE selector(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L242)

`EqualSignatures` verifies that a procedure may be assigned to a procedure variable.

<code>  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L318)

`CompTypes` verifies assigment compatibility by type.

<code>  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L348)

`Parameter` consumes a function call parameter and produces function call proloogue code for the parameter.

<code>  PROCEDURE Parameter(par: ORB.Object);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L362)

`IParameter` consumes an Interface call parameter and produces Interface call prologue code for the parameter.

<code>  PROCEDURE IParameter(par: ORB.Object);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L393)

`ParamList` consumes the function call parameters, resulting in a function call prologue.

<code>  PROCEDURE ParamList(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L424)

`IParamList` consumes the Interface call parameters, resulting in a Interface call prologue.

<code>  PROCEDURE IParamList(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L449)

`StandFunc` consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

<code>  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L476)

`element` produces a reference to an element in a set.

<code>  PROCEDURE element(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L523)

`set` produces a set from elements.

<code>  PROCEDURE set(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L535)



<code>  PROCEDURE factor(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L552)



<code>  PROCEDURE term(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L587)



<code>  PROCEDURE SimpleExpression(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L613)



<code>  PROCEDURE expression0(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L634)

## Statements


<code>  PROCEDURE StandProc(pno: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L685)



<code>  PROCEDURE StatSequence;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L735)


<code>    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L740)



<code>    PROCEDURE TypeCasePart;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L757)



<code>    PROCEDURE CaseLabel(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L770)



<code>    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L781)



<code>    PROCEDURE CaseExpression(VAR x: ORG.Item);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L811)


<code>    PROCEDURE NumericCasePart;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L816)


## Types and Declarations


<code>  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L942)



<code>  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L961)



<code>  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L984)



<code>  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1033)



<code>  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1055)



<code>  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1082)



<code>  PROCEDURE CheckRecLevel(lev: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1104)



<code>  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1112)



<code>  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1145)



<code>  PROCEDURE Declarations(VAR varsize: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1193)



<code>  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1266)



<code>  PROCEDURE ProcedureDecl;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1291)



<code>    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1301)



<code>  PROCEDURE ImportList;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1370)



<code>  PROCEDURE Module;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1392)



<code>  PROCEDURE Option(VAR S: Texts.Scanner);</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1435)



<code>  PROCEDURE Compile*;</code> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1446)

