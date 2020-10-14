
## [MODULE Files](https://github.com/io-core/Files/blob/main/Files.Mod)

Procedures:


[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L65) `  PROCEDURE Check(s: ARRAY OF CHAR;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L83) `  PROCEDURE Old*(name: ARRAY OF CHAR): File;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L118) `  PROCEDURE New*(name: ARRAY OF CHAR): File;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L142) `  PROCEDURE UpdateHeader(f: File; VAR F: FileDir.FileHeader);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L149) `  PROCEDURE ReadBuf(f: File; buf: Buffer; pos: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L160) `  PROCEDURE WriteBuf(f: File; buf: Buffer);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L186) `  PROCEDURE Buf(f: File; pos: INTEGER): Buffer;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L194) `  PROCEDURE GetBuf(f: File; pos: INTEGER): Buffer;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L209) `  PROCEDURE Unbuffer(f: File);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L235) `  PROCEDURE Register*(f: File);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L245) `  PROCEDURE Close*(f: File);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L250) `  PROCEDURE Purge*(f: File);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L267) `  PROCEDURE Delete*(name: ARRAY OF CHAR; VAR res: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L277) `  PROCEDURE Rename*(old, new: ARRAY OF CHAR; VAR res: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L295) `  PROCEDURE Length*(f: File): INTEGER;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L299) `  PROCEDURE Date*(f: File): INTEGER;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L305) `  PROCEDURE Set*(VAR r: Rider; f: File; pos: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L319) `  PROCEDURE Pos*(VAR r: Rider): INTEGER;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L323) `  PROCEDURE Base*(VAR r: Rider): File;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L327) `  PROCEDURE ReadByte*(VAR r: Rider; VAR x: BYTE);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L344) `  PROCEDURE ReadBytes*(VAR r: Rider; VAR x: ARRAY OF BYTE; n: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L350) `  PROCEDURE Read*(VAR r: Rider; VAR ch: CHAR);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L367) `  PROCEDURE ReadInt*(VAR R: Rider; VAR x: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L373) `  PROCEDURE ReadSet*(VAR R: Rider; VAR s: SET);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L378) `  PROCEDURE ReadReal*(VAR R: Rider; VAR x: REAL);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L383) `  PROCEDURE ReadString*(VAR R: Rider; VAR x: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L393) `  PROCEDURE ReadNum*(VAR R: Rider; VAR x: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L402) `  PROCEDURE NewExt(f: File);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L409) `  PROCEDURE WriteByte*(VAR r: Rider; x: BYTE);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L430) `  PROCEDURE WriteBytes*(VAR r: Rider; x: ARRAY OF BYTE; n: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L436) `  PROCEDURE Write*(VAR r: Rider; ch: CHAR);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L457) `  PROCEDURE WriteInt*(VAR R: Rider; x: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L464) `  PROCEDURE WriteSet*(VAR R: Rider; s: SET);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L468) `  PROCEDURE WriteReal*(VAR R: Rider; x: REAL);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L472) `  PROCEDURE WriteString*(VAR R: Rider; x: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L478) `  PROCEDURE WriteNum*(VAR R: Rider; x: INTEGER);`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L486) `  PROCEDURE Init*;`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L490) `  PROCEDURE RestoreList*; (*after mark phase of garbage collection*)`

[(src)](https://github.com/io-core/Files/blob/main/Files.Mod#L493) `    PROCEDURE mark(f: INTEGER): INTEGER;`
