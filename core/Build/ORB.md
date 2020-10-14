
## [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)

Procedures:

[](https://github.com/io-core/Build/blob/main/ORB.Mod#L79) `  PROCEDURE NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L90) `  PROCEDURE thisObj*(): Object;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L100) `  PROCEDURE thisimport*(mod: Object): Object;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L114) `  PROCEDURE thisfield*(rec: Type): Object;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L121) `  PROCEDURE FindFld*(id: ORS.Ident; rec: Type): Object;  (*search id in fields of rec proper, but not its base types*)`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L130) `  PROCEDURE NofMethods*(rec: Type): INTEGER;  (*number of methods bound to rec and its base types*)`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L140) `  PROCEDURE NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L143) `    PROCEDURE UpdateLinks(rec: Type; new, bot: Object);  (*between field lists of extensions*)`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L177) `  PROCEDURE OpenScope*;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L182) `  PROCEDURE CloseScope*;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L188) `  PROCEDURE MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L196) `  PROCEDURE ThisModule(name, orgname: ORS.Ident; decl: BOOLEAN; key: LONGINT): Object;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L218) `  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L224) `  PROCEDURE InType(VAR R: Files.Rider; thismod: Object; VAR T: Type);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L286) `  PROCEDURE Import*(VAR modid, modid1: ORS.Ident);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L319) `  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L323) `  PROCEDURE OutType(VAR R: Files.Rider; t: Type);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L326) `    PROCEDURE OutPar(VAR R: Files.Rider; par: Object; n: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L337) `    PROCEDURE FindHiddenFields(VAR R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L391) `  PROCEDURE Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L433) `  PROCEDURE Init*;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L437) `  PROCEDURE type(ref, form: INTEGER; size: LONGINT): Type;`
[](https://github.com/io-core/Build/blob/main/ORB.Mod#L443) `  PROCEDURE enter(name: ARRAY OF CHAR; cl: INTEGER; type: Type; n: LONGINT);`
