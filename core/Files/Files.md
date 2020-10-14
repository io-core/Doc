
## [MODULE Files](https://github.com/io-core/Files/blob/main/Files.Mod)

Procedures:

```
  PROCEDURE Check(s: ARRAY OF CHAR;
```
```
  PROCEDURE Old*(name: ARRAY OF CHAR): File;
```
```
  PROCEDURE New*(name: ARRAY OF CHAR): File;
```
```
  PROCEDURE UpdateHeader(f: File; VAR F: FileDir.FileHeader);
```
```
  PROCEDURE ReadBuf(f: File; buf: Buffer; pos: INTEGER);
```
```
  PROCEDURE WriteBuf(f: File; buf: Buffer);
```
```
  PROCEDURE Buf(f: File; pos: INTEGER): Buffer;
```
```
  PROCEDURE GetBuf(f: File; pos: INTEGER): Buffer;
```
```
  PROCEDURE Unbuffer(f: File);
```
```
  PROCEDURE Register*(f: File);
```
```
  PROCEDURE Close*(f: File);
```
```
  PROCEDURE Purge*(f: File);
```
```
  PROCEDURE Delete*(name: ARRAY OF CHAR; VAR res: INTEGER);
```
```
  PROCEDURE Rename*(old, new: ARRAY OF CHAR; VAR res: INTEGER);
```
```
  PROCEDURE Length*(f: File): INTEGER;
```
```
  PROCEDURE Date*(f: File): INTEGER;
```
```
  PROCEDURE Set*(VAR r: Rider; f: File; pos: INTEGER);
```
```
  PROCEDURE Pos*(VAR r: Rider): INTEGER;
```
```
  PROCEDURE Base*(VAR r: Rider): File;
```
```
  PROCEDURE ReadByte*(VAR r: Rider; VAR x: BYTE);
```
```
  PROCEDURE ReadBytes*(VAR r: Rider; VAR x: ARRAY OF BYTE; n: INTEGER);
```
```
  PROCEDURE Read*(VAR r: Rider; VAR ch: CHAR);
```
```
  PROCEDURE ReadInt*(VAR R: Rider; VAR x: INTEGER);
```
```
  PROCEDURE ReadSet*(VAR R: Rider; VAR s: SET);
```
```
  PROCEDURE ReadReal*(VAR R: Rider; VAR x: REAL);
```
```
  PROCEDURE ReadString*(VAR R: Rider; VAR x: ARRAY OF CHAR);
```
```
  PROCEDURE ReadNum*(VAR R: Rider; VAR x: INTEGER);
```
```
  PROCEDURE NewExt(f: File);
```
```
  PROCEDURE WriteByte*(VAR r: Rider; x: BYTE);
```
```
  PROCEDURE WriteBytes*(VAR r: Rider; x: ARRAY OF BYTE; n: INTEGER);
```
```
  PROCEDURE Write*(VAR r: Rider; ch: CHAR);
```
```
  PROCEDURE WriteInt*(VAR R: Rider; x: INTEGER);
```
```
  PROCEDURE WriteSet*(VAR R: Rider; s: SET);
```
```
  PROCEDURE WriteReal*(VAR R: Rider; x: REAL);
```
```
  PROCEDURE WriteString*(VAR R: Rider; x: ARRAY OF CHAR);
```
```
  PROCEDURE WriteNum*(VAR R: Rider; x: INTEGER);
```
```
  PROCEDURE Init*;
```
```
  PROCEDURE RestoreList*; (*after mark phase of garbage collection*)
```
```
    PROCEDURE mark(f: INTEGER): INTEGER;
```
