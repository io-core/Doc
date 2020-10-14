
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

Procedures:

```
  PROCEDURE New*(D: Document);
```
```
  PROCEDURE Add*(V: Vault; D: Document);
```
```
  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;
```
```
  PROCEDURE SelectDocument*(V: Vault; D: Document);
```
```
  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);
```
```
  PROCEDURE Draw*(V: Vault; VAR m: Msg);
```
```
  PROCEDURE List*(V: Vault);
```
```
  PROCEDURE Deselect*(V: Vault);
```
```
  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);
```
```
  PROCEDURE Change*(V: Vault; VAR m: Msg);
```
```
  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);
```
```
  PROCEDURE SetWidth*(w: INTEGER);
```
```
  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);
```
```
  PROCEDURE Delete*(V: Vault);
```
```
  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));
```
