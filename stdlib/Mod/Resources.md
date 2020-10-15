
## [MODULE Resources](https://github.com/io-core/Mod/blob/main/Resources.Mod)

## Imports:
` SYSTEM Kernel Oberon`

```
## Types:
```

  Resource* = POINTER TO ResourceDesc;
  ResourceDesc* = RECORD
    value*: INTEGER;
    next: Resource
  END;

PROCEDURE New*(R: Resource; v: INTEGER) : Resource;
BEGIN
  IF R = NIL THEN NEW(R) END;
  IF R # NIL THEN
    R.value := v;
    R.next := NIL
  END
  RETURN R 
END New;

PROCEDURE Get*(R: Resource; x: INTEGER): INTEGER;
```
## Procedures:
---

`PROCEDURE New*(R: Resource; v: INTEGER) : Resource;` [(source)](https://github.com/io-core/Mod/blob/main/Resources.Mod#L11)


`PROCEDURE Get*(R: Resource; x: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Mod/blob/main/Resources.Mod#L21)


`PROCEDURE Clear*(R: Resource);` [(source)](https://github.com/io-core/Mod/blob/main/Resources.Mod#L32)

