
## [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)

  ## Imports:
` SYSTEM Kernel`

## Constants:
```

    swi = -60; spiData = -48; spiCtrl = -44;
    netSelect = 1; spiFast = 2; netEnable = 3;
    HdrSize = 8; MaxPayload = 512; SubPacket = 32; Wait = 50; SendTries = 50;
    MaxPacket = (HdrSize + MaxPayload + SubPacket-1) DIV SubPacket * SubPacket;

```
## Types:
```
 Header* =
    RECORD valid*: BOOLEAN;
      dadr*, sadr*, typ*: BYTE;
      len*: INTEGER (*of data following header*)
    END ;

```
## Variables:
```

    filter*: BOOLEAN; Adr*: BYTE; rcvd: INTEGER;
    rx: RECORD
      hd: Header;
      dat: ARRAY MaxPacket-HdrSize OF BYTE
    END;

```
## Procedures:
---

`  PROCEDURE SPICtrl(s: SET);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L27)


`  PROCEDURE SPI(n: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L32)


`  PROCEDURE StartCmd(cmd: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L37)


`  PROCEDURE WriteReg1(reg, dat: INTEGER);  (*disables radio!*)` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L41)


`  PROCEDURE SubRcv(dst: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L45)


`  PROCEDURE SubSnd(src: INTEGER; VAR timeout: BOOLEAN);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L57)


`  PROCEDURE Flush();` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L86)


`  PROCEDURE ResetRcv;` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L90)


`  PROCEDURE Listen(b: BOOLEAN);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L94)


`  PROCEDURE Start*(filt: BOOLEAN);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L101)


`  PROCEDURE SendPacket*(VAR head: Header; dat: ARRAY OF CHAR);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L111)


`  PROCEDURE Available*(): INTEGER;` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L133)


`  PROCEDURE Receive*(VAR x: BYTE);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L138)


`  PROCEDURE Rcvd(time: INTEGER): BOOLEAN;` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L143)


`  PROCEDURE ReceiveHead*(VAR head: Header);  (*actually, recv whole packet*)` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L154)


`  PROCEDURE Skip*(m: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L172)


`  PROCEDURE Stop*;` [(source)](https://github.com/io-core/System/blob/main/SCC.Mod#L177)

