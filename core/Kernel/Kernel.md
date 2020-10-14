
## [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)

Procedures:

[37](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#37) `  PROCEDURE GetBlock(VAR p: LONGINT; len: LONGINT);`
[56](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#56) `  PROCEDURE GetBlock128(VAR p: LONGINT);`
[65](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#65) `  PROCEDURE GetBlock64(VAR p: LONGINT);`
[74](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#74) `  PROCEDURE GetBlock32(VAR p: LONGINT);`
[83](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#83) `  PROCEDURE New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT);`
[115](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#115) `  PROCEDURE Mark*(pref: LONGINT);`
[159](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#159) `  PROCEDURE Collect*;`
[193](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#193) `  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER);`
[258](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#258) `  PROCEDURE Time*(): INTEGER;`
[263](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#263) `  PROCEDURE Clock*(): INTEGER;`
[267](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#267) `  PROCEDURE SetClock*(dt: INTEGER);`
[271](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#271) `  PROCEDURE Install*(Padr, at: INTEGER);`
[275](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#275) `  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);`
[283](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#283) `  PROCEDURE Init*;`
