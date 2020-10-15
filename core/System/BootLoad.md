
## [MODULE BootLoad](https://github.com/io-core/System/blob/main/BootLoad.Mod)

  ## imports
 SYSTEM
  ## imports
 SYSTEM
  ## imports
 SYSTEM
## Procedures
---

`  PROCEDURE RecInt(VAR x: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L19)


`  PROCEDURE LoadFromLine;` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L29)


`  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L41)


`  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L48)


`  PROCEDURE SPICmd(n, arg: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L53)


`  PROCEDURE InitSPI;` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L65)


`  PROCEDURE SDShift(VAR n: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L82)


`  PROCEDURE ReadSD(src, dst: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L90)


`  PROCEDURE LoadFromDisk;` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L104)


`  PROCEDURE RecInt(VAR x: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L131)


`  PROCEDURE Load;` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L141)


`  PROCEDURE* Int; (*interrupt every millisecond*)` [(source)](https://github.com/io-core/System/blob/main/BootLoad.Mod#L190)

