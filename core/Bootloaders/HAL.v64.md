
## [MODULE HAL.v64](https://github.com/io-core/Bootloaders/blob/main/HAL.v64.Mod)
Module HAL (.v64)  exercises features of the compiler in bringing Oberon up from bare metal on 64-bit RISCV.


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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.v64.Mod#L28)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
