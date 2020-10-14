
## [MODULE ORL](https://github.com/io-core/Build/blob/main/ORL.Mod)

Procedures:


<pre>  PROCEDURE MakeFileName(VAR FName: ARRAY OF CHAR; name, ext: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L38)


<pre>  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L46)


<pre>  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L52)


<pre>  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L61)


<pre>  PROCEDURE Check(s: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L65)


<pre>  PROCEDURE LinkOne(name: ARRAY OF CHAR; VAR newmod: Module);</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L76)


<pre>  PROCEDURE Link*;  (*link multiple object files together and create a single boot file M.bin from them*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L254)


<pre>  PROCEDURE Load*;  (*load prelinked boot file M.bin onto the boot area of the local disk*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L308)


<pre>  PROCEDURE RelocateLoaded*(start, dst: INTEGER);  (*relocate prelinked binary loaded at Mem[start] for execution at dst*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L333)


<pre>  PROCEDURE Relocate*;  (*relocate prelinked binary M.bin for execution at destadr and write result to output file R.bin*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L385)


<pre>  PROCEDURE Execute*;  (*load and execute prelinked binary M.bin*)</pre> [(source)](https://github.com/io-core/Build/blob/main/ORL.Mod#L425)

