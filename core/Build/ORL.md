
## [MODULE ORL](https://github.com/io-core/Build/blob/main/ORL.Mod)

  ## Imports:
` SYSTEM Kernel Disk Files Modules Texts Oberon`

## Procedures:
---

`  PROCEDURE MakeFileName(VAR FName: ARRAY OF CHAR; name, ext: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L38)


`  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L46)


`  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L52)


`  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L61)


`  PROCEDURE Check(s: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L65)


`  PROCEDURE LinkOne(name: ARRAY OF CHAR; VAR newmod: Module);` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L76)


`  PROCEDURE Link*;  (*link multiple object files together and create a single boot file M.bin from them*)` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L254)


`  PROCEDURE Load*;  (*load prelinked boot file M.bin onto the boot area of the local disk*)` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L308)


`  PROCEDURE RelocateLoaded*(start, dst: INTEGER);  (*relocate prelinked binary loaded at Mem[start] for execution at dst*)` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L333)


`  PROCEDURE Relocate*;  (*relocate prelinked binary M.bin for execution at destadr and write result to output file R.bin*)` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L385)


`  PROCEDURE Execute*;  (*load and execute prelinked binary M.bin*)` [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L425)

