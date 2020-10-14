
## [MODULE FileDir](https://github.com/io-core/Files/blob/main/FileDir.Mod)

Procedures:


<pre>  PROCEDURE Search*(name: FileName; VAR A: DiskAdr);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L80)


<pre>  PROCEDURE insert(name: FileName;</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L97)


<pre>  PROCEDURE Insert*(name: FileName; fad: DiskAdr);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L157)


<pre>  PROCEDURE underflow(VAR c: DirPage;  (*ancestor page*)</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L171)


<pre>  PROCEDURE delete(name: FileName;</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L220)


<pre>    PROCEDURE del(VAR a: DirPage; R: INTEGER; dpg1: DiskAdr; VAR h: BOOLEAN);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L231)


<pre>  PROCEDURE Delete*(name: FileName; VAR fad: DiskAdr);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L266)


<pre>  PROCEDURE enumerate(prefix:   ARRAY OF CHAR;</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L280)


<pre>  PROCEDURE Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L306)


<pre>  PROCEDURE Attributes*(fad: INTEGER; VAR length, date: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L311)


<pre>  PROCEDURE Init*;</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L318)


<pre>    PROCEDURE MarkSectors(VAR A: ARRAY OF DiskAdr; k: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L322)


<pre>      PROCEDURE sift(VAR A: ARRAY OF DiskAdr; L, R: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L327)


<pre>    PROCEDURE TraverseDir(VAR A: ARRAY OF DiskAdr; VAR k: INTEGER; dpg: DiskAdr);</pre> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L361)

