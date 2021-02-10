
## [MODULE HAL.a32](https://github.com/io-core/Bootloaders/blob/main/HAL.a32.Mod)
The HAL prepares the Oberon runtime and so cannot rely on it.

* No global variables
* No strings
* No heap allocation

The first thing HAL must do is set up its own stack.

Each platform should have its own HAL. This is the HAL for arm32 on QEMU.

The HAL remains resident and may be used by other modules.

MODULE* HAL;
  IMPORT SYSTEM;
  
  CONST
    stackOrg = 47FFF000H;
    MTOrg    = 40001000H;
    rsData   = 9000000H; 
    rsCtrl   = -52;
    MT = 12; SP = 14; LNK = 15;   (*dedicated registers RISC5 ordinal*)

  TYPE

  VAR


  (* begin-procedure-description
---
**Init** simply returns.
  end-procedure-description *)
PROCEDURE Init( i: INTEGER);
  VAR x, y, z: INTEGER;
BEGIN
  SYSTEM.PUT(rsData,i)
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


  (* begin-procedure-description
---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
  end-procedure-description *)
BEGIN SYSTEM.LDREG(SP, stackOrg); SYSTEM.LDREG(MT, MTOrg); 
      Init(ORD("O")); Init(ORD("b")); Init(ORD("e")); Init(ORD("r")); Init(ORD("o")); Init(ORD("n"));
  WHILE TRUE DO END
END HAL.

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

`PROCEDURE Init( i: INTEGER);` [(source)](https://github.com/io-core/Bootloaders/blob/main/HAL.a32.Mod#L37)

---
**The initialzation code for this module** calls Init and then goes into an infinite loop.
