
## [MODULE ORX](https://github.com/io-core/Build/blob/main/ORX.Mod)

Procedures:

[17](https://github.com/io-core/Build/blob/main/ORX.Mod#17) `  PROCEDURE WriteHex(VAR R: Files.Rider; x: LONGINT);  (*write a 4 byte LONGINT in 8 digit hex format*)`
[29](https://github.com/io-core/Build/blob/main/ORX.Mod#29) `  PROCEDURE OutCode(VAR R, R1: Files.Rider; write: Writer; VAR codelen, entry, res: INTEGER);`
[56](https://github.com/io-core/Build/blob/main/ORX.Mod#56) `  PROCEDURE WriteFile*;  (*write code section of M.rsc in hex format to output file*)`
[87](https://github.com/io-core/Build/blob/main/ORX.Mod#87) `  PROCEDURE WriteCode*;  (*write code section of M.rsc in binary format to output file*)`
[116](https://github.com/io-core/Build/blob/main/ORX.Mod#116) `  PROCEDURE MakeStream(VAR Rf, Rg: Files.Rider; blksize, destadr: INTEGER);`
[127](https://github.com/io-core/Build/blob/main/ORX.Mod#127) `  PROCEDURE WriteStream*;  (*convert boot file to stream format with specified block size and dest adr*)`
