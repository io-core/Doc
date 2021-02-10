
## [MODULE HAL.i64](https://github.com/io-core/Bootloaders/blob/main/HAL.i64.Mod)
Module HAL (.i64) exercises features of the compiler in bringing Oberon up from bare metal on x86_64.


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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.i64.Mod#L25)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
