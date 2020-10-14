
## [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)

Procedures:

```
[79](https://github.com/io-core/Build/blob/main/ORB.Mod#79)    PROCEDURE NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)
```
```
[90](https://github.com/io-core/Build/blob/main/ORB.Mod#90)    PROCEDURE thisObj*(): Object;
```
```
[100](https://github.com/io-core/Build/blob/main/ORB.Mod#100)    PROCEDURE thisimport*(mod: Object): Object;
```
```
[114](https://github.com/io-core/Build/blob/main/ORB.Mod#114)    PROCEDURE thisfield*(rec: Type): Object;
```
```
[121](https://github.com/io-core/Build/blob/main/ORB.Mod#121)    PROCEDURE FindFld*(id: ORS.Ident; rec: Type): Object;  (*search id in fields of rec proper, but not its base types*)
```
```
[130](https://github.com/io-core/Build/blob/main/ORB.Mod#130)    PROCEDURE NofMethods*(rec: Type): INTEGER;  (*number of methods bound to rec and its base types*)
```
```
[140](https://github.com/io-core/Build/blob/main/ORB.Mod#140)    PROCEDURE NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)
```
```
[143](https://github.com/io-core/Build/blob/main/ORB.Mod#143)      PROCEDURE UpdateLinks(rec: Type; new, bot: Object);  (*between field lists of extensions*)
```
```
[177](https://github.com/io-core/Build/blob/main/ORB.Mod#177)    PROCEDURE OpenScope*;
```
```
[182](https://github.com/io-core/Build/blob/main/ORB.Mod#182)    PROCEDURE CloseScope*;
```
```
[188](https://github.com/io-core/Build/blob/main/ORB.Mod#188)    PROCEDURE MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR);
```
```
[196](https://github.com/io-core/Build/blob/main/ORB.Mod#196)    PROCEDURE ThisModule(name, orgname: ORS.Ident; decl: BOOLEAN; key: LONGINT): Object;
```
```
[218](https://github.com/io-core/Build/blob/main/ORB.Mod#218)    PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);
```
```
[224](https://github.com/io-core/Build/blob/main/ORB.Mod#224)    PROCEDURE InType(VAR R: Files.Rider; thismod: Object; VAR T: Type);
```
```
[286](https://github.com/io-core/Build/blob/main/ORB.Mod#286)    PROCEDURE Import*(VAR modid, modid1: ORS.Ident);
```
```
[319](https://github.com/io-core/Build/blob/main/ORB.Mod#319)    PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);
```
```
[323](https://github.com/io-core/Build/blob/main/ORB.Mod#323)    PROCEDURE OutType(VAR R: Files.Rider; t: Type);
```
```
[326](https://github.com/io-core/Build/blob/main/ORB.Mod#326)      PROCEDURE OutPar(VAR R: Files.Rider; par: Object; n: INTEGER);
```
```
[337](https://github.com/io-core/Build/blob/main/ORB.Mod#337)      PROCEDURE FindHiddenFields(VAR R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)
```
```
[391](https://github.com/io-core/Build/blob/main/ORB.Mod#391)    PROCEDURE Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT);
```
```
[433](https://github.com/io-core/Build/blob/main/ORB.Mod#433)    PROCEDURE Init*;
```
```
[437](https://github.com/io-core/Build/blob/main/ORB.Mod#437)    PROCEDURE type(ref, form: INTEGER; size: LONGINT): Type;
```
```
[443](https://github.com/io-core/Build/blob/main/ORB.Mod#443)    PROCEDURE enter(name: ARRAY OF CHAR; cl: INTEGER; type: Type; n: LONGINT);
```
