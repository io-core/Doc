
## [MODULE FileDir](https://github.com/io-core/Files/blob/main/FileDir.Mod)

Procedures:

[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L80) `  PROCEDURE Search*(name: FileName; VAR A: DiskAdr);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L97) `  PROCEDURE insert(name: FileName;`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L157) `  PROCEDURE Insert*(name: FileName; fad: DiskAdr);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L171) `  PROCEDURE underflow(VAR c: DirPage;  (*ancestor page*)`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L220) `  PROCEDURE delete(name: FileName;`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L231) `    PROCEDURE del(VAR a: DirPage; R: INTEGER; dpg1: DiskAdr; VAR h: BOOLEAN);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L266) `  PROCEDURE Delete*(name: FileName; VAR fad: DiskAdr);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L280) `  PROCEDURE enumerate(prefix:   ARRAY OF CHAR;`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L306) `  PROCEDURE Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L311) `  PROCEDURE Attributes*(fad: INTEGER; VAR length, date: INTEGER);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L318) `  PROCEDURE Init*;`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L322) `    PROCEDURE MarkSectors(VAR A: ARRAY OF DiskAdr; k: INTEGER);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L327) `      PROCEDURE sift(VAR A: ARRAY OF DiskAdr; L, R: INTEGER);`
[](https://github.com/io-core/Files/blob/main/FileDir.Mod#L361) `    PROCEDURE TraverseDir(VAR A: ARRAY OF DiskAdr; VAR k: INTEGER; dpg: DiskAdr);`
