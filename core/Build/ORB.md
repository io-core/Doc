
#### [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)

Procedures:

```
  PROCEDURE NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)
```
```
  PROCEDURE thisObj*(): Object;
```
```
  PROCEDURE thisimport*(mod: Object): Object;
```
```
  PROCEDURE thisfield*(rec: Type): Object;
```
```
  PROCEDURE FindFld*(id: ORS.Ident; rec: Type): Object;  (*search id in fields of rec proper, but not its base types*)
```
```
  PROCEDURE NofMethods*(rec: Type): INTEGER;  (*number of methods bound to rec and its base types*)
```
```
  PROCEDURE NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)
```
```
    PROCEDURE UpdateLinks(rec: Type; new, bot: Object);  (*between field lists of extensions*)
```
```
  PROCEDURE OpenScope*;
```
```
  PROCEDURE CloseScope*;
```
```
  PROCEDURE MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR);
```
```
  PROCEDURE ThisModule(name, orgname: ORS.Ident; decl: BOOLEAN; key: LONGINT): Object;
```
```
  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);
```
```
  PROCEDURE InType(VAR R: Files.Rider; thismod: Object; VAR T: Type);
```
```
  PROCEDURE Import*(VAR modid, modid1: ORS.Ident);
```
```
  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);
```
```
  PROCEDURE OutType(VAR R: Files.Rider; t: Type);
```
```
    PROCEDURE OutPar(VAR R: Files.Rider; par: Object; n: INTEGER);
```
```
    PROCEDURE FindHiddenFields(VAR R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)
```
```
  PROCEDURE Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT);
```
```
  PROCEDURE Init*;
```
```
  PROCEDURE type(ref, form: INTEGER; size: LONGINT): Type;
```
```
  PROCEDURE enter(name: ARRAY OF CHAR; cl: INTEGER; type: Type; n: LONGINT);
```
