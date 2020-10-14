
#### [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)

Procedures:

```
  PROCEDURE SPICtrl(s: SET);
```
```
  PROCEDURE SPI(n: INTEGER);
```
```
  PROCEDURE StartCmd(cmd: INTEGER);
```
```
  PROCEDURE WriteReg1(reg, dat: INTEGER);  (*disables radio!*)
```
```
  PROCEDURE SubRcv(dst: INTEGER);
```
```
  PROCEDURE SubSnd(src: INTEGER; VAR timeout: BOOLEAN);
```
```
  PROCEDURE Flush();
```
```
  PROCEDURE ResetRcv;
```
```
  PROCEDURE Listen(b: BOOLEAN);
```
```
  PROCEDURE Start*(filt: BOOLEAN);
```
```
  PROCEDURE SendPacket*(VAR head: Header; dat: ARRAY OF CHAR);
```
```
  PROCEDURE Available*(): INTEGER;
```
```
  PROCEDURE Receive*(VAR x: BYTE);
```
```
  PROCEDURE Rcvd(time: INTEGER): BOOLEAN;
```
```
  PROCEDURE ReceiveHead*(VAR head: Header);  (*actually, recv whole packet*)
```
```
  PROCEDURE Skip*(m: INTEGER);
```
```
  PROCEDURE Stop*;
```
