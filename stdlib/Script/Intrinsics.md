
## [MODULE Intrinsics](https://github.com/io-core/Script/blob/main/Intrinsics.Mod)

## Imports:
` SYSTEM Kernel Oberon`

```
## Types:
```

  Intrinsic* = POINTER TO IntrinsicDesc;
  IntrinsicDesc* = RECORD
    value*: INTEGER;
    next: Intrinsic
  END;

PROCEDURE New*(i: Intrinsic; v: INTEGER) : Intrinsic;
BEGIN
  IF i = NIL THEN NEW(i) END;
  IF i # NIL THEN
    i.value := v;
    i.next := NIL
  END
  RETURN i 
END New;


PROCEDURE Clear*(i: Intrinsic);
BEGIN
  i.value:=0;
  i.next:=NIL
END Clear;

BEGIN
END Intrinsics.
```
## Procedures:
---

`PROCEDURE New*(i: Intrinsic; v: INTEGER) : Intrinsic;` [(source)](https://github.com/io-core/Script/blob/main/Intrinsics.Mod#L15)


`PROCEDURE Clear*(i: Intrinsic);` [(source)](https://github.com/io-core/Script/blob/main/Intrinsics.Mod#L26)

