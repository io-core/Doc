
## [MODULE KeySafeFrames](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod)

Procedures:


<code>  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L79)


<code>  PROCEDURE Restore*(f: Frame);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L88)


<code>  PROCEDURE FlipCross(X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L105)


<code>  PROCEDURE Focus*(): Frame;</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L116)


<code>  PROCEDURE Selected*(): Frame;</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L121)


<code>  PROCEDURE This*(x, y: INTEGER): Frame;</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L126)


<code>  PROCEDURE Mark(f: Frame; mode: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L131)


<code>  PROCEDURE Draw*(f: Frame);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L136)


<code>  PROCEDURE DrawNorm(f: Frame);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L141)


<code>  PROCEDURE Erase*(f: Frame);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L146)


<code>  PROCEDURE DrawKeyRing*(f: Frame; L: KeySafes.KeyRing);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L151)


<code>  PROCEDURE EraseKeyRing*(f: Frame; R: KeySafes.KeyRing);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L156)


<code>  PROCEDURE Change*(f: Frame; VAR msg: KeySafes.Msg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L161)


<code>  PROCEDURE FlipMark(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L166)


<code>  PROCEDURE Defocus*(f: Frame);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L172)


<code>  PROCEDURE Deselect*(f: Frame);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L182)


<code>  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L191)


<code>  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L286)


<code>  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L294)


<code>  PROCEDURE DeleteChar(f: Frame);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L304)


<code>  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L325)


<code>  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L335)


<code>  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L395)


<code>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L401)


<code>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L410)


<code>  PROCEDURE DrawLine(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L419)


<code>  PROCEDURE DrawCaption(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L441)


<code>  PROCEDURE DrawMacro(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L473)


<code>  PROCEDURE Open*(f: Frame; S: KeySafes.KeySafe);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L496)

