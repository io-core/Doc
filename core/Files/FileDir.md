
## [MODULE FileDir](https://github.com/io-core/Files/blob/main/FileDir.Mod)

Procedures:


<code>  PROCEDURE Search*(name: FileName; VAR A: DiskAdr);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L80)


<code>  PROCEDURE insert(name: FileName;</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L97)


<code>  PROCEDURE Insert*(name: FileName; fad: DiskAdr);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L157)


<code>  PROCEDURE underflow(VAR c: DirPage;  (*ancestor page*)</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L171)


<code>  PROCEDURE delete(name: FileName;</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L220)


<code>    PROCEDURE del(VAR a: DirPage; R: INTEGER; dpg1: DiskAdr; VAR h: BOOLEAN);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L231)


<code>  PROCEDURE Delete*(name: FileName; VAR fad: DiskAdr);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L266)


<code>  PROCEDURE enumerate(prefix:   ARRAY OF CHAR;</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L280)


<code>  PROCEDURE Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L306)


<code>  PROCEDURE Attributes*(fad: INTEGER; VAR length, date: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L311)


<code>  PROCEDURE Init*;</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L318)


<code>    PROCEDURE MarkSectors(VAR A: ARRAY OF DiskAdr; k: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L322)


<code>      PROCEDURE sift(VAR A: ARRAY OF DiskAdr; L, R: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L327)


<code>    PROCEDURE TraverseDir(VAR A: ARRAY OF DiskAdr; VAR k: INTEGER; dpg: DiskAdr);</code> [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L361)

