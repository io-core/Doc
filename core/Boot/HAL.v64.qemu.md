
## [MODULE HAL.v64.qemu](https://github.com/io-core/Boot/blob/main/HAL.v64.qemu.Mod)
The HAL prepares the Oberon runtime and so cannot rely on it.

* No global variables
* No strings
* No heap allocation

The first thing HAL must do is set up its own stack.

Each platform should have its own HAL. This is the HAL for riscv64 on QEMU.

The HAL remains resident and may be used by other modules.


  ## Imports:
` SYSTEM`

## Constants:
```

    stackOrg = 0BFFFF000H;
    MTOrg    = 80001000H;
    rsData   = 10000000H; 
    rsCtrl   = -52;
    MT = 12; SP = 14; LNK = 15;   (*dedicated registers RISC5 ordinal*)

```
## Types:
```


```
## Variables:
```


```
## Procedures:
---
---
**Greet** Transmits a greeting on the serial port.

`PROCEDURE Greet;` [(source)](https://github.com/io-core/Boot/blob/main/HAL.v64.qemu.Mod#L37)

---
**Init** queries the system configuration, establishes the module store and the heap, and passes control to the Kernel.

`PROCEDURE Init;` [(source)](https://github.com/io-core/Boot/blob/main/HAL.v64.qemu.Mod#L55)

---
**The initialzation code for this module** establishes the stack and module table origin, transmits a greeting, and then calls Init.
