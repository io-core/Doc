
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

Procedures:

```
  PROCEDURE New*(R: KeyRing);
```
```
  PROCEDURE Add*(S: KeySafe; R: KeyRing);
```
```
  PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;
```
```
  PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);
```
```
  PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);
```
```
  PROCEDURE Draw*(S: KeySafe; VAR m: Msg);
```
```
  PROCEDURE List*(S: KeySafe);
```
```
  PROCEDURE Deselect*(S: KeySafe);
```
```
  PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);
```
```
  PROCEDURE Change*(S: KeySafe; VAR m: Msg);
```
```
  PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);
```
```
  PROCEDURE SetWidth*(w: INTEGER);
```
```
  PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);
```
```
  PROCEDURE Delete*(S: KeySafe);
```
```
  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));
```
