
## [MODULE ORX](https://github.com/io-core/Build/blob/main/ORX.Mod)

  ## Imports:
` Files Texts Oberon`

  ## Constants:
```
 CR = 0DX; noerr = 0; badfile = 4;  (*copied from Modules for use as cross development tool*)

```
  ## Types:
```
 Writer = PROCEDURE(VAR R: Files.Rider; x: LONGINT);

```
  TYPE Writer = PROCEDURE(VAR R: Files.Rider; x: LONGINT);

```
## Procedures:
---

`  PROCEDURE WriteHex(VAR R: Files.Rider; x: LONGINT);  (*write a 4 byte LONGINT in 8 digit hex format*)` [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L17)


`  PROCEDURE OutCode(VAR R, R1: Files.Rider; write: Writer; VAR codelen, entry, res: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L29)


`  PROCEDURE WriteFile*;  (*write code section of M.rsc in hex format to output file*)` [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L56)


`  PROCEDURE WriteCode*;  (*write code section of M.rsc in binary format to output file*)` [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L87)


`  PROCEDURE MakeStream(VAR Rf, Rg: Files.Rider; blksize, destadr: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L116)


`  PROCEDURE WriteStream*;  (*convert boot file to stream format with specified block size and dest adr*)` [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L127)

