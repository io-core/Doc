
## [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)

Procedures:


<code>  PROCEDURE SPICtrl(s: SET);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L27)


<code>  PROCEDURE SPI(n: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L32)


<code>  PROCEDURE StartCmd(cmd: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L37)


<code>  PROCEDURE WriteReg1(reg, dat: INTEGER);  (*disables radio!*)</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L41)


<code>  PROCEDURE SubRcv(dst: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L45)


<code>  PROCEDURE SubSnd(src: INTEGER; VAR timeout: BOOLEAN);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L57)


<code>  PROCEDURE Flush();</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L86)


<code>  PROCEDURE ResetRcv;</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L90)


<code>  PROCEDURE Listen(b: BOOLEAN);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L94)


<code>  PROCEDURE Start*(filt: BOOLEAN);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L101)


<code>  PROCEDURE SendPacket*(VAR head: Header; dat: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L111)


<code>  PROCEDURE Available*(): INTEGER;</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L133)


<code>  PROCEDURE Receive*(VAR x: BYTE);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L138)


<code>  PROCEDURE Rcvd(time: INTEGER): BOOLEAN;</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L143)


<code>  PROCEDURE ReceiveHead*(VAR head: Header);  (*actually, recv whole packet*)</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L154)


<code>  PROCEDURE Skip*(m: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L172)


<code>  PROCEDURE Stop*;</code> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L177)

