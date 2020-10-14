
## [MODULE ORL](https://github.com/io-core/Build/blob/main/ORL.Mod)

Procedures:


<code>  PROCEDURE MakeFileName(VAR FName: ARRAY OF CHAR; name, ext: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L38)


<code>  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L46)


<code>  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L52)


<code>  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L61)


<code>  PROCEDURE Check(s: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L65)


<code>  PROCEDURE LinkOne(name: ARRAY OF CHAR; VAR newmod: Module);</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L76)


<code>  PROCEDURE Link*;  (*link multiple object files together and create a single boot file M.bin from them*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L254)


<code>  PROCEDURE Load*;  (*load prelinked boot file M.bin onto the boot area of the local disk*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L308)


<code>  PROCEDURE RelocateLoaded*(start, dst: INTEGER);  (*relocate prelinked binary loaded at Mem[start] for execution at dst*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L333)


<code>  PROCEDURE Relocate*;  (*relocate prelinked binary M.bin for execution at destadr and write result to output file R.bin*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L385)


<code>  PROCEDURE Execute*;  (*load and execute prelinked binary M.bin*)</code> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L425)

