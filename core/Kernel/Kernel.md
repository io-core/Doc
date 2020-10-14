
## [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)

Procedures:


<pre>  PROCEDURE GetBlock(VAR p: LONGINT; len: LONGINT);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L37)


<pre>  PROCEDURE GetBlock128(VAR p: LONGINT);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L56)


<pre>  PROCEDURE GetBlock64(VAR p: LONGINT);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L65)


<pre>  PROCEDURE GetBlock32(VAR p: LONGINT);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L74)


<pre>  PROCEDURE New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L83)


<pre>  PROCEDURE Mark*(pref: LONGINT);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L115)


<pre>  PROCEDURE Collect*;</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L159)


<pre>  PROCEDURE Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L193)


<pre>  PROCEDURE Time*(): INTEGER;</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L258)


<pre>  PROCEDURE Clock*(): INTEGER;</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L263)


<pre>  PROCEDURE SetClock*(dt: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L267)


<pre>  PROCEDURE Install*(Padr, at: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L271)


<pre>  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L275)


<pre>  PROCEDURE Init*;</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod#L283)

