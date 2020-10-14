
## [MODULE BootLoad](https://github.com/io-core/System/blob/main/BootLoad.Mod)

Procedures:


<code>  PROCEDURE RecInt(VAR x: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L19)


<code>  PROCEDURE LoadFromLine;</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L29)


<code>  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L41)


<code>  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L48)


<code>  PROCEDURE SPICmd(n, arg: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L53)


<code>  PROCEDURE InitSPI;</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L65)


<code>  PROCEDURE SDShift(VAR n: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L82)


<code>  PROCEDURE ReadSD(src, dst: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L90)


<code>  PROCEDURE LoadFromDisk;</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L104)


<code>  PROCEDURE RecInt(VAR x: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L131)


<code>  PROCEDURE Load;</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L141)


<code>  PROCEDURE* Int; (*interrupt every millisecond*)</code> [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L190)

