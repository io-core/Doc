
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

(N. Wirth 1.7.97 / 8.3.2020  Oberon compiler for RISC in Oberon-07 / AP 6.8.20 Extended Oberon / CP 10.20 Integrated Oberon)

**ORP** implements a one-pass recursive descent parser for the language Oberon-2i.

The structure of the parser is derived from the structure of the language, with constituent parts of the language 
(e.g. Module, Procedure, Type, Expression, Term, Parameter) represented by a procedure of that name, invoked from the 
encompassing construct. Each procedure consumes and validates a part of the program source text while populating the 
symbol table and execution context and also generating machine code faithfully representing that language construct.

This module (ORP) relies on module ORG for code generation, ORB for the symbol table, execution context tracking and reserved words, and ORS
for lexical parsing and built-in type identification.

Oberon-2i is an extension of Oberon-2, adding interfaces (a.k.a dynamic traits) to the language. Oberon-2 is an extension of Oberon, adding type-bound
procedures and open arrays to the language. Oberon is both an extension and a refinement of Modula-2, which added seperate compilation
among other features to Pascal, which was developed as a reaction to and refinement of Algol-68.


  ## Imports:
` Texts Oberon ORS ORB ORG`

## Constants:
```
 NofCases = 256; C20 = 100000H;

```
## Types:
```
 
    PtrBase = POINTER TO PtrBaseDesc;
    PtrBaseDesc = RECORD             (*list of names of pointer base types*)
      name: ORS.Ident; type: ORB.Type; next: PtrBase
    END ;
  
```
## Variables:
```
 
    sym: INTEGER;                    (*last symbol read*)
    dc: LONGINT;                     (*data counter*)
    level, exno, version: INTEGER;
    newSF: BOOLEAN;                  (*option flag*)
    expression: PROCEDURE (VAR x: ORG.Item);  
    Type: PROCEDURE (VAR type: ORB.Type; expo: BOOLEAN);
    FormalType: PROCEDURE (VAR typ: ORB.Type; dim: INTEGER);
    modid: ORS.Ident;
    pbsList: PtrBase;                (*list of names of pointer base types*)
    dummy: ORB.Object;
    W: Texts.Writer;

```
## Procedures:
---
## Checking Symbols and Types
---
**Check** consumes the current token if it matches the expected symbol, otherwise an error is marked.

`  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L107)

---
**Qualident** generates a reference to a previously defined item if possible otherwise an error is marked.

`  PROCEDURE qualident(VAR obj: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L116)

---
**CheckBool** marks an error if the item is not a boolean.

`  PROCEDURE CheckBool(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L134)

---
**CheckInt** marks an error if the item is not an Int.

`  PROCEDURE CheckInt(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L143)

---
**CheckReal** marks an error if the item is not a Real.

`  PROCEDURE CheckReal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L152)

---
**CheckSet** marks an error if the item is not a Set.

`  PROCEDURE CheckSet(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L161)

---
**CheckSetVal** marks an error if the item is not a Set Value.

`  PROCEDURE CheckSetVal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L170)

---
**CheckConst** marks an error if the value is not a Constant.

`  PROCEDURE CheckConst(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L182)

---
**CheckReadOnly** marks an error if the value is not read-only.

`  PROCEDURE CheckReadOnly(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L191)

---
**CheckExport** checks for an export symbol and marks an error if export not at top level.

`  PROCEDURE CheckExport(VAR expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L200)

---
**IsExtension** determines if type t1 is an extension of t0.

`  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L213)

---
**CheckReceiver** ensures that an object is compatible with its receiver or marks an error.

`  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L222)

---
**DisallowedMethods** blocks methods from binding to rec and its base types.

`  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L231)

## Expressions
---
**TypeTest** marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.

`  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L246)

---
**selector** generates the array item, procedure, or method dereference on an array or record.

`  PROCEDURE selector(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L273)

---
**EqualSignatures** verifies that a procedure may be assigned to a procedure variable.

`  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L350)

---
**CompTypes** verifies assigment compatibility by type.

`  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L381)

---
**Parameter** consumes a function call parameter and produces function call proloogue code for the parameter.

`  PROCEDURE Parameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L396)

---
**IParameter** consumes an Interface call parameter and produces Interface call prologue code for the parameter.

`  PROCEDURE IParameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L428)

---
**ParamList** consumes the function call parameters, resulting in a function call prologue.

`  PROCEDURE ParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L460)

---
**IParamList** consumes the Interface call parameters, resulting in a Interface call prologue.

`  PROCEDURE IParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L486)

---
**StandFunc** consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

`  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L514)

---
**element** produces a reference to an element in a set.

`  PROCEDURE element(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L562)

---
**set** produces a set from elements.

`  PROCEDURE set(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L575)

---
**factor** generates code that produces a value from identifiers, applications of functions and procedures, etc. for use in a calculation or assignment.

`  PROCEDURE factor(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L593)

---
**term** combines factors via multiplication and division, resulting in a value.

`  PROCEDURE term(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L629)

---
**SimpleExpression** combines terms via addition, subtraction, boolean, and set operations, resulting in a value.

`  PROCEDURE SimpleExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L656)

---
**expression0** produces code handling arbitrary arithmetic and logical operations, resulting in a value.

expression0 is assigned to the procedure variable `expression` to allow the forward reference.


`  PROCEDURE expression0(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L681)

## Statements
---
**StandProc** prepares a standard procedure for later reference in code.

`  PROCEDURE StandProc(pno: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L733)



`  PROCEDURE StatSequence;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L783)


`    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L788)



`    PROCEDURE TypeCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L805)



`    PROCEDURE CaseLabel(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L818)



`    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L829)



`    PROCEDURE CaseExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L859)


`    PROCEDURE NumericCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L864)


## Types and Declarations


`  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L990)



`  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1009)



`  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1032)



`  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1081)



`  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1103)



`  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1130)



`  PROCEDURE CheckRecLevel(lev: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1152)



`  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1160)



`  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1193)



`  PROCEDURE Declarations(VAR varsize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1241)



`  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1314)



`  PROCEDURE ProcedureDecl;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1339)



`    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1349)



`  PROCEDURE ImportList;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1418)



`  PROCEDURE Module;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1440)



`  PROCEDURE Option(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1483)



`  PROCEDURE Compile*;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1494)

