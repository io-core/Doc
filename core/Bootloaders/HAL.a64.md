
## [MODULE HAL.a64](https://github.com/io-core/Bootloaders/blob/main/HAL.a64.Mod)
Module HAL (.a64) exercises features of the compiler in bringing Oberon up from bare metal on aarch64.


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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.a64.Mod#L25)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
