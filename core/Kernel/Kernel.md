
## [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)

  ## Imports:
` SYSTEM`

  ## Constants:
```
 TrapAdr* = 04H; timer = -64;

```
  ## Types:
```
 Handler* = PROCEDURE(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;

```
  TYPE Handler* = PROCEDURE(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;

```
## Procedures:
---

`  PROCEDURE GetBlock(VAR p: LONGINT; len: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L37)


`  PROCEDURE GetBlock128(VAR p: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L56)


`  PROCEDURE GetBlock64(VAR p: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L65)


`  PROCEDURE GetBlock32(VAR p: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L74)


`  PROCEDURE New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L83)


`  PROCEDURE Mark*(pref: LONGINT);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L115)


`  PROCEDURE Collect*;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L159)


`  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L193)


`  PROCEDURE Time*(): INTEGER;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L258)


`  PROCEDURE Clock*(): INTEGER;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L263)


`  PROCEDURE SetClock*(dt: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L267)


`  PROCEDURE Install*(Padr, at: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L271)


`  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L275)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L283)

