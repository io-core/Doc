## Bootloaders
This package  Brings the Oberon Inner Core into memory and passes control to it.


### _Package Overview:_
The Bootloaders package manages:
* Loading the Oberon inner core from boot media
* Passing hardware configuration (FDT or UEFI table) to the Oberon Kernel

### _Package Use:_

The Bootloaders package contains shell scripts used outside of Oberon to prepare an Oberon UEFI or raw binary image.

See https://github.com/io/Bootloaders for usage.


### _Modules in this package:_

#### [MODULE BootLoad](https://github.com/io-core/doc/blob/main/core/Bootloaders/BootLoad.md) [(source)](https://github.com/io-core/Bootloaders/blob/main/BootLoad.Mod)
Module BootLoad is the firmware for the RISC Oberon platform.

    ORP.Compile BootLoad.Mod ~
    ORF.WriteFile BootLoad.rsc prom.mem ~                      


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.rsc](https://github.com/io-core/doc/blob/main/core/Bootloaders/HAL.rsc.md) [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.rsc.Mod)
Module HAL (.rsc) exercises features of the compiler in bringing Oberon up from bare metal on RISC5.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.a32](https://github.com/io-core/doc/blob/main/core/Bootloaders/HAL.a32.md) [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.a32.Mod)
Module HAL (.a32) exercises features of the compiler in bringing Oberon up from bare metal on 32-bit ARM.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.a64](https://github.com/io-core/doc/blob/main/core/Bootloaders/HAL.a64.md) [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.a64.Mod)
Module HAL (.a64) exercises features of the compiler in bringing Oberon up from bare metal on aarch64.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.i64](https://github.com/io-core/doc/blob/main/core/Bootloaders/HAL.i64.md) [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.i64.Mod)
Module HAL (.i64) exercises features of the compiler in bringing Oberon up from bare metal on x86_64.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.v32](https://github.com/io-core/doc/blob/main/core/Bootloaders/HAL.v32.md) [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.v32.Mod)
Module HAL (.v32) exercises features of the compiler in bringing Oberon up from bare metal on 32-bit RISCV.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.v64](https://github.com/io-core/doc/blob/main/core/Bootloaders/HAL.v64.md) [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.v64.Mod)
Module HAL (.v64)  exercises features of the compiler in bringing Oberon up from bare metal on 64-bit RISCV.


  **imports:** ` SYSTEM`

**Procedures:**
```
```
