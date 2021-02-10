
## [MODULE HAL.rsc](https://github.com/io-core/Bootloaders/blob/main/HAL.rsc.Mod)
Module HAL (.rsc) exercises features of the compiler in bringing Oberon up from bare metal on RISC5.


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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.rsc.Mod#L25)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
