
## [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)

Procedures:

```
  PROCEDURE GetBlock(VAR p: LONGINT; len: LONGINT);
```
```
  PROCEDURE GetBlock128(VAR p: LONGINT);
```
```
  PROCEDURE GetBlock64(VAR p: LONGINT);
```
```
  PROCEDURE GetBlock32(VAR p: LONGINT);
```
```
  PROCEDURE New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT);
```
```
  PROCEDURE Mark*(pref: LONGINT);
```
```
  PROCEDURE Collect*;
```
```
  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER);
```
```
  PROCEDURE Time*(): INTEGER;
```
```
  PROCEDURE Clock*(): INTEGER;
```
```
  PROCEDURE SetClock*(dt: INTEGER);
```
```
  PROCEDURE Install*(Padr, at: INTEGER);
```
```
  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);
```
```
  PROCEDURE Init*;
```
