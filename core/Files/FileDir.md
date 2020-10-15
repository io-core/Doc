
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

```
  ## Types:
```
 DiskAdr      = INTEGER;
    FileName*       = ARRAY FnLength OF CHAR;
    SectorTable*    = ARRAY SecTabSize OF DiskAdr;
    ExtensionTable* = ARRAY ExTabSize OF DiskAdr;
```
    EntryHandler*   = PROCEDURE (name: FileName; sec: DiskAdr; ## Variables:
```
 continue: BOOLEAN);
  PROCEDURE Search*(name: FileName; ## Variables:
```
 A: DiskAdr);
    ## Variables:
```
 i, L, R: INTEGER; dadr: DiskAdr;
    ## Variables:
```
 i, L, R: INTEGER; dadr: DiskAdr;
      a: DirPage;
  BEGIN dadr := DirRootAdr; A := 0;
    REPEAT Disk.GetSector(dadr, a); ASSERT(a.mark = DirMark);
      L := 0; R := a.m; (*binary search*)
      WHILE L < R DO
        i := (L+R) DIV 2;
        IF name <= a.e[i].name THEN R := i ELSE L := i+1 END
      END ;
      IF (R < a.m) & (name = a.e[R].name) THEN A := a.e[R].adr (*found*)
      ELSIF R = 0 THEN dadr := a.p0
      ELSE dadr := a.e[R-1].p
      END ;
    UNTIL (dadr = 0) OR (A # 0)
  END Search;
                   ## Variables:
```
 h: BOOLEAN;
                   ## Variables:
```
 v: DirEntry;
                   ## Variables:
```
 v: DirEntry;
                   fad:     DiskAdr);
    (*h = "tree has become higher and v is ascending element"*)
    ## Variables:
```
 ch: CHAR;
    ## Variables:
```
 ch: CHAR;
      i, j, L, R: INTEGER;
      dpg1: DiskAdr;
      u: DirEntry;
      a: DirPage;
    ## Variables:
```
  oldroot: DiskAdr;
      h: BOOLEAN; U: DirEntry;
      a: DirPage;
  BEGIN h := FALSE;
    insert(name, DirRootAdr, h, U, fad);
    IF h THEN (*root overflow*)
      Disk.GetSector(DirRootAdr, a); ASSERT(a.mark = DirMark);
      Disk.AllocSector(DirRootAdr, oldroot); Disk.PutSector(oldroot, a);
      a.mark := DirMark; a.m := 1; a.p0 := oldroot; a.e[0] := U;
      Disk.PutSector(DirRootAdr, a)
    END
  END Insert;
  PROCEDURE underflow(## Variables:
```
 c: DirPage;  (*ancestor page*)
                      dpg0:  DiskAdr;
                      s:     INTEGER;  (*insertion point in c*)
                      ## Variables:
```
 h: BOOLEAN); (*c undersize*)
                      ## Variables:
```
 h: BOOLEAN); (*c undersize*)
    ## Variables:
```
 i, k: INTEGER;
    ## Variables:
```
 i, k: INTEGER;
        dpg1: DiskAdr;
        a, b: DirPage;  (*a := underflowing page, b := neighbouring page*)
  BEGIN Disk.GetSector(dpg0, a); ASSERT(a.mark = DirMark);
    (*h & a.m = N-1 & dpg0 = c.e[s-1].p*)
    IF s < c.m THEN (*b := page to the right of a*)
      dpg1 := c.e[s].p; Disk.GetSector(dpg1, b); ASSERT(b.mark = DirMark);
      k := (b.m-N+1) DIV 2; (*k = no. of items available on page b*)
      a.e[N-1] := c.e[s]; a.e[N-1].p := b.p0;
      IF k > 0 THEN
        (*move k-1 items from b to a, one to c*) i := 0;
        WHILE i < k-1 DO a.e[i+N] := b.e[i]; INC(i) END ;
        c.e[s] := b.e[i]; b.p0 := c.e[s].p;
        c.e[s].p := dpg1; b.m := b.m - k; i := 0;
        WHILE i < b.m DO b.e[i] := b.e[i+k]; INC(i) END ;
        Disk.PutSector(dpg1, b); a.m := N-1+k; h := FALSE
      ELSE (*merge pages a and b, discard b*) i := 0;
        WHILE i < N DO a.e[i+N] := b.e[i]; INC(i) END ;
        i := s; DEC(c.m);
        WHILE i < c.m DO c.e[i] := c.e[i+1]; INC(i) END ;
        a.m := 2*N; h := c.m < N
      END ;
      Disk.PutSector(dpg0, a)
    ELSE (*b := page to the left of a*) DEC(s);
      IF s = 0 THEN dpg1 := c.p0 ELSE dpg1 := c.e[s-1].p END ;
      Disk.GetSector(dpg1, b); ASSERT(b.mark = DirMark);
      k := (b.m-N+1) DIV 2; (*k = no. of items available on page b*)
      IF k > 0 THEN
        i := N-1;
        WHILE i > 0 DO DEC(i); a.e[i+k] := a.e[i] END ;
        i := k-1; a.e[i] := c.e[s]; a.e[i].p := a.p0;
        (*move k-1 items from b to a, one to c*) b.m := b.m - k;
        WHILE i > 0 DO DEC(i); a.e[i] := b.e[i+b.m+1] END ;
        c.e[s] := b.e[b.m]; a.p0 := c.e[s].p;
        c.e[s].p := dpg0; a.m := N-1+k; h := FALSE;
        Disk.PutSector(dpg0, a)
      ELSE (*merge pages a and b, discard a*)
        c.e[s].p := a.p0; b.e[N] := c.e[s]; i := 0;
        WHILE i < N-1 DO b.e[i+N+1] := a.e[i]; INC(i) END ;
        b.m := 2*N; DEC(c.m); h := c.m < N
      END ;
      Disk.PutSector(dpg1, b)
    END
  END underflow;
                   ## Variables:
```
 h: BOOLEAN;
                   ## Variables:
```
 fad: DiskAdr);
                   ## Variables:
```
 fad: DiskAdr);
  (*search and delete entry with key name; if a page underflow arises,
    balance with adjacent page or merge; h := "page dpg0 is undersize"*)
    ## Variables:
```
 i, L, R: INTEGER;
      dpg1: DiskAdr;
      a: DirPage;
    PROCEDURE del(## Variables:
```
 a: DirPage; R: INTEGER; dpg1: DiskAdr; ## Variables:
```
 h: BOOLEAN);
      ## Variables:
```
 dpg2: DiskAdr;  (*global: a, R*)
      ## Variables:
```
 dpg2: DiskAdr;  (*global: a, R*)
          b: DirPage;
    BEGIN Disk.GetSector(dpg1, b); ASSERT(b.mark = DirMark); dpg2 := b.e[b.m-1].p;
      IF dpg2 # 0 THEN del(a, R, dpg2, h);
        IF h THEN underflow(b, dpg2, b.m, h); Disk.PutSector(dpg1, b) END
      ELSE
        b.e[b.m-1].p := a.e[R].p; a.e[R] := b.e[b.m-1];
        DEC(b.m); h := b.m < N; Disk.PutSector(dpg1, b)
      END
    END del;
  PROCEDURE Delete*(name: FileName; ## Variables:
```
 fad: DiskAdr);
    ## Variables:
```
 h: BOOLEAN; newroot: DiskAdr;
    ## Variables:
```
 h: BOOLEAN; newroot: DiskAdr;
      a: DirPage;
  BEGIN h := FALSE;
    delete(name, DirRootAdr, h, fad);
    IF h THEN (*root underflow*)
      Disk.GetSector(DirRootAdr, a); ASSERT(a.mark = DirMark);
      IF (a.m = 0) & (a.p0 # 0) THEN
        newroot := a.p0; Disk.GetSector(newroot, a); ASSERT(a.mark = DirMark);
        Disk.PutSector(DirRootAdr, a) (*discard newroot*)
      END
    END
  END Delete;
                      ## Variables:
```
 continue: BOOLEAN);
    ## Variables:
```
 i, j: INTEGER; pfx, nmx: CHAR;
    ## Variables:
```
 i, j: INTEGER; pfx, nmx: CHAR;
      dpg1: DiskAdr; a: DirPage;
  BEGIN Disk.GetSector(dpg, a); ASSERT(a.mark = DirMark); i := 0;
    WHILE (i < a.m) & continue DO
      j := 0;
      REPEAT pfx := prefix[j]; nmx := a.e[i].name[j]; INC(j)
      UNTIL (nmx # pfx) OR (pfx = 0X);
      IF nmx >= pfx THEN
        IF i = 0 THEN dpg1 := a.p0 ELSE dpg1 := a.e[i-1].p END ;
        IF dpg1 # 0 THEN enumerate(prefix, dpg1, proc, continue) END ;
        IF pfx = 0X THEN
          IF continue THEN proc(a.e[i].name, a.e[i].adr, continue) END
        ELSE continue := FALSE
        END
      END ;
      INC(i)
    END ;
    IF continue & (i > 0) & (a.e[i-1].p # 0) THEN
      enumerate(prefix, a.e[i-1].p, proc, continue)
    END
  END enumerate;
    ## Variables:
```
 b: BOOLEAN;
  BEGIN b := TRUE; enumerate(prefix, DirRootAdr, proc, b)
  END Enumerate;
  PROCEDURE Attributes*(fad: INTEGER; ## Variables:
```
 length, date: INTEGER);
    ## Variables:
```
 hd: FileHeader;
    ## Variables:
```
 hd: FileHeader;
  BEGIN Disk.GetSector(fad, hd); length := hd.aleng * SectorSize + hd.bleng - HeaderSize; date := hd.date;
  END Attributes;
    ## Variables:
```
 k: INTEGER;
        A: ARRAY 2000 OF DiskAdr;
    PROCEDURE MarkSectors(## Variables:
```
 A: ARRAY OF DiskAdr; k: INTEGER);
      ## Variables:
```
 L, R, i, j, n: INTEGER; x: DiskAdr;
      ## Variables:
```
 L, R, i, j, n: INTEGER; x: DiskAdr;
        hd: FileHeader;
        B: IndexSector;
      PROCEDURE sift(## Variables:
```
 A: ARRAY OF DiskAdr; L, R: INTEGER);
        ## Variables:
```
 i, j: INTEGER; x: DiskAdr;
        ## Variables:
```
 i, j: INTEGER; x: DiskAdr;
      BEGIN j := L; x := A[j];
        REPEAT i := j; j := 2*j + 1;
          IF (j+1 < R) & (A[j] < A[j+1]) THEN INC(j) END ;
          IF (j < R) & (x <= A[j]) THEN A[i] := A[j] END
        UNTIL (j >= R) OR (x > A[j]);
        A[i] := x
      END sift;
    PROCEDURE TraverseDir(## Variables:
```
 A: ARRAY OF DiskAdr; ## Variables:
```
 k: INTEGER; dpg: DiskAdr);
      ## Variables:
```
 i: INTEGER; a: DirPage;
      ## Variables:
```
 i: INTEGER; a: DirPage;
    BEGIN Disk.GetSector(dpg, a); ASSERT(a.mark = DirMark); Disk.MarkSector(dpg); i := 0;
      WHILE i < a.m DO
        A[k] := a.e[i].adr; INC(k); INC(i);
        IF k = 2000 THEN MarkSectors(A, k); k := 0 END
      END ;
      IF a.p0 # 0 THEN
        TraverseDir(A, k, a.p0); i := 0;
        WHILE i < a.m DO
          TraverseDir(A, k, a.e[i].p); INC(i)
        END
      END
    END TraverseDir;
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

