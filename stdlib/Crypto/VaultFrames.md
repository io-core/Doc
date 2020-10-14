
## [MODULE VaultFrames](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod)

Procedures:


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L79) `  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L88) `  PROCEDURE Restore*(f: Frame);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L105) `  PROCEDURE FlipCross(X, Y: INTEGER);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L116) `  PROCEDURE Focus*(): Frame;`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L121) `  PROCEDURE Selected*(): Frame;`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L126) `  PROCEDURE This*(x, y: INTEGER): Frame;`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L131) `  PROCEDURE Mark(f: Frame; mode: INTEGER);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L136) `  PROCEDURE Draw*(f: Frame);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L141) `  PROCEDURE DrawNorm(f: Frame);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L146) `  PROCEDURE Erase*(f: Frame);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L151) `  PROCEDURE DrawDocument*(f: Frame; L: Vaults.Document);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L156) `  PROCEDURE EraseDocument*(f: Frame; D: Vaults.Document);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L161) `  PROCEDURE Change*(f: Frame; VAR msg: Vaults.Msg);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L166) `  PROCEDURE FlipMark(x, y: INTEGER);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L172) `  PROCEDURE Defocus*(f: Frame);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L182) `  PROCEDURE Deselect*(f: Frame);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L191) `  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L286) `  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L294) `  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L304) `  PROCEDURE DeleteChar(f: Frame);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L325) `  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L335) `  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L395) `  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L401) `  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L410) `  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L419) `  PROCEDURE DrawLine(obj: Vaults.Document; VAR m: Vaults.Msg);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L441) `  PROCEDURE DrawCaption(obj: Vaults.Document; VAR m: Vaults.Msg);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L473) `  PROCEDURE DrawMacro(obj: Vaults.Document; VAR m: Vaults.Msg);`


[(src)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L496) `  PROCEDURE Open*(f: Frame; V: Vaults.Vault);`

