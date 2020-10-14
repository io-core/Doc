
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

Procedures:

[80](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#80) `  PROCEDURE New*(D: Document);`
[84](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#84) `  PROCEDURE Add*(V: Vault; D: Document);`
[89](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#89) `  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;`
[96](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#96) `  PROCEDURE SelectDocument*(V: Vault; D: Document);`
[101](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#101) `  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);`
[115](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#115) `  PROCEDURE Draw*(V: Vault; VAR m: Msg);`
[122](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#122) `  PROCEDURE List*(V: Vault);`
[137](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#137) `  PROCEDURE Deselect*(V: Vault);`
[143](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#143) `  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);`
[152](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#152) `  PROCEDURE Change*(V: Vault; VAR m: Msg);`
[163](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#163) `  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);`
[171](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#171) `  PROCEDURE SetWidth*(w: INTEGER);`
[176](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#176) `  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);`
[193](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#193) `  PROCEDURE Delete*(V: Vault);`
[212](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#212) `  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));`
