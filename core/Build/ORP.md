
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

## Checking Symbols and Types
`Check` consumes the current token if it matches the expected symbol, otherwise an error is marked.

<pre>  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L90)

`Qualident` generates a reference to a previously defined item if possible otherwise an error is marked.

<pre>  PROCEDURE qualident(VAR obj: ORB.Object);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L98)

`CheckBool` marks an error if the item is not a boolean.

<pre>  PROCEDURE CheckBool(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L115)

`CheckInt` marks an error if the item is not an Int.

<pre>  PROCEDURE CheckInt(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L123)

`CheckReal` marks an error if the item is not a Real.

<pre>  PROCEDURE CheckReal(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L131)

`CheckSet` marks an error if the item is not a Set.

<pre>  PROCEDURE CheckSet(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L139)

`CheckSetVal` marks an error if the item is not a Set Value.

<pre>  PROCEDURE CheckSetVal(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L147)

`CheckConst` marks an error if the value is not a Constant.

<pre>  PROCEDURE CheckConst(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L158)

`CheckReadOnly` marks an error if the value is not read-only.

<pre>  PROCEDURE CheckReadOnly(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L166)

`CheckExport` checks for an export symbol and marks an error if export not at top level.

<pre>  PROCEDURE CheckExport(VAR expo: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L174)

`IsExtension` determines if type t1 is an extension of t0.

<pre>  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L186)

`CheckReceiver` ensures that an object is compatible with its receiver or marks an error.

<pre>  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L194)

`DisallowedMethods` blocks methods from binding to rec and its base types.

<pre>  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L202)

## Expressions
`TypeTest` marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.

<pre>  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L216)

`selector` generates the array item, procedure, or method dereference on an array or record.

<pre>  PROCEDURE selector(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L242)

`EqualSignatures` verifies that a procedure may be assigned to a procedure variable.

<pre>  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L318)

`CompTypes` verifies assigment compatibility by type.

<pre>  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L348)

`Parameter` consumes a function call parameter and produces function call proloogue code for the parameter.

<pre>  PROCEDURE Parameter(par: ORB.Object);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L362)

`IParameter` consumes an Interface call parameter and produces Interface call prologue code for the parameter.

<pre>  PROCEDURE IParameter(par: ORB.Object);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L393)

`ParamList` consumes the function call parameters, resulting in a function call prologue.

<pre>  PROCEDURE ParamList(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L424)

`IParamList` consumes the Interface call parameters, resulting in a Interface call prologue.

<pre>  PROCEDURE IParamList(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L449)

`StandFunc` consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

<pre>  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L476)

`element` produces a reference to an element in a set.

<pre>  PROCEDURE element(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L523)

`set` produces a set from elements.

<pre>  PROCEDURE set(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L535)



<pre>  PROCEDURE factor(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L552)



<pre>  PROCEDURE term(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L587)



<pre>  PROCEDURE SimpleExpression(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L613)



<pre>  PROCEDURE expression0(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L634)

## Statements


<pre>  PROCEDURE StandProc(pno: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L685)



<pre>  PROCEDURE StatSequence;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L735)


<pre>    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L740)



<pre>    PROCEDURE TypeCasePart;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L757)



<pre>    PROCEDURE CaseLabel(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L770)



<pre>    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L781)



<pre>    PROCEDURE CaseExpression(VAR x: ORG.Item);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L811)


<pre>    PROCEDURE NumericCasePart;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L816)


## Types and Declarations


<pre>  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L942)



<pre>  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L961)



<pre>  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L984)



<pre>  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1033)



<pre>  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1055)



<pre>  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1082)



<pre>  PROCEDURE CheckRecLevel(lev: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1104)



<pre>  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1112)



<pre>  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1145)



<pre>  PROCEDURE Declarations(VAR varsize: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1193)



<pre>  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1266)



<pre>  PROCEDURE ProcedureDecl;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1291)



<pre>    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1301)



<pre>  PROCEDURE ImportList;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1370)



<pre>  PROCEDURE Module;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1392)



<pre>  PROCEDURE Option(VAR S: Texts.Scanner);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1435)



<pre>  PROCEDURE Compile*;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1446)

