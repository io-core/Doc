
## [MODULE ORX](https://github.com/io-core/Build/blob/main/ORX.Mod)

Procedures:

[](https://github.com/io-core/Build/blob/main/ORX.Mod#L17) `  PROCEDURE WriteHex(VAR R: Files.Rider; x: LONGINT);  (*write a 4 byte LONGINT in 8 digit hex format*)`
[](https://github.com/io-core/Build/blob/main/ORX.Mod#L29) `  PROCEDURE OutCode(VAR R, R1: Files.Rider; write: Writer; VAR codelen, entry, res: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORX.Mod#L56) `  PROCEDURE WriteFile*;  (*write code section of M.rsc in hex format to output file*)`
[](https://github.com/io-core/Build/blob/main/ORX.Mod#L87) `  PROCEDURE WriteCode*;  (*write code section of M.rsc in binary format to output file*)`
[](https://github.com/io-core/Build/blob/main/ORX.Mod#L116) `  PROCEDURE MakeStream(VAR Rf, Rg: Files.Rider; blksize, destadr: INTEGER);`
[](https://github.com/io-core/Build/blob/main/ORX.Mod#L127) `  PROCEDURE WriteStream*;  (*convert boot file to stream format with specified block size and dest adr*)`
