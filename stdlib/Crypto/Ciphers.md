
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
## Variables:
```
 r,i: INTEGER; C1:Cipher;
BEGIN i:=0;r:=0;
  C1:=C; WHILE C1 # NIL DO 
    IF i = x THEN r := C1.value END;
    C1:=C1.next;
    INC(i)
  END
  RETURN r 
END Get;

```
## Procedures:
---

`PROCEDURE New*(C: Cipher; v: INTEGER) : Cipher;` [(source)](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod#L15)


`PROCEDURE Get*(C: Cipher; x: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod#L25)


`PROCEDURE Clear*(C: Cipher);` [(source)](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod#L36)

