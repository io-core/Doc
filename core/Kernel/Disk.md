
## [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)

Procedures:

[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L19) `  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L27) `  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L33) `  PROCEDURE SPICmd(n, arg: INTEGER);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L45) `  PROCEDURE SDShift(VAR n: INTEGER);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L53) `  PROCEDURE ReadSD(src, dst: INTEGER);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L67) `  PROCEDURE WriteSD(dst, src: INTEGER);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L81) `  PROCEDURE InitSecMap*;`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L87) `  PROCEDURE MarkSector*(sec: INTEGER);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L92) `  PROCEDURE FreeSector*(sec: INTEGER);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L97) `  PROCEDURE AllocSector*(hint: INTEGER; VAR sec: INTEGER);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L107) `  PROCEDURE GetSector*(src: INTEGER; VAR dst: Sector);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L113) `  PROCEDURE PutSector*(dst: INTEGER; VAR src: Sector);`
[](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L119) `  PROCEDURE Init*;`
