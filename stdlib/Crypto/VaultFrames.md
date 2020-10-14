
## [MODULE VaultFrames](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod)

Procedures:


<code>  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L79)


<code>  PROCEDURE Restore*(f: Frame);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L88)


<code>  PROCEDURE FlipCross(X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L105)


<code>  PROCEDURE Focus*(): Frame;</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L116)


<code>  PROCEDURE Selected*(): Frame;</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L121)


<code>  PROCEDURE This*(x, y: INTEGER): Frame;</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L126)


<code>  PROCEDURE Mark(f: Frame; mode: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L131)


<code>  PROCEDURE Draw*(f: Frame);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L136)


<code>  PROCEDURE DrawNorm(f: Frame);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L141)


<code>  PROCEDURE Erase*(f: Frame);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L146)


<code>  PROCEDURE DrawDocument*(f: Frame; L: Vaults.Document);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L151)


<code>  PROCEDURE EraseDocument*(f: Frame; D: Vaults.Document);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L156)


<code>  PROCEDURE Change*(f: Frame; VAR msg: Vaults.Msg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L161)


<code>  PROCEDURE FlipMark(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L166)


<code>  PROCEDURE Defocus*(f: Frame);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L172)


<code>  PROCEDURE Deselect*(f: Frame);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L182)


<code>  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L191)


<code>  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L286)


<code>  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L294)


<code>  PROCEDURE DeleteChar(f: Frame);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L304)


<code>  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L325)


<code>  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L335)


<code>  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L395)


<code>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L401)


<code>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L410)


<code>  PROCEDURE DrawLine(obj: Vaults.Document; VAR m: Vaults.Msg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L419)


<code>  PROCEDURE DrawCaption(obj: Vaults.Document; VAR m: Vaults.Msg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L441)


<code>  PROCEDURE DrawMacro(obj: Vaults.Document; VAR m: Vaults.Msg);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L473)


<code>  PROCEDURE Open*(f: Frame; V: Vaults.Vault);</code> [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L496)

