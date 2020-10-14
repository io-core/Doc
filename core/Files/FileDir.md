
## [MODULE FileDir](https://github.com/io-core/Files/blob/main/FileDir.Mod)

Procedures:

```
  PROCEDURE Search*(name: FileName; VAR A: DiskAdr);
```
```
  PROCEDURE insert(name: FileName;
```
```
  PROCEDURE Insert*(name: FileName; fad: DiskAdr);
```
```
  PROCEDURE underflow(VAR c: DirPage;  (*ancestor page*)
```
```
  PROCEDURE delete(name: FileName;
```
```
    PROCEDURE del(VAR a: DirPage; R: INTEGER; dpg1: DiskAdr; VAR h: BOOLEAN);
```
```
  PROCEDURE Delete*(name: FileName; VAR fad: DiskAdr);
```
```
  PROCEDURE enumerate(prefix:   ARRAY OF CHAR;
```
```
  PROCEDURE Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler);
```
```
  PROCEDURE Attributes*(fad: INTEGER; VAR length, date: INTEGER);
```
```
  PROCEDURE Init*;
```
```
    PROCEDURE MarkSectors(VAR A: ARRAY OF DiskAdr; k: INTEGER);
```
```
      PROCEDURE sift(VAR A: ARRAY OF DiskAdr; L, R: INTEGER);
```
```
    PROCEDURE TraverseDir(VAR A: ARRAY OF DiskAdr; VAR k: INTEGER; dpg: DiskAdr);
```
