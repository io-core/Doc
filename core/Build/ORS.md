
## [MODULE ORS](https://github.com/io-core/Build/blob/main/ORS.Mod)

Procedures:


<pre>  PROCEDURE CopyId*(VAR ident: Ident);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L57)


<pre>  PROCEDURE Pos*(): LONGINT;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L61)


<pre>  PROCEDURE Mark*(msg: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L65)


<pre>  PROCEDURE Identifier(VAR sym: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L75)


<pre>  PROCEDURE String;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L90)


<pre>  PROCEDURE HexString;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L102)


<pre>  PROCEDURE Ten(e: LONGINT): REAL;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L122)


<pre>  PROCEDURE Number(VAR sym: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L132)


<pre>  PROCEDURE comment;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L201)


<pre>  PROCEDURE Get*(VAR sym: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L215)


<pre>  PROCEDURE Init*(T: Texts.Text; pos: LONGINT);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L270)


<pre>  PROCEDURE EnterKW(sym: INTEGER; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L274)

