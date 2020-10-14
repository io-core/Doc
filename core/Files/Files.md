
## [MODULE Files](https://github.com/io-core/Files/blob/main/Files.Mod)

Procedures:

[65](https://github.com/io-core/Files/blob/main/Files.Mod#65) `  PROCEDURE Check(s: ARRAY OF CHAR;`
[83](https://github.com/io-core/Files/blob/main/Files.Mod#83) `  PROCEDURE Old*(name: ARRAY OF CHAR): File;`
[118](https://github.com/io-core/Files/blob/main/Files.Mod#118) `  PROCEDURE New*(name: ARRAY OF CHAR): File;`
[142](https://github.com/io-core/Files/blob/main/Files.Mod#142) `  PROCEDURE UpdateHeader(f: File; VAR F: FileDir.FileHeader);`
[149](https://github.com/io-core/Files/blob/main/Files.Mod#149) `  PROCEDURE ReadBuf(f: File; buf: Buffer; pos: INTEGER);`
[160](https://github.com/io-core/Files/blob/main/Files.Mod#160) `  PROCEDURE WriteBuf(f: File; buf: Buffer);`
[186](https://github.com/io-core/Files/blob/main/Files.Mod#186) `  PROCEDURE Buf(f: File; pos: INTEGER): Buffer;`
[194](https://github.com/io-core/Files/blob/main/Files.Mod#194) `  PROCEDURE GetBuf(f: File; pos: INTEGER): Buffer;`
[209](https://github.com/io-core/Files/blob/main/Files.Mod#209) `  PROCEDURE Unbuffer(f: File);`
[235](https://github.com/io-core/Files/blob/main/Files.Mod#235) `  PROCEDURE Register*(f: File);`
[245](https://github.com/io-core/Files/blob/main/Files.Mod#245) `  PROCEDURE Close*(f: File);`
[250](https://github.com/io-core/Files/blob/main/Files.Mod#250) `  PROCEDURE Purge*(f: File);`
[267](https://github.com/io-core/Files/blob/main/Files.Mod#267) `  PROCEDURE Delete*(name: ARRAY OF CHAR; VAR res: INTEGER);`
[277](https://github.com/io-core/Files/blob/main/Files.Mod#277) `  PROCEDURE Rename*(old, new: ARRAY OF CHAR; VAR res: INTEGER);`
[295](https://github.com/io-core/Files/blob/main/Files.Mod#295) `  PROCEDURE Length*(f: File): INTEGER;`
[299](https://github.com/io-core/Files/blob/main/Files.Mod#299) `  PROCEDURE Date*(f: File): INTEGER;`
[305](https://github.com/io-core/Files/blob/main/Files.Mod#305) `  PROCEDURE Set*(VAR r: Rider; f: File; pos: INTEGER);`
[319](https://github.com/io-core/Files/blob/main/Files.Mod#319) `  PROCEDURE Pos*(VAR r: Rider): INTEGER;`
[323](https://github.com/io-core/Files/blob/main/Files.Mod#323) `  PROCEDURE Base*(VAR r: Rider): File;`
[327](https://github.com/io-core/Files/blob/main/Files.Mod#327) `  PROCEDURE ReadByte*(VAR r: Rider; VAR x: BYTE);`
[344](https://github.com/io-core/Files/blob/main/Files.Mod#344) `  PROCEDURE ReadBytes*(VAR r: Rider; VAR x: ARRAY OF BYTE; n: INTEGER);`
[350](https://github.com/io-core/Files/blob/main/Files.Mod#350) `  PROCEDURE Read*(VAR r: Rider; VAR ch: CHAR);`
[367](https://github.com/io-core/Files/blob/main/Files.Mod#367) `  PROCEDURE ReadInt*(VAR R: Rider; VAR x: INTEGER);`
[373](https://github.com/io-core/Files/blob/main/Files.Mod#373) `  PROCEDURE ReadSet*(VAR R: Rider; VAR s: SET);`
[378](https://github.com/io-core/Files/blob/main/Files.Mod#378) `  PROCEDURE ReadReal*(VAR R: Rider; VAR x: REAL);`
[383](https://github.com/io-core/Files/blob/main/Files.Mod#383) `  PROCEDURE ReadString*(VAR R: Rider; VAR x: ARRAY OF CHAR);`
[393](https://github.com/io-core/Files/blob/main/Files.Mod#393) `  PROCEDURE ReadNum*(VAR R: Rider; VAR x: INTEGER);`
[402](https://github.com/io-core/Files/blob/main/Files.Mod#402) `  PROCEDURE NewExt(f: File);`
[409](https://github.com/io-core/Files/blob/main/Files.Mod#409) `  PROCEDURE WriteByte*(VAR r: Rider; x: BYTE);`
[430](https://github.com/io-core/Files/blob/main/Files.Mod#430) `  PROCEDURE WriteBytes*(VAR r: Rider; x: ARRAY OF BYTE; n: INTEGER);`
[436](https://github.com/io-core/Files/blob/main/Files.Mod#436) `  PROCEDURE Write*(VAR r: Rider; ch: CHAR);`
[457](https://github.com/io-core/Files/blob/main/Files.Mod#457) `  PROCEDURE WriteInt*(VAR R: Rider; x: INTEGER);`
[464](https://github.com/io-core/Files/blob/main/Files.Mod#464) `  PROCEDURE WriteSet*(VAR R: Rider; s: SET);`
[468](https://github.com/io-core/Files/blob/main/Files.Mod#468) `  PROCEDURE WriteReal*(VAR R: Rider; x: REAL);`
[472](https://github.com/io-core/Files/blob/main/Files.Mod#472) `  PROCEDURE WriteString*(VAR R: Rider; x: ARRAY OF CHAR);`
[478](https://github.com/io-core/Files/blob/main/Files.Mod#478) `  PROCEDURE WriteNum*(VAR R: Rider; x: INTEGER);`
[486](https://github.com/io-core/Files/blob/main/Files.Mod#486) `  PROCEDURE Init*;`
[490](https://github.com/io-core/Files/blob/main/Files.Mod#490) `  PROCEDURE RestoreList*; (*after mark phase of garbage collection*)`
[493](https://github.com/io-core/Files/blob/main/Files.Mod#493) `    PROCEDURE mark(f: INTEGER): INTEGER;`
