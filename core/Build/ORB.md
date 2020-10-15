
## [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)

  ## Imports:
` Files ORS`

  ## Constants:
```
 versionkey* = 1; maxTypTab = 64; C20 = 100000H;
    (* class values*) Head* = 0;
      Const* = 1; Var* = 2; Par* = 3; Fld* = 4; Typ* = 5;
      SProc* = 6; SFunc* = 7; Mod* = 8;

    (* form values*)
      Byte* = 1; Bool* = 2; Char* = 3; Int* = 4; Real* = 5; Set* = 6;
      Pointer* = 7; Interface* = 8; NilTyp* = 9; NoTyp* = 10; Proc* = 11;
      String* = 12; Array* = 13; Record* = 14; TProc* = 15;
      Ptrs* = {Pointer, Interface, NilTyp}; Procs* = {Proc, NoTyp};

```
  ## Types:
```
 Object* = POINTER TO ObjDesc;
    Module* = POINTER TO ModDesc;
    Type* = POINTER TO TypeDesc;

    ObjDesc*= RECORD
      class*, exno*: BYTE;
      expo*, rdo*: BOOLEAN;  (*exported / read-only*)
      lev*: INTEGER;
      next*, dsc*: Object;
      type*: Type;
      name*: ORS.Ident;
      val*: LONGINT
    END ;

    ModDesc* = RECORD (ObjDesc) orgname*: ORS.Ident END ;

    TypeDesc* = RECORD
      form*, ref*, mno*: INTEGER;  (*ref is only used for import/export*)
      nofpar*: INTEGER;  (*for procedures, extension level for records*)
      len*: LONGINT;  (*for arrays, len < 0 => open array; for records: adr of descriptor*)
      dsc*, typobj*: Object;
      base*: Type;  (*for arrays, records, pointers*)
      size*: LONGINT;  (*in bytes; always multiple of 4, except for Byte, Bool and Char*)
    END ;

  (* Object classes and the meaning of "val":
    class    val
    ----------
    Var      address
    Par      address
    Const    value
    Fld      offset
    Typ      type descriptor (TD) address
    SProc    inline code number
    SFunc    inline code number
    Mod      key

  Type forms and the meaning of "dsc" and "base":
    form     dsc      base
    ------------------------
    Pointer  -        type of dereferenced object
    Proc     params   result type
    Array    -        type of elements
    Record   fields   extension *)

```
## Variables:
```
 topScope*, universe, system*: Object;
    byteType*, boolType*, charType*: Type;
    intType*, realType*, setType*, nilType*, noType*, strType*: Type;
    nofmod, Ref: INTEGER;
    typtab: ARRAY maxTypTab OF Type;

```
## Procedures:
---

`  PROCEDURE NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L79)


`  PROCEDURE thisObj*(): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L90)


`  PROCEDURE thisimport*(mod: Object): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L100)


`  PROCEDURE thisfield*(rec: Type): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L114)


`  PROCEDURE FindFld*(id: ORS.Ident; rec: Type): Object;  (*search id in fields of rec proper, but not its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L121)


`  PROCEDURE NofMethods*(rec: Type): INTEGER;  (*number of methods bound to rec and its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L130)


`  PROCEDURE NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L140)


`    PROCEDURE UpdateLinks(rec: Type; new, bot: Object);  (*between field lists of extensions*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L143)


`  PROCEDURE OpenScope*;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L177)


`  PROCEDURE CloseScope*;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L182)


`  PROCEDURE MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L188)


`  PROCEDURE ThisModule(name, orgname: ORS.Ident; decl: BOOLEAN; key: LONGINT): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L196)


`  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L218)


`  PROCEDURE InType(VAR R: Files.Rider; thismod: Object; VAR T: Type);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L224)


`  PROCEDURE Import*(VAR modid, modid1: ORS.Ident);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L286)


`  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L319)


`  PROCEDURE OutType(VAR R: Files.Rider; t: Type);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L323)


`    PROCEDURE OutPar(VAR R: Files.Rider; par: Object; n: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L326)


`    PROCEDURE FindHiddenFields(VAR R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L337)


`  PROCEDURE Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L391)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L433)


`  PROCEDURE type(ref, form: INTEGER; size: LONGINT): Type;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L437)


`  PROCEDURE enter(name: ARRAY OF CHAR; cl: INTEGER; type: Type; n: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L443)

