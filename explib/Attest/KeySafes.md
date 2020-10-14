
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

Procedures:


<pre>  PROCEDURE New*(R: KeyRing);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L80)


<pre>  PROCEDURE Add*(S: KeySafe; R: KeyRing);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L84)


<pre>  PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L89)


<pre>  PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L96)


<pre>  PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L101)


<pre>  PROCEDURE Draw*(S: KeySafe; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L115)


<pre>  PROCEDURE List*(S: KeySafe);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L122)


<pre>  PROCEDURE Deselect*(S: KeySafe);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L137)


<pre>  PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L143)


<pre>  PROCEDURE Change*(S: KeySafe; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L152)


<pre>  PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L163)


<pre>  PROCEDURE SetWidth*(w: INTEGER);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L171)


<pre>  PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L176)


<pre>  PROCEDURE Delete*(S: KeySafe);</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L193)


<pre>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));</pre> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L212)

