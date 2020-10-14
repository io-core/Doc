
## [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)

Procedures:


<code>  PROCEDURE GetBlock(VAR p: LONGINT; len: LONGINT);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L37)


<code>  PROCEDURE GetBlock128(VAR p: LONGINT);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L56)


<code>  PROCEDURE GetBlock64(VAR p: LONGINT);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L65)


<code>  PROCEDURE GetBlock32(VAR p: LONGINT);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L74)


<code>  PROCEDURE New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L83)


<code>  PROCEDURE Mark*(pref: LONGINT);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L115)


<code>  PROCEDURE Collect*;</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L159)


<code>  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L193)


<code>  PROCEDURE Time*(): INTEGER;</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L258)


<code>  PROCEDURE Clock*(): INTEGER;</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L263)


<code>  PROCEDURE SetClock*(dt: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L267)


<code>  PROCEDURE Install*(Padr, at: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L271)


<code>  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L275)


<code>  PROCEDURE Init*;</code> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L283)

