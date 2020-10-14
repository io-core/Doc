
## [MODULE ORL](https://github.com/io-core/Build/blob/main/ORL.Mod)

Procedures:

[](https://github.com/io-core/Build/blob/main/ORL.Mod#L38) `  PROCEDURE MakeFileName(VAR FName: ARRAY OF CHAR; name, ext: ARRAY OF CHAR);`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L46) `  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L52) `  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L61) `  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L65) `  PROCEDURE Check(s: ARRAY OF CHAR);`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L76) `  PROCEDURE LinkOne(name: ARRAY OF CHAR; VAR newmod: Module);`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L254) `  PROCEDURE Link*;  (*link multiple object files together and create a single boot file M.bin from them*)`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L308) `  PROCEDURE Load*;  (*load prelinked boot file M.bin onto the boot area of the local disk*)`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L333) `  PROCEDURE RelocateLoaded*(start, dst: INTEGER);  (*relocate prelinked binary loaded at Mem[start] for execution at dst*)`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L385) `  PROCEDURE Relocate*;  (*relocate prelinked binary M.bin for execution at destadr and write result to output file R.bin*)`
[](https://github.com/io-core/Build/blob/main/ORL.Mod#L425) `  PROCEDURE Execute*;  (*load and execute prelinked binary M.bin*)`
