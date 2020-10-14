
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

Procedures:


[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L80) `  PROCEDURE New*(D: Document);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L84) `  PROCEDURE Add*(V: Vault; D: Document);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L89) `  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L96) `  PROCEDURE SelectDocument*(V: Vault; D: Document);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L101) `  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L115) `  PROCEDURE Draw*(V: Vault; VAR m: Msg);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L122) `  PROCEDURE List*(V: Vault);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L137) `  PROCEDURE Deselect*(V: Vault);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L143) `  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L152) `  PROCEDURE Change*(V: Vault; VAR m: Msg);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L163) `  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L171) `  PROCEDURE SetWidth*(w: INTEGER);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L176) `  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L193) `  PROCEDURE Delete*(V: Vault);`

[(src)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L212) `  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));`
