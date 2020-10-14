
#### [MODULE ORL](https://github.com/io-core/Build/blob/main/ORL.Mod)

Procedures:

```
  PROCEDURE MakeFileName(VAR FName: ARRAY OF CHAR; name, ext: ARRAY OF CHAR);
```
```
  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;
```
```
  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;
```
```
  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);
```
```
  PROCEDURE Check(s: ARRAY OF CHAR);
```
```
  PROCEDURE LinkOne(name: ARRAY OF CHAR; VAR newmod: Module);
```
```
  PROCEDURE Link*;  (*link multiple object files together and create a single boot file M.bin from them*)
```
```
  PROCEDURE Load*;  (*load prelinked boot file M.bin onto the boot area of the local disk*)
```
```
  PROCEDURE RelocateLoaded*(start, dst: INTEGER);  (*relocate prelinked binary loaded at Mem[start] for execution at dst*)
```
```
  PROCEDURE Relocate*;  (*relocate prelinked binary M.bin for execution at destadr and write result to output file R.bin*)
```
```
  PROCEDURE Execute*;  (*load and execute prelinked binary M.bin*)
```
