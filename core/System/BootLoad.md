
## [MODULE BootLoad](https://github.com/io-core/System/blob/main/BootLoad.Mod)

Procedures:


<pre>  PROCEDURE RecInt(VAR x: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L19)


<pre>  PROCEDURE LoadFromLine;</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L29)


<pre>  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L41)


<pre>  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L48)


<pre>  PROCEDURE SPICmd(n, arg: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L53)


<pre>  PROCEDURE InitSPI;</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L65)


<pre>  PROCEDURE SDShift(VAR n: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L82)


<pre>  PROCEDURE ReadSD(src, dst: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L90)


<pre>  PROCEDURE LoadFromDisk;</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L104)


<pre>  PROCEDURE RecInt(VAR x: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L131)


<pre>  PROCEDURE Load;</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L141)


<pre>  PROCEDURE* Int; (*interrupt every millisecond*)</pre> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L190)

