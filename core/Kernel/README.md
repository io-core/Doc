## Kernel
This package  handles initial kernel load / the heap and GC / the SDcard and sectors / the timer and clock / traps.


### _Package Overview:_
The Kernel package manages:
* Loading the Oberon inner core from the SDcard or the serial line
* Heap Management, Disk Access, Timekeeping, and Trap handling
### _Package Use:_

USAGE:
```
i:=Kernel.Time();

Kernel.Install(SYSTEM.ADR(Abort), 0);

Kernel.GetSector(secno*29, buf);
```

### _Modules in this package:_

#### [MODULE Kernel](https://github.com/io-core/doc/blob/main/core/Kernel/Kernel.md) [(source)](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)
Module Kernel handles:
* Memory use by the shared Oberon heap including garbage collection
* Reading and writing to SD Card 512-byte blocks
* Allocating, Deallocating, Reading and Writing 1024-byte sectors on the SD card
* Using the sytem timer and clock
* Setting the trap handler and dispatching traps.


  **imports:** ` SYSTEM`

**Procedures:**
```
  New*(VAR ptr: LONGINT; tag: LONGINT)

  Mark*(pref: LONGINT)

  Scan*

  InitSecMap*

  MarkSector*(sec: INTEGER)

  FreeSector*(sec: INTEGER)

  AllocSector*(hint: INTEGER; VAR sec: INTEGER)

  GetSector*(src: INTEGER; VAR dst: Sector)

  PutSector*(dst: INTEGER; VAR src: Sector)

  Time*(): INTEGER

  Clock*(): INTEGER

  SetClock*(dt: INTEGER)

  Install*(Padr, at: INTEGER)

  Init*

```


#### [MODULE BootLoad](https://github.com/io-core/doc/blob/main/core/Kernel/BootLoad.md) [(source)](https://github.com/io-core/Kernel/blob/main/BootLoad.Mod)
Module BootLoad is the firmware for the RISC Oberon platform.

    ORP.Compile BootLoad.Mod ~
    ORF.WriteFile BootLoad.rsc prom.mem ~                      


  **imports:** ` SYSTEM`

**Procedures:**
```
```
