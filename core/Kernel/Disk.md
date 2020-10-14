
## [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)

Procedures:

```
  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)
```
```
  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)
```
```
  PROCEDURE SPICmd(n, arg: INTEGER);
```
```
  PROCEDURE SDShift(VAR n: INTEGER);
```
```
  PROCEDURE ReadSD(src, dst: INTEGER);
```
```
  PROCEDURE WriteSD(dst, src: INTEGER);
```
```
  PROCEDURE InitSecMap*;
```
```
  PROCEDURE MarkSector*(sec: INTEGER);
```
```
  PROCEDURE FreeSector*(sec: INTEGER);
```
```
  PROCEDURE AllocSector*(hint: INTEGER; VAR sec: INTEGER);
```
```
  PROCEDURE GetSector*(src: INTEGER; VAR dst: Sector);
```
```
  PROCEDURE PutSector*(dst: INTEGER; VAR src: Sector);
```
```
  PROCEDURE Init*;
```
