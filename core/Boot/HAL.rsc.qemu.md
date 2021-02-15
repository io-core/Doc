
## [MODULE HAL.rsc.qemu](https://github.com/io-core/Boot/blob/main/HAL.rsc.qemu.Mod)
The HAL prepares the Oberon runtime and so cannot rely on it.

* No global variables
* No strings
* No heap allocation

The first thing HAL must do is set up its own stack.

Each platform should have its own HAL. This is the HAL for riscv32 on QEMU.

The HAL remains resident and may be used by other modules.


  ## Imports:
` SYSTEM`

## Constants:
```

    rsData = -56; 
    rsCtrl = -52;

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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Boot/blob/main/HAL.rsc.qemu.Mod#L35)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
