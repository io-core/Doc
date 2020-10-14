
## [MODULE KeySafeFrames](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod)

Procedures:


<pre>  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L79)


<pre>  PROCEDURE Restore*(f: Frame);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L88)


<pre>  PROCEDURE FlipCross(X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L105)


<pre>  PROCEDURE Focus*(): Frame;</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L116)


<pre>  PROCEDURE Selected*(): Frame;</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L121)


<pre>  PROCEDURE This*(x, y: INTEGER): Frame;</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L126)


<pre>  PROCEDURE Mark(f: Frame; mode: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L131)


<pre>  PROCEDURE Draw*(f: Frame);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L136)


<pre>  PROCEDURE DrawNorm(f: Frame);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L141)


<pre>  PROCEDURE Erase*(f: Frame);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L146)


<pre>  PROCEDURE DrawKeyRing*(f: Frame; L: KeySafes.KeyRing);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L151)


<pre>  PROCEDURE EraseKeyRing*(f: Frame; R: KeySafes.KeyRing);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L156)


<pre>  PROCEDURE Change*(f: Frame; VAR msg: KeySafes.Msg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L161)


<pre>  PROCEDURE FlipMark(x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L166)


<pre>  PROCEDURE Defocus*(f: Frame);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L172)


<pre>  PROCEDURE Deselect*(f: Frame);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L182)


<pre>  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L191)


<pre>  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L286)


<pre>  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L294)


<pre>  PROCEDURE DeleteChar(f: Frame);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L304)


<pre>  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L325)


<pre>  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L335)


<pre>  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L395)


<pre>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L401)


<pre>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L410)


<pre>  PROCEDURE DrawLine(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L419)


<pre>  PROCEDURE DrawCaption(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L441)


<pre>  PROCEDURE DrawMacro(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L473)


<pre>  PROCEDURE Open*(f: Frame; S: KeySafes.KeySafe);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L496)

