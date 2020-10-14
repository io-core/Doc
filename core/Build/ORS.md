
## [MODULE ORS](https://github.com/io-core/Build/blob/main/ORS.Mod)

Procedures:

[](https://github.com/io-core/Build/blob/main/ORS.Mod#L57) `  PROCEDURE CopyId*(VAR ident: Ident);`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L61) `  PROCEDURE Pos*(): LONGINT;`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L65) `  PROCEDURE Mark*(msg: ARRAY OF CHAR);`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L75) `  PROCEDURE Identifier(VAR sym: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L90) `  PROCEDURE String;`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L102) `  PROCEDURE HexString;`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L122) `  PROCEDURE Ten(e: LONGINT): REAL;`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L132) `  PROCEDURE Number(VAR sym: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L201) `  PROCEDURE comment;`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L215) `  PROCEDURE Get*(VAR sym: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L270) `  PROCEDURE Init*(T: Texts.Text; pos: LONGINT);`
[](https://github.com/io-core/Build/blob/main/ORS.Mod#L274) `  PROCEDURE EnterKW(sym: INTEGER; name: ARRAY OF CHAR);`
