## Boot
This package  Brings the Oberon Inner Core into memory and passes control to it.


### _Package Overview:_
The Bootloaders package manages:
* Loading the Oberon inner core from boot media
* Passing hardware configuration (FDT or UEFI table) to the Oberon Kernel

### _Package Use:_

Each architecture may have several specific implementations of a Hardware Abastraction Layer.  For example:

* HAL.a64.qemu.Mod allows Oberon to boot on aarch64 emulated in QEMU
* HAL.a64.rpi4.Mod does the same on the 64-bit Raspberry Pi and
* HAL.v32.qemu.Mod boots Oberon on riscv32 emulated in QEMU while
* HAL.v32.bl602.Mod does the same on the BL602 IOT riscv device.

Each compilation or cross-compilation of Oberon will import only one of the HAL modules, referred to as 'HAL'.

The Bootloaders package also contains shell scripts used outside of Oberon to prepare an Oberon UEFI or raw binary image.

See https://github.com/io/Bootloaders for usage.


### _Modules in this package:_

#### [MODULE BootLoad](https://github.com/io-core/doc/blob/main/core/Boot/BootLoad.md) [(source)](https://github.com/io-core/Boot/blob/main/BootLoad.Mod)
Module BootLoad is the firmware for the RISC Oberon platform.

    ORP.Compile BootLoad.Mod ~
    ORF.WriteFile BootLoad.rsc prom.mem ~                      


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.rsc.qemu](https://github.com/io-core/doc/blob/main/core/Boot/HAL.rsc.qemu.md) [(source)](https://github.com/io-core/Boot/blob/main/HAL.rsc.qemu.Mod)
Module HAL (.rsc) exercises features of the compiler in bringing Oberon up from bare metal on RISC5.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.a32.qemu](https://github.com/io-core/doc/blob/main/core/Boot/HAL.a32.qemu.md) [(source)](https://github.com/io-core/Boot/blob/main/HAL.a32.qemu.Mod)
Module HAL (.a32) exercises features of the compiler in bringing Oberon up from bare metal on 32-bit ARM.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.a64.qemu](https://github.com/io-core/doc/blob/main/core/Boot/HAL.a64.qemu.md) [(source)](https://github.com/io-core/Boot/blob/main/HAL.a64.qemu.Mod)
Module HAL (.a64) exercises features of the compiler in bringing Oberon up from bare metal on aarch64.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.i64.qemu](https://github.com/io-core/doc/blob/main/core/Boot/HAL.i64.qemu.md) [(source)](https://github.com/io-core/Boot/blob/main/HAL.i64.qemu.Mod)
Module HAL (.i64) exercises features of the compiler in bringing Oberon up from bare metal on x86_64.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.v32.qemu](https://github.com/io-core/doc/blob/main/core/Boot/HAL.v32.qemu.md) [(source)](https://github.com/io-core/Boot/blob/main/HAL.v32.qemu.Mod)
Module HAL (.v32) exercises features of the compiler in bringing Oberon up from bare metal on 32-bit RISCV.


  **imports:** ` SYSTEM`

**Procedures:**
```
```


#### [MODULE HAL.v64.qemu](https://github.com/io-core/doc/blob/main/core/Boot/HAL.v64.qemu.md) [(source)](https://github.com/io-core/Boot/blob/main/HAL.v64.qemu.Mod)
Module HAL (.v64)  exercises features of the compiler in bringing Oberon up from bare metal on 64-bit RISCV.


  **imports:** ` SYSTEM`

**Procedures:**
```
```
