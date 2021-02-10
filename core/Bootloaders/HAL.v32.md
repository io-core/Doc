
## [MODULE HAL.v32](https://github.com/io-core/Bootloaders/blob/main/HAL.v32.Mod)
Module HAL (.v32) exercises features of the compiler in bringing Oberon up from bare metal on 32-bit RISCV.


  ## Imports:
` SYSTEM`

## Constants:
```

    stackOrg = 87FFF000H;
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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.v32.Mod#L28)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
