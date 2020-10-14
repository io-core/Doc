
## [MODULE ORX](https://github.com/io-core/Build/blob/main/ORX.Mod)

Procedures:


<pre>  PROCEDURE WriteHex(VAR R: Files.Rider; x: LONGINT);  (*write a 4 byte LONGINT in 8 digit hex format*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L17)


<pre>  PROCEDURE OutCode(VAR R, R1: Files.Rider; write: Writer; VAR codelen, entry, res: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L29)


<pre>  PROCEDURE WriteFile*;  (*write code section of M.rsc in hex format to output file*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L56)


<pre>  PROCEDURE WriteCode*;  (*write code section of M.rsc in binary format to output file*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L87)


<pre>  PROCEDURE MakeStream(VAR Rf, Rg: Files.Rider; blksize, destadr: INTEGER);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L116)


<pre>  PROCEDURE WriteStream*;  (*convert boot file to stream format with specified block size and dest adr*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORX.Mod#L127)

