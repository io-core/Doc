
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

  **imports** SYSTEM Files Fonts Ciphers
## Procedures
---

`  PROCEDURE New*(D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L80)


`  PROCEDURE Add*(V: Vault; D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L84)


`  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L89)


`  PROCEDURE SelectDocument*(V: Vault; D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L96)


`  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L101)


`  PROCEDURE Draw*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L115)


`  PROCEDURE List*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L122)


`  PROCEDURE Deselect*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L137)


`  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L143)


`  PROCEDURE Change*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L152)


`  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L163)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L171)


`  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L176)


`  PROCEDURE Delete*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L193)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L212)

