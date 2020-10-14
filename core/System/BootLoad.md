
## [MODULE BootLoad](https://github.com/io-core/System/blob/main/BootLoad.Mod)

Procedures:

```
  PROCEDURE RecInt(VAR x: INTEGER);
```
```
  PROCEDURE LoadFromLine;
```
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
  PROCEDURE InitSPI;
```
```
  PROCEDURE SDShift(VAR n: INTEGER);
```
```
  PROCEDURE ReadSD(src, dst: INTEGER);
```
```
  PROCEDURE LoadFromDisk;
```
```
  PROCEDURE RecInt(VAR x: INTEGER);
```
```
  PROCEDURE Load;
```
```
  PROCEDURE* Int; (*interrupt every millisecond*)
```
