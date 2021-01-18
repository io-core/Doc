
## [MODULE HAL.a64](https://github.com/io-core/Bootloaders/blob/main/HAL.a64.Mod)
Module HAL (.a64) exercises features of the compiler in bringing Oberon up from bare metal on aarch64.


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

`PROCEDURE Init;` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.a64.Mod#L16)

