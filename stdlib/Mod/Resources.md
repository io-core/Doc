
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
## Variables:
```
 r,i: INTEGER; R1:Resource;
BEGIN i:=0;r:=0;
  R1:=R; WHILE R1 # NIL DO 
    IF i = x THEN r := R1.value END;
    R1:=R1.next;
    INC(i)
  END
  RETURN r 
END Get;

```
## Procedures:
---

`PROCEDURE New*(R: Resource; v: INTEGER) : Resource;` [(source)](https://github.com/io-core/Mod/blob/main/Resources.Mod#L11)


`PROCEDURE Get*(R: Resource; x: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Mod/blob/main/Resources.Mod#L21)


`PROCEDURE Clear*(R: Resource);` [(source)](https://github.com/io-core/Mod/blob/main/Resources.Mod#L32)

