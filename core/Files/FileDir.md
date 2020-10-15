
## [MODULE FileDir](https://github.com/io-core/Files/blob/main/FileDir.Mod)

  ## Imports:
` Disk`

## Constants:
```
 FnLength*    = 32;
        SecTabSize*   = 64;
        ExTabSize*   = 12;
        SectorSize*   = 1024;
        IndexSize*   = SectorSize DIV 4;
        HeaderSize*  = 352;
        DirRootAdr*  = 29;
        DirPgSize*   = 24;
        N = DirPgSize DIV 2;
        DirMark*    = 9B1EA38DH;
        HeaderMark* = 9BA71D86H;
        FillerSize = 52;

  TYPE DiskAdr      = INTEGER;
```
## Types:
```
 DiskAdr      = INTEGER;
    FileName*       = ARRAY FnLength OF CHAR;
    SectorTable*    = ARRAY SecTabSize OF DiskAdr;
    ExtensionTable* = ARRAY ExTabSize OF DiskAdr;
    EntryHandler*   = PROCEDURE (name: FileName; sec: DiskAdr; VAR continue: BOOLEAN);
```
    EntryHandler*   = PROCEDURE (name: FileName; sec: DiskAdr; VAR continue: BOOLEAN);

```
## Procedures:
---

`  PROCEDURE Search*(name: FileName; VAR A: DiskAdr);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L80)


`  PROCEDURE insert(name: FileName;` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L97)


`  PROCEDURE Insert*(name: FileName; fad: DiskAdr);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L157)


`  PROCEDURE underflow(VAR c: DirPage;  (*ancestor page*)` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L171)


`  PROCEDURE delete(name: FileName;` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L220)


`    PROCEDURE del(VAR a: DirPage; R: INTEGER; dpg1: DiskAdr; VAR h: BOOLEAN);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L231)


`  PROCEDURE Delete*(name: FileName; VAR fad: DiskAdr);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L266)


`  PROCEDURE enumerate(prefix:   ARRAY OF CHAR;` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L280)


`  PROCEDURE Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L306)


`  PROCEDURE Attributes*(fad: INTEGER; VAR length, date: INTEGER);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L311)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L318)


`    PROCEDURE MarkSectors(VAR A: ARRAY OF DiskAdr; k: INTEGER);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L322)


`      PROCEDURE sift(VAR A: ARRAY OF DiskAdr; L, R: INTEGER);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L327)


`    PROCEDURE TraverseDir(VAR A: ARRAY OF DiskAdr; VAR k: INTEGER; dpg: DiskAdr);` [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod#L361)

