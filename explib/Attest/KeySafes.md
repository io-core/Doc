
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

  **imports** SYSTEM Files Fonts KeyPairs
## Procedures
---

`  PROCEDURE New*(R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L80)


`  PROCEDURE Add*(S: KeySafe; R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L84)


`  PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L89)


`  PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L96)


`  PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L101)


`  PROCEDURE Draw*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L115)


`  PROCEDURE List*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L122)


`  PROCEDURE Deselect*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L137)


`  PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L143)


`  PROCEDURE Change*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L152)


`  PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L163)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L171)


`  PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L176)


`  PROCEDURE Delete*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L193)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L212)

