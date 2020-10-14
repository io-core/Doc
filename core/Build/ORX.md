
## [MODULE ORX](https://github.com/io-core/Build/blob/main/ORX.Mod)

Procedures:


<code>  PROCEDURE WriteHex(VAR R: Files.Rider; x: LONGINT);  (*write a 4 byte LONGINT in 8 digit hex format*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L17)


<code>  PROCEDURE OutCode(VAR R, R1: Files.Rider; write: Writer; VAR codelen, entry, res: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L29)


<code>  PROCEDURE WriteFile*;  (*write code section of M.rsc in hex format to output file*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L56)


<code>  PROCEDURE WriteCode*;  (*write code section of M.rsc in binary format to output file*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L87)


<code>  PROCEDURE MakeStream(VAR Rf, Rg: Files.Rider; blksize, destadr: INTEGER);</code> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L116)


<code>  PROCEDURE WriteStream*;  (*convert boot file to stream format with specified block size and dest adr*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L127)

