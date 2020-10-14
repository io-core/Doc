
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

Procedures:


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L80) `  PROCEDURE New*(R: KeyRing);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L84) `  PROCEDURE Add*(S: KeySafe; R: KeyRing);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L89) `  PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L96) `  PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L101) `  PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L115) `  PROCEDURE Draw*(S: KeySafe; VAR m: Msg);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L122) `  PROCEDURE List*(S: KeySafe);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L137) `  PROCEDURE Deselect*(S: KeySafe);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L143) `  PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L152) `  PROCEDURE Change*(S: KeySafe; VAR m: Msg);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L163) `  PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L171) `  PROCEDURE SetWidth*(w: INTEGER);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L176) `  PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L193) `  PROCEDURE Delete*(S: KeySafe);`


[(src)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L212) `  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));`

