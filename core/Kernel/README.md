## Kernel
This package handles basic os functionality including device access and garbage collection.


## Overview
The Kernel package abstracts the hardware of the computing platform for the rest of Oberon.

The current Kernel package contains two modules:
* Kernel - core abstractions
* Disk - a device driver for SPI flash storage

## Examples

USAGE:
```
Kernel.Collect 
```

## Modules

#### [MODULE Kernel](https://github.com/io-core/doc/blob/main/core/Kernel/Kernel.md) [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)
Module Kernel provides hardware abstraction for Oberon.


  **imports:** ` SYSTEM`

**Procedures:**
```
  New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT)

  Mark*(pref: LONGINT)

  Collect*

  Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER)

  Time*(): INTEGER

  Clock*(): INTEGER

  SetClock*(dt: INTEGER)

  Install*(Padr, at: INTEGER)

  Init*

```


#### [MODULE Disk](https://github.com/io-core/doc/blob/main/core/Kernel/Disk.md) [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod)
Module Disk interfaces to the SPI flash storage, presenting 1024 byte sectors from two 512-byte sectors


  **imports:** ` SYSTEM`

**Procedures:**
```
  InitSecMap*

  MarkSector*(sec: INTEGER)

  FreeSector*(sec: INTEGER)

  AllocSector*(hint: INTEGER; VAR sec: INTEGER)

  GetSector*(src: INTEGER; VAR dst: Sector)

  PutSector*(dst: INTEGER; VAR src: Sector)

  Init*

```
