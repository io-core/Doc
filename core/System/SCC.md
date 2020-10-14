
## [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)

Procedures:

[](https://github.com/io-core/System/blob/main/SCC.Mod#L27) `  PROCEDURE SPICtrl(s: SET);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L32) `  PROCEDURE SPI(n: INTEGER);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L37) `  PROCEDURE StartCmd(cmd: INTEGER);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L41) `  PROCEDURE WriteReg1(reg, dat: INTEGER);  (*disables radio!*)`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L45) `  PROCEDURE SubRcv(dst: INTEGER);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L57) `  PROCEDURE SubSnd(src: INTEGER; VAR timeout: BOOLEAN);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L86) `  PROCEDURE Flush();`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L90) `  PROCEDURE ResetRcv;`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L94) `  PROCEDURE Listen(b: BOOLEAN);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L101) `  PROCEDURE Start*(filt: BOOLEAN);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L111) `  PROCEDURE SendPacket*(VAR head: Header; dat: ARRAY OF CHAR);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L133) `  PROCEDURE Available*(): INTEGER;`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L138) `  PROCEDURE Receive*(VAR x: BYTE);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L143) `  PROCEDURE Rcvd(time: INTEGER): BOOLEAN;`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L154) `  PROCEDURE ReceiveHead*(VAR head: Header);  (*actually, recv whole packet*)`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L172) `  PROCEDURE Skip*(m: INTEGER);`
[](https://github.com/io-core/System/blob/main/SCC.Mod#L177) `  PROCEDURE Stop*;`
