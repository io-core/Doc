
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

(N. Wirth 1.7.97 / 8.3.2020  Oberon compiler for RISC in Oberon-07 / AP 6.8.20 Extended Oberon / CP 10.20 Integrated Oberon)

**ORP** implements a one-pass recursive descent parser for the language Oberon-2i.

The structure of the parser is derived from the structure of the language, with constituent parts of the language 
(e.g. Module, Procedure, Type, Expression, Term, Parameter) represented by a procedure of that name, invoked from the 
encompassing construct. Each procedure consumes and validates a part of the program source text while populating the 
symbol table and execution context and also generating machine code faithfully representing that language construct.

This module (ORP) relies on module ORG for code generation, ORB for the symbol table and execution context tracking, and ORS
for lexical parsing, built-in type identification, and reserved symbols definition.

Oberon-2i is an extension of Oberon-2, adding interfaces (a.k.a dynamic traits) to the language. Oberon-2 is an extension of Oberon, adding type-bound
procedures and open arrays to the language. Oberon is both an extension and a refinement of Modula-2, which added seperate compilation
among other features to Pascal, which was developed as a reaction to and refinement of Algol-68.


  ## Imports:
` Texts Oberon ORS ORB ORG`

## Procedures:
---
## Checking Symbols and Types
---
**Check** consumes the current token if it matches the expected symbol, otherwise an error is marked.

`  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L105)

---
**Qualident** generates a reference to a previously defined item if possible otherwise an error is marked.

`  PROCEDURE qualident(VAR obj: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L114)

---
**CheckBool** marks an error if the item is not a boolean.

`  PROCEDURE CheckBool(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L132)

---
**CheckInt** marks an error if the item is not an Int.

`  PROCEDURE CheckInt(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L141)

---
**CheckReal** marks an error if the item is not a Real.

`  PROCEDURE CheckReal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L150)

---
**CheckSet** marks an error if the item is not a Set.

`  PROCEDURE CheckSet(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L159)

---
**CheckSetVal** marks an error if the item is not a Set Value.

`  PROCEDURE CheckSetVal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L168)

---
**CheckConst** marks an error if the value is not a Constant.

`  PROCEDURE CheckConst(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L180)

---
**CheckReadOnly** marks an error if the value is not read-only.

`  PROCEDURE CheckReadOnly(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L189)

---
**CheckExport** checks for an export symbol and marks an error if export not at top level.

`  PROCEDURE CheckExport(VAR expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L198)

---
**IsExtension** determines if type t1 is an extension of t0.

`  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L211)

---
**CheckReceiver** ensures that an object is compatible with its receiver or marks an error.

`  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L220)

---
**DisallowedMethods** blocks methods from binding to rec and its base types.

`  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L229)

## Expressions
---
**TypeTest** marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.

`  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L244)

---
**selector** generates the array item, procedure, or method dereference on an array or record.

`  PROCEDURE selector(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L271)

---
**EqualSignatures** verifies that a procedure may be assigned to a procedure variable.

`  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L348)

---
**CompTypes** verifies assigment compatibility by type.

`  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L379)

---
**Parameter** consumes a function call parameter and produces function call proloogue code for the parameter.

`  PROCEDURE Parameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L394)

---
**IParameter** consumes an Interface call parameter and produces Interface call prologue code for the parameter.

`  PROCEDURE IParameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L426)

---
**ParamList** consumes the function call parameters, resulting in a function call prologue.

`  PROCEDURE ParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L458)

---
**IParamList** consumes the Interface call parameters, resulting in a Interface call prologue.

`  PROCEDURE IParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L484)

---
**StandFunc** consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

`  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L512)

---
**element** produces a reference to an element in a set.

`  PROCEDURE element(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L560)

---
**set** produces a set from elements.

`  PROCEDURE set(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L573)

---
**factor** generates code that produces a value from identifiers, applications of functions and procedures, etc. for use in a calculation or assignment.

`  PROCEDURE factor(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L591)

---
**term** combines factors via multiplication and division, resulting in a value.

`  PROCEDURE term(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L627)

---
**SimpleExpression** combines terms via addition, subtraction, boolean, and set operations, resulting in a value.

`  PROCEDURE SimpleExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L654)

---
**expression0** produces code handling arbitrary arithmetic and logical operations, resulting in a value.

expression0 is assigned to the procedure variable `expression` to allow the forward reference.


`  PROCEDURE expression0(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L679)

## Statements
---
**StandProc** prepares a standard procedure for later reference in code.

`  PROCEDURE StandProc(pno: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L731)



`  PROCEDURE StatSequence;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L781)


`    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L786)



`    PROCEDURE TypeCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L803)



`    PROCEDURE CaseLabel(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L816)



`    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L827)



`    PROCEDURE CaseExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L857)


`    PROCEDURE NumericCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L862)


## Types and Declarations


`  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L988)



`  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1007)



`  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1030)



`  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1079)



`  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1101)



`  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1128)



`  PROCEDURE CheckRecLevel(lev: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1150)



`  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1158)



`  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1191)



`  PROCEDURE Declarations(VAR varsize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1239)



`  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1312)



`  PROCEDURE ProcedureDecl;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1337)



`    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1347)



`  PROCEDURE ImportList;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1416)



`  PROCEDURE Module;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1438)



`  PROCEDURE Option(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1481)



`  PROCEDURE Compile*;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1492)

