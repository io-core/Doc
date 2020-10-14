
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

ORP is a recursive descent parser that visits procedures corresponding to symbols and terms in the Oberon language.


Procedures:

## Checking Symbols and Types
**Check** --- consumes the current token if it matches the expected symbol, otherwise an error is marked.

`  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L90)

**Qualident** --- generates a reference to a previously defined item if possible otherwise an error is marked.

`  PROCEDURE qualident(VAR obj: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L98)

**CheckBool** ---  marks an error if the item is not a boolean.

`  PROCEDURE CheckBool(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L115)

**CheckInt** marks an error if the item is not an Int.

`  PROCEDURE CheckInt(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L123)

---
**CheckReal** marks an error if the item is not a Real.

`  PROCEDURE CheckReal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L132)

---
**CheckSet** marks an error if the item is not a Set.

`  PROCEDURE CheckSet(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L141)

**CheckSetVal** marks an error if the item is not a Set Value.

`  PROCEDURE CheckSetVal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L149)

**CheckConst** marks an error if the value is not a Constant.

`  PROCEDURE CheckConst(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L160)

**CheckReadOnly** marks an error if the value is not read-only.

`  PROCEDURE CheckReadOnly(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L168)

**CheckExport** checks for an export symbol and marks an error if export not at top level.

`  PROCEDURE CheckExport(VAR expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L176)

**IsExtension** determines if type t1 is an extension of t0.

`  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L188)

**CheckReceiver** ensures that an object is compatible with its receiver or marks an error.

`  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L196)

**DisallowedMethods** blocks methods from binding to rec and its base types.

`  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L204)

## Expressions
**TypeTest** marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.

`  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L218)

**selector** generates the array item, procedure, or method dereference on an array or record.

`  PROCEDURE selector(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L244)

**EqualSignatures** verifies that a procedure may be assigned to a procedure variable.

`  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L320)

**CompTypes** verifies assigment compatibility by type.

`  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L350)

**Parameter** consumes a function call parameter and produces function call proloogue code for the parameter.

`  PROCEDURE Parameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L364)

**IParameter** consumes an Interface call parameter and produces Interface call prologue code for the parameter.

`  PROCEDURE IParameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L395)

**ParamList** consumes the function call parameters, resulting in a function call prologue.

`  PROCEDURE ParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L426)

**IParamList** consumes the Interface call parameters, resulting in a Interface call prologue.

`  PROCEDURE IParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L451)

**StandFunc** consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

`  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L478)

**element** produces a reference to an element in a set.

`  PROCEDURE element(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L525)

**set** produces a set from elements.

`  PROCEDURE set(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L537)

**factor** generates code that produces a value from identifiers, applications of functions and procedures, etc. for use in a calculation or assignment.

`  PROCEDURE factor(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L554)

**term** combines factors via multiplication and division, resulting in a value.

`  PROCEDURE term(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L589)

**SimpleExpression** combines terms via addition, subtraction, boolean, and set operations, resulting in a value.

`  PROCEDURE SimpleExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L615)

**expression0** produces code handling arbitrary arithmetic and logical operations, resulting in a value.

`  PROCEDURE expression0(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L636)

## Statements


`  PROCEDURE StandProc(pno: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L687)



`  PROCEDURE StatSequence;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L737)


`    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L742)



`    PROCEDURE TypeCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L759)



`    PROCEDURE CaseLabel(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L772)



`    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L783)



`    PROCEDURE CaseExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L813)


`    PROCEDURE NumericCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L818)


## Types and Declarations


`  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L944)



`  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L963)



`  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L986)



`  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1035)



`  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1057)



`  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1084)



`  PROCEDURE CheckRecLevel(lev: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1106)



`  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1114)



`  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1147)



`  PROCEDURE Declarations(VAR varsize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1195)



`  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1268)



`  PROCEDURE ProcedureDecl;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1293)



`    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1303)



`  PROCEDURE ImportList;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1372)



`  PROCEDURE Module;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1394)



`  PROCEDURE Option(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1437)



`  PROCEDURE Compile*;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1448)

