
## [MODULE ORS](https://github.com/io-core/Build/blob/main/ORS.Mod)

  ## Imports:
` SYSTEM Texts Oberon`

## Procedures:
---

`  PROCEDURE CopyId*(VAR ident: Ident);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L57)


`  PROCEDURE Pos*(): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L61)


`  PROCEDURE Mark*(msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L65)


`  PROCEDURE Identifier(VAR sym: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L75)


`  PROCEDURE String;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L90)


`  PROCEDURE HexString;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L102)


`  PROCEDURE Ten(e: LONGINT): REAL;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L122)


`  PROCEDURE Number(VAR sym: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L132)


`  PROCEDURE comment;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L201)


`  PROCEDURE Get*(VAR sym: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L215)


`  PROCEDURE Init*(T: Texts.Text; pos: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L270)


`  PROCEDURE EnterKW(sym: INTEGER; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L274)

