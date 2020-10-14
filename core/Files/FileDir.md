
## [MODULE FileDir](https://github.com/io-core/Files/blob/main/FileDir.Mod)

Procedures:

```
[80](https://github.com/io-core/Files/blob/main/FileDir.Mod#80)    PROCEDURE Search*(name: FileName; VAR A: DiskAdr);
```
```
[97](https://github.com/io-core/Files/blob/main/FileDir.Mod#97)    PROCEDURE insert(name: FileName;
```
```
[157](https://github.com/io-core/Files/blob/main/FileDir.Mod#157)    PROCEDURE Insert*(name: FileName; fad: DiskAdr);
```
```
[171](https://github.com/io-core/Files/blob/main/FileDir.Mod#171)    PROCEDURE underflow(VAR c: DirPage;  (*ancestor page*)
```
```
[220](https://github.com/io-core/Files/blob/main/FileDir.Mod#220)    PROCEDURE delete(name: FileName;
```
```
[231](https://github.com/io-core/Files/blob/main/FileDir.Mod#231)      PROCEDURE del(VAR a: DirPage; R: INTEGER; dpg1: DiskAdr; VAR h: BOOLEAN);
```
```
[266](https://github.com/io-core/Files/blob/main/FileDir.Mod#266)    PROCEDURE Delete*(name: FileName; VAR fad: DiskAdr);
```
```
[280](https://github.com/io-core/Files/blob/main/FileDir.Mod#280)    PROCEDURE enumerate(prefix:   ARRAY OF CHAR;
```
```
[306](https://github.com/io-core/Files/blob/main/FileDir.Mod#306)    PROCEDURE Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler);
```
```
[311](https://github.com/io-core/Files/blob/main/FileDir.Mod#311)    PROCEDURE Attributes*(fad: INTEGER; VAR length, date: INTEGER);
```
```
[318](https://github.com/io-core/Files/blob/main/FileDir.Mod#318)    PROCEDURE Init*;
```
```
[322](https://github.com/io-core/Files/blob/main/FileDir.Mod#322)      PROCEDURE MarkSectors(VAR A: ARRAY OF DiskAdr; k: INTEGER);
```
```
[327](https://github.com/io-core/Files/blob/main/FileDir.Mod#327)        PROCEDURE sift(VAR A: ARRAY OF DiskAdr; L, R: INTEGER);
```
```
[361](https://github.com/io-core/Files/blob/main/FileDir.Mod#361)      PROCEDURE TraverseDir(VAR A: ARRAY OF DiskAdr; VAR k: INTEGER; dpg: DiskAdr);
```
