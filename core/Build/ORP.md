
#### [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

Check consumes the current token if it matches the expected symbol, otherwise an error is marked.
```
  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);
```
Qualident generates a reference to a previously defined item if possible otherwise an error is marked.
```
  PROCEDURE qualident(VAR obj: ORB.Object);
```
CheckBool marks an error if the item is not a boolean.
```
  PROCEDURE CheckBool(VAR x: ORG.Item);
```
CheckInt marks an error if the item is not an Int.
```
  PROCEDURE CheckInt(VAR x: ORG.Item);
```
CheckReal marks an error if the item is not a Real.
```
  PROCEDURE CheckReal(VAR x: ORG.Item);
```
CheckSet marks an error if the item is not a Set.
```
  PROCEDURE CheckSet(VAR x: ORG.Item);
```
CheckSetVal marks an error if the item is not a Set Value.
```
  PROCEDURE CheckSetVal(VAR x: ORG.Item);
```
CheckConst marks an error if the value is not a Constant.
```
  PROCEDURE CheckConst(VAR x: ORG.Item);
```
CheckReadOnly marks an error if the value is not read-only.
```
  PROCEDURE CheckReadOnly(VAR x: ORG.Item);
```
CheckExport checks for an export symbol and marks an error if export not at top level.
```
  PROCEDURE CheckExport(VAR expo: BOOLEAN);
```

```
  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;
```

```
  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);
```

```
  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)
```

```
  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);
```

```
  PROCEDURE selector(VAR x: ORG.Item);
```

```
  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;
```

```
  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;
```

```
  PROCEDURE Parameter(par: ORB.Object);
```

```
  PROCEDURE IParameter(par: ORB.Object);
```

```
  PROCEDURE ParamList(VAR x: ORG.Item);
```

```
  PROCEDURE IParamList(VAR x: ORG.Item);
```

```
  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);
```

```
  PROCEDURE element(VAR x: ORG.Item);
```

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
