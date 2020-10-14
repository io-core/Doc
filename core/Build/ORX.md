
#### [MODULE ORX](https://github.com/io-core/Build/blob/main/ORX.Mod)

Procedures:

```
  PROCEDURE WriteHex(VAR R: Files.Rider; x: LONGINT);  (*write a 4 byte LONGINT in 8 digit hex format*)
```
```
  PROCEDURE OutCode(VAR R, R1: Files.Rider; write: Writer; VAR codelen, entry, res: INTEGER);
```
```
  PROCEDURE WriteFile*;  (*write code section of M.rsc in hex format to output file*)
```
```
  PROCEDURE WriteCode*;  (*write code section of M.rsc in binary format to output file*)
```
```
  PROCEDURE MakeStream(VAR Rf, Rg: Files.Rider; blksize, destadr: INTEGER);
```
```
  PROCEDURE WriteStream*;  (*convert boot file to stream format with specified block size and dest adr*)
```
