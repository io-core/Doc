
## [MODULE HAL.v32](https://github.com/io-core/Bootloaders/blob/main/HAL.v32.Mod)
Module HAL (.v32) exercises features of the compiler in bringing Oberon up from bare metal on 32-bit RISCV.


## Constants:
```


```
## Types:
```



PROCEDURE Init;
```
## Variables:
```
 x, y, z: INTEGER;
BEGIN
(*
  LED(1); z := 0;
  REPEAT LED(z); x := 1000;
     REPEAT y := 1000;
       REPEAT y := y-1 UNTIL y = 0;
       x := x-1
     UNTIL x = 0;
     z := z+1
  UNTIL FALSE
*)
END Init;

```
## Procedures:
---

`PROCEDURE Init;` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.v32.Mod#L16)

