
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

Procedures:


<pre>  PROCEDURE New*(D: Document);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L80)


<pre>  PROCEDURE Add*(V: Vault; D: Document);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L84)


<pre>  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L89)


<pre>  PROCEDURE SelectDocument*(V: Vault; D: Document);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L96)


<pre>  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L101)


<pre>  PROCEDURE Draw*(V: Vault; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L115)


<pre>  PROCEDURE List*(V: Vault);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L122)


<pre>  PROCEDURE Deselect*(V: Vault);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L137)


<pre>  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L143)


<pre>  PROCEDURE Change*(V: Vault; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L152)


<pre>  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L163)


<pre>  PROCEDURE SetWidth*(w: INTEGER);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L171)


<pre>  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L176)


<pre>  PROCEDURE Delete*(V: Vault);</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L193)


<pre>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));</pre> [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L212)

