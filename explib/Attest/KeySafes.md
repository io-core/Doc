
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

Procedures:


<code>  PROCEDURE New*(R: KeyRing);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L80)


<code>  PROCEDURE Add*(S: KeySafe; R: KeyRing);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L84)


<code>  PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L89)


<code>  PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L96)


<code>  PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L101)


<code>  PROCEDURE Draw*(S: KeySafe; VAR m: Msg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L115)


<code>  PROCEDURE List*(S: KeySafe);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L122)


<code>  PROCEDURE Deselect*(S: KeySafe);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L137)


<code>  PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L143)


<code>  PROCEDURE Change*(S: KeySafe; VAR m: Msg);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L152)


<code>  PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L163)


<code>  PROCEDURE SetWidth*(w: INTEGER);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L171)


<code>  PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L176)


<code>  PROCEDURE Delete*(S: KeySafe);</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L193)


<code>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));</code> [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L212)

