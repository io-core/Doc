
## [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)

Procedures:


<code>  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L19)


<code>  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L27)


<code>  PROCEDURE SPICmd(n, arg: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L33)


<code>  PROCEDURE SDShift(VAR n: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L45)


<code>  PROCEDURE ReadSD(src, dst: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L53)


<code>  PROCEDURE WriteSD(dst, src: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L67)


<code>  PROCEDURE InitSecMap*;</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L81)


<code>  PROCEDURE MarkSector*(sec: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L87)


<code>  PROCEDURE FreeSector*(sec: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L92)


<code>  PROCEDURE AllocSector*(hint: INTEGER; VAR sec: INTEGER);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L97)


<code>  PROCEDURE GetSector*(src: INTEGER; VAR dst: Sector);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L107)


<code>  PROCEDURE PutSector*(dst: INTEGER; VAR src: Sector);</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L113)


<code>  PROCEDURE Init*;</code> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L119)

