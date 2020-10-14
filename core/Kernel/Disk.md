
## [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)

Procedures:

```
[19](https://github.com/io-core/Kernel/blob/main/Disk.Mod#19)    PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)
```
```
[27](https://github.com/io-core/Kernel/blob/main/Disk.Mod#27)    PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)
```
```
[33](https://github.com/io-core/Kernel/blob/main/Disk.Mod#33)    PROCEDURE SPICmd(n, arg: INTEGER);
```
```
[45](https://github.com/io-core/Kernel/blob/main/Disk.Mod#45)    PROCEDURE SDShift(VAR n: INTEGER);
```
```
[53](https://github.com/io-core/Kernel/blob/main/Disk.Mod#53)    PROCEDURE ReadSD(src, dst: INTEGER);
```
```
[67](https://github.com/io-core/Kernel/blob/main/Disk.Mod#67)    PROCEDURE WriteSD(dst, src: INTEGER);
```
```
[81](https://github.com/io-core/Kernel/blob/main/Disk.Mod#81)    PROCEDURE InitSecMap*;
```
```
[87](https://github.com/io-core/Kernel/blob/main/Disk.Mod#87)    PROCEDURE MarkSector*(sec: INTEGER);
```
```
[92](https://github.com/io-core/Kernel/blob/main/Disk.Mod#92)    PROCEDURE FreeSector*(sec: INTEGER);
```
```
[97](https://github.com/io-core/Kernel/blob/main/Disk.Mod#97)    PROCEDURE AllocSector*(hint: INTEGER; VAR sec: INTEGER);
```
```
[107](https://github.com/io-core/Kernel/blob/main/Disk.Mod#107)    PROCEDURE GetSector*(src: INTEGER; VAR dst: Sector);
```
```
[113](https://github.com/io-core/Kernel/blob/main/Disk.Mod#113)    PROCEDURE PutSector*(dst: INTEGER; VAR src: Sector);
```
```
[119](https://github.com/io-core/Kernel/blob/main/Disk.Mod#119)    PROCEDURE Init*;
```
