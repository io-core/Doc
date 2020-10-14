
## [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)

Procedures:


<pre>  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L19)


<pre>  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L27)


<pre>  PROCEDURE SPICmd(n, arg: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L33)


<pre>  PROCEDURE SDShift(VAR n: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L45)


<pre>  PROCEDURE ReadSD(src, dst: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L53)


<pre>  PROCEDURE WriteSD(dst, src: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L67)


<pre>  PROCEDURE InitSecMap*;</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L81)


<pre>  PROCEDURE MarkSector*(sec: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L87)


<pre>  PROCEDURE FreeSector*(sec: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L92)


<pre>  PROCEDURE AllocSector*(hint: INTEGER; VAR sec: INTEGER);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L97)


<pre>  PROCEDURE GetSector*(src: INTEGER; VAR dst: Sector);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L107)


<pre>  PROCEDURE PutSector*(dst: INTEGER; VAR src: Sector);</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L113)


<pre>  PROCEDURE Init*;</pre> [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L119)

