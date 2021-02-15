
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

(N. Wirth 1.7.97 / 8.3.2020  Oberon compiler for RISC in Oberon-07)

**ORP** implements a one-pass recursive descent parser for the language Oberon.

The structure of the parser is derived from the structure of the language, with constituent parts of the language 
(e.g. Module, Procedure, Type, Expression, Term, Parameter) represented by a procedure of that name, invoked from the 
encompassing construct. Each procedure consumes and validates a part of the program source text while populating the 
symbol table and execution context and also generating machine code faithfully representing that language construct.

This module (ORP) relies on module ORG for code generation, ORB for the symbol table, execution context tracking and reserved words, and ORS
for lexical parsing and built-in type identification.


  ## Imports:
` Texts Oberon ORS ORB ORG`

## Constants:
```


```
## Types:
```
 
    PtrBase = POINTER TO PtrBaseDesc;
    PtrBaseDesc = RECORD  (*list of names of pointer base types*)
      name: ORS.Ident; type: ORB.Type; next: PtrBase
    END ;
  
```
## Variables:
```
 
    sym: INTEGER;   (*last symbol read*)
    dc: LONGINT;    (*data counter*)
    level, exno, version: INTEGER;
    newSF: BOOLEAN;  (*option flag*)
    ccARCH, ccWordsize, ccStackalign: INTEGER;
    expression: PROCEDURE (VAR x: ORG.Item);  (*to avoid forward reference*)
    Type: PROCEDURE (VAR type: ORB.Type);
    FormalType: PROCEDURE (VAR typ: ORB.Type; dim: INTEGER);
    modid: ORS.Ident;
    pbsList: PtrBase;   (*list of names of pointer base types*)
    dummy: ORB.Object;
    W: Texts.Writer;

```
## Procedures:
---
## ---------- Tests
---
**Check** marks an error if the current symbol does not match the expeted symbol.

`  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L104)

---
**Qualident** generates a reference to a previously defined item if possible otherwise an error is marked.

`  PROCEDURE qualident(VAR obj: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L113)

---
**CheckBool** marks an error if the item is not a boolean.

`  PROCEDURE CheckBool(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L129)

---
**CheckInt** marks an error if the item is not an Int.

`  PROCEDURE CheckInt(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L138)

---
**CheckReal** marks an error if the item is not a Real.

`  PROCEDURE CheckReal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L147)

---
**CheckSet** marks an error if the item is not a Set.

`  PROCEDURE CheckSet(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L156)

---
**CheckSetVal** marks an error if the item is not a Set Value.

`  PROCEDURE CheckSetVal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L165)

---
**CheckConst** marks an error if the value is not a Constant.

`  PROCEDURE CheckConst(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L177)

---
**CheckReadOnly** marks an error if the value is not read-only.

`  PROCEDURE CheckReadOnly(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L186)

---
**CheckExport** checks for an export symbol and marks an error if export not at top level.

`  PROCEDURE CheckExport(VAR expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L195)

---
**IsExtension** determines if type t1 is an extension of t0.

`  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L208)

## ---------- Expressions
---
**TypeTest** checks for assignment type compatibility.

`  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L223)

---
**selector** generates the array item, procedure, or method dereference on an array or record.

`  PROCEDURE selector(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L250)

---
**EqualSignatures** verifies that a procedure may be assigned to a procedure variable.

`  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L298)

---
**CompTypes** verifies assigment compatibility by type.

`  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L321)

---
**Parameter** consumes a function call parameter and produces function call proloogue code for the parameter.

`  PROCEDURE Parameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L336)

---
**ParamList** consumes the function call parameters, resulting in a function call prologue.

`  PROCEDURE ParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L368)

---
**StandFunc** consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

`  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L392)

---
**element** produces a reference to an element in a set.

`  PROCEDURE element(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L440)

---
**set** produces a set from elements.

`  PROCEDURE set(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L453)

---
**factor** generates code that produces a value from identifiers, applications of functions and procedures, etc. for use in a calculation or assignment.

`  PROCEDURE factor(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L473)

---
**term** combines factors via multiplication and division, resulting in a value.

`  PROCEDURE term(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L509)

---
**SimpleExpression** combines terms via addition, subtraction, boolean, and set operations, resulting in a value.

`  PROCEDURE SimpleExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L536)

---
**expression0** produces code handling arbitrary arithmetic and logical operations, resulting in a value.

expression0 is assigned to the procedure variable `expression` to allow the forward reference.


`  PROCEDURE expression0(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L561)

## ---------- Statements
---
**StandProc** handles standard (predefined) procedures.

`  PROCEDURE StandProc(pno: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L613)

---
**StatSequence** matches a statement sequence.

`  PROCEDURE StatSequence;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L655)

**TypeCase** (interior procedure)

`    PROCEDURE TypeCase(obj: ORB.Object; VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L664)

**SkipCase** (interior procedure)

`    PROCEDURE SkipCase;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L679)

## ---------- Types and declarations
---
**IdentList** matches a comma separated list of identifiers.

`  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L802)

---
**ArrayType** matches the definiton of an Array Type or marks an error.

`  PROCEDURE ArrayType(VAR type: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L822)

---
**RecordType** matches the definition of a Record Type or marks an error.

`  PROCEDURE RecordType(VAR type: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L842)

---
**FPSection** matches the parameters to a function or marks an error.

`  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L891)

---
**ProcedureType** matches a Procedure Type definition or marks an error.

`  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L914)

---
**FormalType0** matches the definition of a type or marks an error.

`  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L942)

---
**CheckRecLevel** ensures that the ptr base is global.

`  PROCEDURE CheckRecLevel(lev: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L965)

---
**Type0** matches a type definition or marks an error.

`  PROCEDURE Type0(VAR type: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L974)

---
**Declarations** dispatches the definition of constants, types, and variables.

`  PROCEDURE Declarations(VAR varsize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1020)

---
**ProcedureDecl** matches the definition of a procedure or marks an error.

`  PROCEDURE ProcedureDecl;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1091)

---
**Import** consumes the names of modules imported by this module and ensures their compatibility or marks an error.

`  PROCEDURE Import;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1143)

---
**Module** begins the recursive descent parsing of the source text and emits an object code file on completion or marks an error.

`  PROCEDURE Module;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1164)

## ---------- Command Invocation
---
**Option** checks if a new symbol file may be generated and which architecture to compile for.

`  PROCEDURE Option(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1222)

---
**Compile** locates the source code to a module, initializes the scanner, and begins parsing at 'Module'.

`  PROCEDURE Compile*;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1246)

---
**The initialzation code for this module** opens a writer to print marked errors and initializes the Oberon parser state.
