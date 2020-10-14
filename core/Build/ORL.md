
## [MODULE ORL](https://github.com/io-core/Build/blob/main/ORL.Mod)

Procedures:

[38](https://github.com/io-core/Build/blob/main/ORL.Mod#38) `  PROCEDURE MakeFileName(VAR FName: ARRAY OF CHAR; name, ext: ARRAY OF CHAR);`
[46](https://github.com/io-core/Build/blob/main/ORL.Mod#46) `  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;`
[52](https://github.com/io-core/Build/blob/main/ORL.Mod#52) `  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;`
[61](https://github.com/io-core/Build/blob/main/ORL.Mod#61) `  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);`
[65](https://github.com/io-core/Build/blob/main/ORL.Mod#65) `  PROCEDURE Check(s: ARRAY OF CHAR);`
[76](https://github.com/io-core/Build/blob/main/ORL.Mod#76) `  PROCEDURE LinkOne(name: ARRAY OF CHAR; VAR newmod: Module);`
[254](https://github.com/io-core/Build/blob/main/ORL.Mod#254) `  PROCEDURE Link*;  (*link multiple object files together and create a single boot file M.bin from them*)`
[308](https://github.com/io-core/Build/blob/main/ORL.Mod#308) `  PROCEDURE Load*;  (*load prelinked boot file M.bin onto the boot area of the local disk*)`
[333](https://github.com/io-core/Build/blob/main/ORL.Mod#333) `  PROCEDURE RelocateLoaded*(start, dst: INTEGER);  (*relocate prelinked binary loaded at Mem[start] for execution at dst*)`
[385](https://github.com/io-core/Build/blob/main/ORL.Mod#385) `  PROCEDURE Relocate*;  (*relocate prelinked binary M.bin for execution at destadr and write result to output file R.bin*)`
[425](https://github.com/io-core/Build/blob/main/ORL.Mod#425) `  PROCEDURE Execute*;  (*load and execute prelinked binary M.bin*)`
