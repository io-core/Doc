
## [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)

Procedures:


<pre>  PROCEDURE SPICtrl(s: SET);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L27)


<pre>  PROCEDURE SPI(n: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L32)


<pre>  PROCEDURE StartCmd(cmd: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L37)


<pre>  PROCEDURE WriteReg1(reg, dat: INTEGER);  (*disables radio!*)</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L41)


<pre>  PROCEDURE SubRcv(dst: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L45)


<pre>  PROCEDURE SubSnd(src: INTEGER; VAR timeout: BOOLEAN);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L57)


<pre>  PROCEDURE Flush();</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L86)


<pre>  PROCEDURE ResetRcv;</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L90)


<pre>  PROCEDURE Listen(b: BOOLEAN);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L94)


<pre>  PROCEDURE Start*(filt: BOOLEAN);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L101)


<pre>  PROCEDURE SendPacket*(VAR head: Header; dat: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L111)


<pre>  PROCEDURE Available*(): INTEGER;</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L133)


<pre>  PROCEDURE Receive*(VAR x: BYTE);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L138)


<pre>  PROCEDURE Rcvd(time: INTEGER): BOOLEAN;</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L143)


<pre>  PROCEDURE ReceiveHead*(VAR head: Header);  (*actually, recv whole packet*)</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L154)


<pre>  PROCEDURE Skip*(m: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L172)


<pre>  PROCEDURE Stop*;</pre> [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L177)

