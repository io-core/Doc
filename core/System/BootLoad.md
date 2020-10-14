
## [MODULE BootLoad](https://github.com/io-core/System/blob/main/BootLoad.Mod)

Procedures:

[19](https://github.com/io-core/System/blob/main/BootLoad.Mod#19) `  PROCEDURE RecInt(VAR x: INTEGER);`
[29](https://github.com/io-core/System/blob/main/BootLoad.Mod#29) `  PROCEDURE LoadFromLine;`
[41](https://github.com/io-core/System/blob/main/BootLoad.Mod#41) `  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)`
[48](https://github.com/io-core/System/blob/main/BootLoad.Mod#48) `  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)`
[53](https://github.com/io-core/System/blob/main/BootLoad.Mod#53) `  PROCEDURE SPICmd(n, arg: INTEGER);`
[65](https://github.com/io-core/System/blob/main/BootLoad.Mod#65) `  PROCEDURE InitSPI;`
[82](https://github.com/io-core/System/blob/main/BootLoad.Mod#82) `  PROCEDURE SDShift(VAR n: INTEGER);`
[90](https://github.com/io-core/System/blob/main/BootLoad.Mod#90) `  PROCEDURE ReadSD(src, dst: INTEGER);`
[104](https://github.com/io-core/System/blob/main/BootLoad.Mod#104) `  PROCEDURE LoadFromDisk;`
[131](https://github.com/io-core/System/blob/main/BootLoad.Mod#131) `  PROCEDURE RecInt(VAR x: INTEGER);`
[141](https://github.com/io-core/System/blob/main/BootLoad.Mod#141) `  PROCEDURE Load;`
[190](https://github.com/io-core/System/blob/main/BootLoad.Mod#190) `  PROCEDURE* Int; (*interrupt every millisecond*)`
