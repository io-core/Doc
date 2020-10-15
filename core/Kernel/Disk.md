
## [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)

  ## Imports:
` SYSTEM`

  ## Constants:
```
 SectorLength* = 1024;
    spiData = -48; spiCtrl = -44;
    CARD0 = 1; SPIFAST = 4;
    FSoffset = 80000H; (*256MB in 512-byte blocks*)
    mapsize = 10000H; (*1K sectors, 64MB*)

```
  ## Types:
```
 Sector* = ARRAY SectorLength OF BYTE;

```
  ## Variables:
```
 NofSectors*: INTEGER;
    data: INTEGER; (*SPI data in*)
    sectorMap: ARRAY mapsize DIV 32 OF SET;
    ## Variables:
```
 i, crc: INTEGER;
  BEGIN (*send cmd*)
    REPEAT SPIIdle(1) UNTIL data = 255; (*flush while unselected*)
    REPEAT SPI(255) UNTIL data = 255; (*flush while selected*)
    IF n = 8 THEN crc := 135 ELSIF n = 0 THEN crc := 149 ELSE crc := 255 END;
    SPI(n MOD 64 + 64); (*send command*)
    FOR i := 24 TO 0 BY -8 DO SPI(ROR(arg, i)) END; (*send arg*)
    SPI(crc); i := 32;
    REPEAT SPI(255); DEC(i) UNTIL (data < 80H) OR (i = 0)
  END SPICmd;
  PROCEDURE SDShift(## Variables:
```
 n: INTEGER);
    ## Variables:
```
 data: INTEGER;
    ## Variables:
```
 data: INTEGER;
  BEGIN SPICmd(58, 0);  (*CMD58 get card capacity bit*)
    SYSTEM.GET(spiData, data); SPI(-1);
    IF (data # 0) OR ~SYSTEM.BIT(spiData, 6) THEN n := n * 512 END ;  (*non-SDHC card*)
    SPI(-1); SPI(-1); SPIIdle(1)  (*flush response*)
  END SDShift;
    ## Variables:
```
 i: INTEGER;
  BEGIN SDShift(src); SPICmd(17, src); ASSERT(data = 0); (*CMD17 read one block*)
    i := 0; (*wait for start data marker*)
    REPEAT SPI(-1); INC(i) UNTIL data = 254;
    SYSTEM.PUT(spiCtrl, SPIFAST + CARD0);
    FOR i := 0 TO 508 BY 4 DO
      SYSTEM.PUT(spiData, -1);
      REPEAT UNTIL SYSTEM.BIT(spiCtrl, 0);
      SYSTEM.GET(spiData, data); SYSTEM.PUT(dst, data); INC(dst, 4)
    END;
    SPI(255); SPI(255); SPIIdle(1) (*may be a checksum; deselect card*)
  END ReadSD;
    ## Variables:
```
 i, n: INTEGER; x: BYTE;
  BEGIN SDShift(dst); SPICmd(24, dst); ASSERT(data = 0); (*CMD24 write one block*)
    SPI(254); (*write start data marker*)
    SYSTEM.PUT(spiCtrl, SPIFAST + CARD0);
    FOR i := 0 TO 508 BY 4 DO
      SYSTEM.GET(src, n); INC(src, 4); SYSTEM.PUT(spiData, n);
      REPEAT UNTIL SYSTEM.BIT(spiCtrl, 0)
    END;
    SPI(255); SPI(255); (*dummy checksum*) i := 0;
    REPEAT SPI(-1); INC(i); UNTIL (data MOD 32 = 5) OR (i = 10000);
    ASSERT(data MOD 32 = 5); SPIIdle(1) (*deselect card*)
  END WriteSD;
    ## Variables:
```
 i: INTEGER;
  BEGIN NofSectors := 0; sectorMap[0] := {0 .. 31}; sectorMap[1] := {0 .. 31};
    FOR i := 2 TO mapsize DIV 32 - 1 DO sectorMap[i] := {} END
  END InitSecMap;
  PROCEDURE AllocSector*(hint: INTEGER; ## Variables:
```
 sec: INTEGER);
    ## Variables:
```
 s: INTEGER;
    ## Variables:
```
 s: INTEGER;
  BEGIN (*find free sector, starting after hint*)
    hint := hint DIV 29; ASSERT(SYSTEM.H(0) = 0); s := hint;
    REPEAT INC(s);
      IF s = mapsize THEN s := 1 END ;
    UNTIL ~(s MOD 32 IN sectorMap[s DIV 32]);
    INCL(sectorMap[s DIV 32], s MOD 32); INC(NofSectors); sec := s * 29
  END AllocSector;
  PROCEDURE GetSector*(src: INTEGER; ## Variables:
```
 dst: Sector);
  BEGIN src := src DIV 29; ASSERT(SYSTEM.H(0) = 0);
    src := src * 2 + FSoffset;
    ReadSD(src, SYSTEM.ADR(dst)); ReadSD(src+1, SYSTEM.ADR(dst)+512) 
  END GetSector;
  
  PROCEDURE PutSector*(dst: INTEGER; ## Variables:
```
 src: Sector);
  PROCEDURE PutSector*(dst: INTEGER; ## Variables:
```
 src: Sector);
  BEGIN dst := dst DIV 29; ASSERT(SYSTEM.H(0) =  0);
    dst := dst * 2 + FSoffset;
    WriteSD(dst, SYSTEM.ADR(src)); WriteSD(dst+1, SYSTEM.ADR(src)+512)
  END PutSector;
```
## Procedures:
---

`  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L19)


`  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L27)


`  PROCEDURE SPICmd(n, arg: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L33)


`  PROCEDURE SDShift(VAR n: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L45)


`  PROCEDURE ReadSD(src, dst: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L53)


`  PROCEDURE WriteSD(dst, src: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L67)


`  PROCEDURE InitSecMap*;` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L81)


`  PROCEDURE MarkSector*(sec: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L87)


`  PROCEDURE FreeSector*(sec: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L92)


`  PROCEDURE AllocSector*(hint: INTEGER; VAR sec: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L97)


`  PROCEDURE GetSector*(src: INTEGER; VAR dst: Sector);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L107)


`  PROCEDURE PutSector*(dst: INTEGER; VAR src: Sector);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L113)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L119)

