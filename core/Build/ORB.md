
## [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)

Procedures:


<code>  PROCEDURE NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L79)


<code>  PROCEDURE thisObj*(): Object;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L90)


<code>  PROCEDURE thisimport*(mod: Object): Object;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L100)


<code>  PROCEDURE thisfield*(rec: Type): Object;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L114)


<code>  PROCEDURE FindFld*(id: ORS.Ident; rec: Type): Object;  (*search id in fields of rec proper, but not its base types*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L121)


<code>  PROCEDURE NofMethods*(rec: Type): INTEGER;  (*number of methods bound to rec and its base types*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L130)


<code>  PROCEDURE NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L140)


<code>    PROCEDURE UpdateLinks(rec: Type; new, bot: Object);  (*between field lists of extensions*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L143)


<code>  PROCEDURE OpenScope*;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L177)


<code>  PROCEDURE CloseScope*;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L182)


<code>  PROCEDURE MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L188)


<code>  PROCEDURE ThisModule(name, orgname: ORS.Ident; decl: BOOLEAN; key: LONGINT): Object;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L196)


<code>  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L218)


<code>  PROCEDURE InType(VAR R: Files.Rider; thismod: Object; VAR T: Type);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L224)


<code>  PROCEDURE Import*(VAR modid, modid1: ORS.Ident);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L286)


<code>  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L319)


<code>  PROCEDURE OutType(VAR R: Files.Rider; t: Type);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L323)


<code>    PROCEDURE OutPar(VAR R: Files.Rider; par: Object; n: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L326)


<code>    PROCEDURE FindHiddenFields(VAR R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L337)


<code>  PROCEDURE Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L391)


<code>  PROCEDURE Init*;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L433)


<code>  PROCEDURE type(ref, form: INTEGER; size: LONGINT): Type;</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L437)


<code>  PROCEDURE enter(name: ARRAY OF CHAR; cl: INTEGER; type: Type; n: LONGINT);</code> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L443)

