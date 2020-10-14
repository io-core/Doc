
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

Procedures:

```
[80](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#80)    PROCEDURE New*(R: KeyRing);
```
```
[84](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#84)    PROCEDURE Add*(S: KeySafe; R: KeyRing);
```
```
[89](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#89)    PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;
```
```
[96](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#96)    PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);
```
```
[101](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#101)    PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);
```
```
[115](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#115)    PROCEDURE Draw*(S: KeySafe; VAR m: Msg);
```
```
[122](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#122)    PROCEDURE List*(S: KeySafe);
```
```
[137](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#137)    PROCEDURE Deselect*(S: KeySafe);
```
```
[143](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#143)    PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);
```
```
[152](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#152)    PROCEDURE Change*(S: KeySafe; VAR m: Msg);
```
```
[163](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#163)    PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);
```
```
[171](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#171)    PROCEDURE SetWidth*(w: INTEGER);
```
```
[176](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#176)    PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);
```
```
[193](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#193)    PROCEDURE Delete*(S: KeySafe);
```
```
[212](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#212)    PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));
```
