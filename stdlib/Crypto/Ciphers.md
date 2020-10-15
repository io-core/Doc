
## [MODULE Ciphers](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod)

## Imports:
` SYSTEM Kernel Oberon`

```
## Types:
```

  Cipher* = POINTER TO CipherDesc;
  CipherDesc* = RECORD
    value*: INTEGER;
    next: Cipher
  END;

PROCEDURE New*(C: Cipher; v: INTEGER) : Cipher;
BEGIN
  IF C = NIL THEN NEW(C) END;
  IF C # NIL THEN
    C.value := v;
    C.next := NIL
  END
  RETURN C 
END New;

PROCEDURE Get*(C: Cipher; x: INTEGER): INTEGER;
```
## Procedures:
---

`PROCEDURE New*(C: Cipher; v: INTEGER) : Cipher;` [(source)](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod#L15)


`PROCEDURE Get*(C: Cipher; x: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod#L25)


`PROCEDURE Clear*(C: Cipher);` [(source)](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod#L36)

