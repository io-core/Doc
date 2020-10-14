
#### [MODULE ORS](https://github.com/io-core/Build/blob/main/ORS.Mod)

Procedures:

```
  PROCEDURE CopyId*(VAR ident: Ident);
```
```
  PROCEDURE Pos*(): LONGINT;
```
```
  PROCEDURE Mark*(msg: ARRAY OF CHAR);
```
```
  PROCEDURE Identifier(VAR sym: INTEGER);
```
```
  PROCEDURE String;
```
```
  PROCEDURE HexString;
```
```
  PROCEDURE Ten(e: LONGINT): REAL;
```
```
  PROCEDURE Number(VAR sym: INTEGER);
```
```
  PROCEDURE comment;
```
```
  PROCEDURE Get*(VAR sym: INTEGER);
```
```
  PROCEDURE Init*(T: Texts.Text; pos: LONGINT);
```
```
  PROCEDURE EnterKW(sym: INTEGER; name: ARRAY OF CHAR);
```
