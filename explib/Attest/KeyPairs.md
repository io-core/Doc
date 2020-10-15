
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
## Procedures:
---

`PROCEDURE New*(P: KeyPair; v: INTEGER) : KeyPair;` [(source)](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod#L15)


`PROCEDURE Get*(P: KeyPair; x: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod#L25)


`PROCEDURE Clear*(P: KeyPair);` [(source)](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod#L36)

