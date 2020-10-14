
## [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)

Procedures:


[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L37) `  PROCEDURE GetBlock(VAR p: LONGINT; len: LONGINT);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L56) `  PROCEDURE GetBlock128(VAR p: LONGINT);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L65) `  PROCEDURE GetBlock64(VAR p: LONGINT);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L74) `  PROCEDURE GetBlock32(VAR p: LONGINT);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L83) `  PROCEDURE New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L115) `  PROCEDURE Mark*(pref: LONGINT);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L159) `  PROCEDURE Collect*;`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L193) `  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L258) `  PROCEDURE Time*(): INTEGER;`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L263) `  PROCEDURE Clock*(): INTEGER;`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L267) `  PROCEDURE SetClock*(dt: INTEGER);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L271) `  PROCEDURE Install*(Padr, at: INTEGER);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L275) `  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);`

[(src)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L283) `  PROCEDURE Init*;`
