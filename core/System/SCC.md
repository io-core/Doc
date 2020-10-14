
## [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)

Procedures:

[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L27) `  PROCEDURE SPICtrl(s: SET);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L32) `  PROCEDURE SPI(n: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L37) `  PROCEDURE StartCmd(cmd: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L41) `  PROCEDURE WriteReg1(reg, dat: INTEGER);  (*disables radio!*)`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L45) `  PROCEDURE SubRcv(dst: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L57) `  PROCEDURE SubSnd(src: INTEGER; VAR timeout: BOOLEAN);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L86) `  PROCEDURE Flush();`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L90) `  PROCEDURE ResetRcv;`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L94) `  PROCEDURE Listen(b: BOOLEAN);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L101) `  PROCEDURE Start*(filt: BOOLEAN);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L111) `  PROCEDURE SendPacket*(VAR head: Header; dat: ARRAY OF CHAR);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L133) `  PROCEDURE Available*(): INTEGER;`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L138) `  PROCEDURE Receive*(VAR x: BYTE);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L143) `  PROCEDURE Rcvd(time: INTEGER): BOOLEAN;`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L154) `  PROCEDURE ReceiveHead*(VAR head: Header);  (*actually, recv whole packet*)`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L172) `  PROCEDURE Skip*(m: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/SCC.Mod#L177) `  PROCEDURE Stop*;`
