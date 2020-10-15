
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

