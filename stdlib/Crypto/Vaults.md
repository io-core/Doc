
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

Procedures:


<code>  PROCEDURE New*(D: Document);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L80)


<code>  PROCEDURE Add*(V: Vault; D: Document);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L84)


<code>  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L89)


<code>  PROCEDURE SelectDocument*(V: Vault; D: Document);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L96)


<code>  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L101)


<code>  PROCEDURE Draw*(V: Vault; VAR m: Msg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L115)


<code>  PROCEDURE List*(V: Vault);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L122)


<code>  PROCEDURE Deselect*(V: Vault);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L137)


<code>  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L143)


<code>  PROCEDURE Change*(V: Vault; VAR m: Msg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L152)


<code>  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L163)


<code>  PROCEDURE SetWidth*(w: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L171)


<code>  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L176)


<code>  PROCEDURE Delete*(V: Vault);</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L193)


<code>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));</code> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L212)

