
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

## Checking Symbols and Types
`Check` consumes the current token if it matches the expected symbol, otherwise an error is marked.
```
  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);
```
`Qualident` generates a reference to a previously defined item if possible otherwise an error is marked.
```
  PROCEDURE qualident(VAR obj: ORB.Object);
```
`CheckBool` marks an error if the item is not a boolean.
```
  PROCEDURE CheckBool(VAR x: ORG.Item);
```
`CheckInt` marks an error if the item is not an Int.
```
  PROCEDURE CheckInt(VAR x: ORG.Item);
```
`CheckReal` marks an error if the item is not a Real.
```
  PROCEDURE CheckReal(VAR x: ORG.Item);
```
`CheckSet` marks an error if the item is not a Set.
```
  PROCEDURE CheckSet(VAR x: ORG.Item);
```
`CheckSetVal` marks an error if the item is not a Set Value.
```
  PROCEDURE CheckSetVal(VAR x: ORG.Item);
```
`CheckConst` marks an error if the value is not a Constant.
```
  PROCEDURE CheckConst(VAR x: ORG.Item);
```
`CheckReadOnly` marks an error if the value is not read-only.
```
  PROCEDURE CheckReadOnly(VAR x: ORG.Item);
```
`CheckExport` checks for an export symbol and marks an error if export not at top level.
```
  PROCEDURE CheckExport(VAR expo: BOOLEAN);
```
`IsExtension` determines if type t1 is an extension of t0.
```
  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;
```
`CheckReceiver` ensures that an object is compatible with its receiver or marks an error.
```
  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);
```
`DisallowedMethods` blocks methods from binding to rec and its base types.
```
  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)
```
## Expressions
`TypeTest` marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.
```
  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);
```
`selector` generates the array item, procedure, or method dereference on an array or record.
```
  PROCEDURE selector(VAR x: ORG.Item);
```
`EqualSignatures` verifies that a procedure may be assigned to a procedure variable.
```
  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;
```
`CompTypes` verifies assigment compatibility by type.
```
  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;
```
`Parameter` consumes a function call parameter and produces function call proloogue code for the parameter.
```
  PROCEDURE Parameter(par: ORB.Object);
```
`IParameter` consumes an Interface call parameter and produces Interface call prologue code for the parameter.
```
  PROCEDURE IParameter(par: ORB.Object);
```
`ParamList` consumes the function call parameters, resulting in a function call prologue.
```
  PROCEDURE ParamList(VAR x: ORG.Item);
```
`IParamList` consumes the Interface call parameters, resulting in a Interface call prologue.
```
  PROCEDURE IParamList(VAR x: ORG.Item);
```
`StandFunc` consumes standard language functions and produces inline code for those functions.
Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`
```
  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);
```
`element` produces a reference to an element in a set.
```
  PROCEDURE element(VAR x: ORG.Item);
```
`set` produces a set from elements.
```
  PROCEDURE set(VAR x: ORG.Item);
```

```
  PROCEDURE factor(VAR x: ORG.Item);
```

```
  PROCEDURE term(VAR x: ORG.Item);
```

```
  PROCEDURE SimpleExpression(VAR x: ORG.Item);
```

```
  PROCEDURE expression0(VAR x: ORG.Item);
```
## Statements

```
  PROCEDURE StandProc(pno: LONGINT);
```

```
  PROCEDURE StatSequence;
```
```
    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);
```

```
    PROCEDURE TypeCasePart;
```

```
    PROCEDURE CaseLabel(VAR x: ORG.Item);
```

```
    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);
```

```
    PROCEDURE CaseExpression(VAR x: ORG.Item);
```
```
    PROCEDURE NumericCasePart;
```

## Types and Declarations

```
  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);
```

```
  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);
```

```
  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);
```

```
  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);
```

```
  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);
```

```
  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);
```

```
  PROCEDURE CheckRecLevel(lev: INTEGER);
```

```
  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);
```

```
  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);
```

```
  PROCEDURE Declarations(VAR varsize: LONGINT);
```

```
  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);
```

```
  PROCEDURE ProcedureDecl;
```

```
    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);
```

```
  PROCEDURE ImportList;
```

```
  PROCEDURE Module;
```

```
  PROCEDURE Option(VAR S: Texts.Scanner);
```

```
  PROCEDURE Compile*;
```
