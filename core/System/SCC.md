
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
    ## Variables:
```
 i, dat: INTEGER;
  BEGIN
    StartCmd(061H); (*R_RX_PAYLOAD, disables radio*)
    SPICtrl({netSelect, spiFast});
    FOR i := 0 TO SubPacket-4 BY 4 DO
      SPI(-1); SYSTEM.GET(spiData, dat); SYSTEM.PUT(dst+i, dat)
    END;
    SPICtrl({}); WriteReg1(7, 40H); (*done; STATUS <= clear RX_DR*)
    SPICtrl({netEnable}) (*enable radio*)
  END SubRcv;
  PROCEDURE SubSnd(src: INTEGER; ## Variables:
```
 timeout: BOOLEAN);
    ## Variables:
```
 i, dat, res, t1, try: INTEGER; x, status: BYTE;
    ## Variables:
```
 i, dat, res, t1, try: INTEGER; x, status: BYTE;
  BEGIN (*already in xmit mode*)
    StartCmd(0A0H); (*W_TX_PAYLOAD*)
    SPICtrl({netSelect, spiFast});
    FOR i := 0 TO SubPacket-4 BY 4 DO
      SYSTEM.GET(src+i, dat); SPI(dat)
    END;
    SPICtrl({}); (*end W_TX_PAYLOAD command*)
    try := 0;
    SPICtrl({netEnable, netSelect}); (*start xmit pulse, start NOP cmd*)
    REPEAT
      t1 := Kernel.Time() + Wait;
      REPEAT (*wait for sent or retransmits exceeded*);
        SPI(0FFH); SYSTEM.GET(spiData, status); (*NOP*)
        res := status DIV 10H MOD 4;
        SPICtrl({}); SPICtrl({netSelect}) (*end & restart NOP cmd, end =10us pulse on enable*)
      UNTIL res # 0;
      IF res = 2 THEN WriteReg1(7, 20H) (*TX_DS: sent, ack received; reset it*)
      ELSIF res = 1 THEN WriteReg1(7, 10H); INC(try); (*MAX_RT: retransmits exceeded; reset it*)
        IF try = SendTries THEN res := 0
        ELSE REPEAT UNTIL Kernel.Time() >= t1;
          SPICtrl({netEnable, netSelect}); (*start xmit pulse, start NOP cmd again*)
        END
      END
    UNTIL res # 1;
    timeout := (res # 2)
  END SubSnd;
    ## Variables:
```
 n: INTEGER;
  BEGIN filter := filt; Adr := 0;
    SYSTEM.GET(swi, n); n := n DIV 4 MOD 10H * 10 + 5;
    WriteReg1(5, n); (*RF_CH <= channel: 5, 15, 25...*)
    WriteReg1(6, 07H); (*RF_SETUP <= 1Mb for better range, 0dBm*)
    WriteReg1(11H, SubPacket); (*RX_PW_P0 <= pipe 0 payload width*)
    Flush(); Listen(TRUE); ResetRcv
  END Start;
  PROCEDURE SendPacket*(## Variables:
```
 head: Header; dat: ARRAY OF CHAR);
    ## Variables:
```
 len, i, off: INTEGER; timeout: BOOLEAN; payload: ARRAY SubPacket OF CHAR;
    ## Variables:
```
 len, i, off: INTEGER; timeout: BOOLEAN; payload: ARRAY SubPacket OF CHAR;
  BEGIN (*let any receive ack finish before turning radio off*)
    i := Kernel.Time() + Wait;
    REPEAT SPICtrl({netEnable, netSelect}); SPI(0FFH); SPICtrl({netEnable}) (*NOP*)
    UNTIL Kernel.Time() >= i;
    IF Adr = 0 THEN Adr := i MOD 100H END;
    Listen(FALSE);
    head.sadr := Adr; head.valid := TRUE;
    SYSTEM.COPY(SYSTEM.ADR(head), SYSTEM.ADR(payload), HdrSize DIV 4);
    i := HdrSize; off := 0; len := head.len;
    WHILE (len > 0) & (i < SubPacket) DO payload[i] := dat[off]; INC(i); INC(off); DEC(len) END;
    WHILE i < SubPacket DO payload[i] := 0X; INC(i) END;
    SubSnd(SYSTEM.ADR(payload), timeout);
    WHILE ~timeout & (len # 0) DO i := 0; (*send the rest*)
      WHILE (len > 0) & (i < SubPacket) DO payload[i] := dat[off]; INC(i); INC(off); DEC(len) END;
      WHILE i < SubPacket DO payload[i] := 0X; INC(i) END;
      SubSnd(SYSTEM.ADR(payload), timeout)
    END;
    Listen(TRUE)
  END SendPacket;
  PROCEDURE Receive*(## Variables:
```
 x: BYTE);
  BEGIN (*packet already rcvd*)
    IF rcvd < rx.hd.len THEN x := rx.dat[rcvd]; INC(rcvd) ELSE x := 0 END
  END Receive;
    ## Variables:
```
 status, fifoStatus: BYTE; rcvd: BOOLEAN;
  BEGIN time := time + Kernel.Time();
    REPEAT
      SPICtrl({netEnable, netSelect}); SPI(17H); (*R_REGISTER FIFO_STATUS*)
      SYSTEM.GET(spiData, status); SPI(-1); SYSTEM.GET(spiData, fifoStatus); SPICtrl({netEnable});
      rcvd := ODD(status DIV 40H) OR ~ODD(fifoStatus) (*RX_DR (data ready) or RX FIFO not empty*)
    UNTIL rcvd OR (Kernel.Time() >= time);
    RETURN rcvd
  END Rcvd;
  PROCEDURE ReceiveHead*(## Variables:
```
 head: Header);  (*actually, recv whole packet*)
    ## Variables:
```
 adr, n: INTEGER;
    ## Variables:
```
 adr, n: INTEGER;
  BEGIN head.valid := FALSE;
    IF Rcvd(0) THEN
      ResetRcv; adr := SYSTEM.ADR(rx); SubRcv(adr);
      n := (rx.hd.len + HdrSize - 1) DIV SubPacket;
      IF (rx.hd.len <= MaxPayload)
          & ((rx.hd.dadr = 0FFH) OR ~filter OR (Adr = 0) OR (rx.hd.dadr = Adr)) THEN
        WHILE (n > 0) & Rcvd(Wait) DO
          INC(adr, SubPacket); SubRcv(adr); DEC(n)
        END;
        rx.hd.valid := (n = 0)
      ELSE WHILE Rcvd(Wait) DO SubRcv(adr) END; ResetRcv  (*discard packet*)
      END;
      head := rx.hd
    END
  END ReceiveHead;
    ## Variables:
```
 dmy: BYTE;
  BEGIN WHILE m # 0 DO Receive(dmy); DEC(m) END
  END Skip;
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

