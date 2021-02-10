
## [MODULE HAL.v64.qemu](https://github.com/io-core/Bootloaders/blob/main/HAL.v64.qemu.Mod)
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
**Init** simply returns.

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.v64.qemu.Mod#L38)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
