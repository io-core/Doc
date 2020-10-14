
## [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)

Procedures:


<pre>  PROCEDURE NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L79)


<pre>  PROCEDURE thisObj*(): Object;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L90)


<pre>  PROCEDURE thisimport*(mod: Object): Object;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L100)


<pre>  PROCEDURE thisfield*(rec: Type): Object;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L114)


<pre>  PROCEDURE FindFld*(id: ORS.Ident; rec: Type): Object;  (*search id in fields of rec proper, but not its base types*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L121)


<pre>  PROCEDURE NofMethods*(rec: Type): INTEGER;  (*number of methods bound to rec and its base types*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L130)


<pre>  PROCEDURE NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L140)


<pre>    PROCEDURE UpdateLinks(rec: Type; new, bot: Object);  (*between field lists of extensions*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L143)


<pre>  PROCEDURE OpenScope*;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L177)


<pre>  PROCEDURE CloseScope*;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L182)


<pre>  PROCEDURE MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L188)


<pre>  PROCEDURE ThisModule(name, orgname: ORS.Ident; decl: BOOLEAN; key: LONGINT): Object;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L196)


<pre>  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L218)


<pre>  PROCEDURE InType(VAR R: Files.Rider; thismod: Object; VAR T: Type);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L224)


<pre>  PROCEDURE Import*(VAR modid, modid1: ORS.Ident);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L286)


<pre>  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L319)


<pre>  PROCEDURE OutType(VAR R: Files.Rider; t: Type);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L323)


<pre>    PROCEDURE OutPar(VAR R: Files.Rider; par: Object; n: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L326)


<pre>    PROCEDURE FindHiddenFields(VAR R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L337)


<pre>  PROCEDURE Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L391)


<pre>  PROCEDURE Init*;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L433)


<pre>  PROCEDURE type(ref, form: INTEGER; size: LONGINT): Type;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L437)


<pre>  PROCEDURE enter(name: ARRAY OF CHAR; cl: INTEGER; type: Type; n: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L443)

