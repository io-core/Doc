
## [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)

Procedures:

[27](https://github.com/io-core/System/blob/main/SCC.Mod#27) `  PROCEDURE SPICtrl(s: SET);`
[32](https://github.com/io-core/System/blob/main/SCC.Mod#32) `  PROCEDURE SPI(n: INTEGER);`
[37](https://github.com/io-core/System/blob/main/SCC.Mod#37) `  PROCEDURE StartCmd(cmd: INTEGER);`
[41](https://github.com/io-core/System/blob/main/SCC.Mod#41) `  PROCEDURE WriteReg1(reg, dat: INTEGER);  (*disables radio!*)`
[45](https://github.com/io-core/System/blob/main/SCC.Mod#45) `  PROCEDURE SubRcv(dst: INTEGER);`
[57](https://github.com/io-core/System/blob/main/SCC.Mod#57) `  PROCEDURE SubSnd(src: INTEGER; VAR timeout: BOOLEAN);`
[86](https://github.com/io-core/System/blob/main/SCC.Mod#86) `  PROCEDURE Flush();`
[90](https://github.com/io-core/System/blob/main/SCC.Mod#90) `  PROCEDURE ResetRcv;`
[94](https://github.com/io-core/System/blob/main/SCC.Mod#94) `  PROCEDURE Listen(b: BOOLEAN);`
[101](https://github.com/io-core/System/blob/main/SCC.Mod#101) `  PROCEDURE Start*(filt: BOOLEAN);`
[111](https://github.com/io-core/System/blob/main/SCC.Mod#111) `  PROCEDURE SendPacket*(VAR head: Header; dat: ARRAY OF CHAR);`
[133](https://github.com/io-core/System/blob/main/SCC.Mod#133) `  PROCEDURE Available*(): INTEGER;`
[138](https://github.com/io-core/System/blob/main/SCC.Mod#138) `  PROCEDURE Receive*(VAR x: BYTE);`
[143](https://github.com/io-core/System/blob/main/SCC.Mod#143) `  PROCEDURE Rcvd(time: INTEGER): BOOLEAN;`
[154](https://github.com/io-core/System/blob/main/SCC.Mod#154) `  PROCEDURE ReceiveHead*(VAR head: Header);  (*actually, recv whole packet*)`
[172](https://github.com/io-core/System/blob/main/SCC.Mod#172) `  PROCEDURE Skip*(m: INTEGER);`
[177](https://github.com/io-core/System/blob/main/SCC.Mod#177) `  PROCEDURE Stop*;`
