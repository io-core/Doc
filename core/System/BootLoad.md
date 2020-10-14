
## [MODULE BootLoad](https://github.com/io-core/System/blob/main/BootLoad.Mod)

Procedures:

[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L19) `  PROCEDURE RecInt(VAR x: INTEGER);`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L29) `  PROCEDURE LoadFromLine;`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L41) `  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L48) `  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L53) `  PROCEDURE SPICmd(n, arg: INTEGER);`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L65) `  PROCEDURE InitSPI;`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L82) `  PROCEDURE SDShift(VAR n: INTEGER);`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L90) `  PROCEDURE ReadSD(src, dst: INTEGER);`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L104) `  PROCEDURE LoadFromDisk;`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L131) `  PROCEDURE RecInt(VAR x: INTEGER);`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L141) `  PROCEDURE Load;`
[](https://github.com/io-core/System/blob/main/BootLoad.Mod#L190) `  PROCEDURE* Int; (*interrupt every millisecond*)`
