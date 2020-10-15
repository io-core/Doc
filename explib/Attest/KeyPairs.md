
## [MODULE KeyPairs](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod)

## Imports:
` SYSTEM Kernel Oberon`

```
## Types:
```

  KeyPair* = POINTER TO KeyPairDesc;
  KeyPairDesc* = RECORD
    value*: INTEGER;
    next: KeyPair
  END;

PROCEDURE New*(P: KeyPair; v: INTEGER) : KeyPair;
BEGIN
  IF P = NIL THEN NEW(P) END;
  IF P # NIL THEN
    P.value := v;
    P.next := NIL
  END
  RETURN P 
END New;

PROCEDURE Get*(P: KeyPair; x: INTEGER): INTEGER;
```
  ## Variables:
```
 r,i: INTEGER; P1:KeyPair;
BEGIN i:=0;r:=0;
  P1:=P; WHILE P1 # NIL DO 
    IF i = x THEN r := P1.value END;
    P1:=P1.next;
    INC(i)
  END
  RETURN r 
END Get;
```
## Procedures:
---

`PROCEDURE New*(P: KeyPair; v: INTEGER) : KeyPair;` [(source)](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod#L15)


`PROCEDURE Get*(P: KeyPair; x: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod#L25)


`PROCEDURE Clear*(P: KeyPair);` [(source)](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod#L36)

