
## [MODULE HAL.a32](https://github.com/io-core/Bootloaders/blob/main/HAL.a32.Mod)
Module HAL (.a32) exercises features of the compiler in bringing Oberon up from bare metal on 32-bit ARM..


  ## Imports:
` SYSTEM`

## Constants:
```

    stackOrg = 47FFF000H;
    MTOrg    = 40001000H;
    rsData   = 9000000H; 
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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.a32.Mod#L28)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
