
## [MODULE Files](https://github.com/io-core/Files/blob/main/Files.Mod)

Procedures:


<code>  PROCEDURE Check(s: ARRAY OF CHAR;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L65)


<code>  PROCEDURE Old*(name: ARRAY OF CHAR): File;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L83)


<code>  PROCEDURE New*(name: ARRAY OF CHAR): File;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L118)


<code>  PROCEDURE UpdateHeader(f: File; VAR F: FileDir.FileHeader);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L142)


<code>  PROCEDURE ReadBuf(f: File; buf: Buffer; pos: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L149)


<code>  PROCEDURE WriteBuf(f: File; buf: Buffer);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L160)


<code>  PROCEDURE Buf(f: File; pos: INTEGER): Buffer;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L186)


<code>  PROCEDURE GetBuf(f: File; pos: INTEGER): Buffer;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L194)


<code>  PROCEDURE Unbuffer(f: File);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L209)


<code>  PROCEDURE Register*(f: File);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L235)


<code>  PROCEDURE Close*(f: File);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L245)


<code>  PROCEDURE Purge*(f: File);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L250)


<code>  PROCEDURE Delete*(name: ARRAY OF CHAR; VAR res: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L267)


<code>  PROCEDURE Rename*(old, new: ARRAY OF CHAR; VAR res: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L277)


<code>  PROCEDURE Length*(f: File): INTEGER;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L295)


<code>  PROCEDURE Date*(f: File): INTEGER;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L299)


<code>  PROCEDURE Set*(VAR r: Rider; f: File; pos: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L305)


<code>  PROCEDURE Pos*(VAR r: Rider): INTEGER;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L319)


<code>  PROCEDURE Base*(VAR r: Rider): File;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L323)


<code>  PROCEDURE ReadByte*(VAR r: Rider; VAR x: BYTE);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L327)


<code>  PROCEDURE ReadBytes*(VAR r: Rider; VAR x: ARRAY OF BYTE; n: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L344)


<code>  PROCEDURE Read*(VAR r: Rider; VAR ch: CHAR);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L350)


<code>  PROCEDURE ReadInt*(VAR R: Rider; VAR x: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L367)


<code>  PROCEDURE ReadSet*(VAR R: Rider; VAR s: SET);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L373)


<code>  PROCEDURE ReadReal*(VAR R: Rider; VAR x: REAL);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L378)


<code>  PROCEDURE ReadString*(VAR R: Rider; VAR x: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L383)


<code>  PROCEDURE ReadNum*(VAR R: Rider; VAR x: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L393)


<code>  PROCEDURE NewExt(f: File);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L402)


<code>  PROCEDURE WriteByte*(VAR r: Rider; x: BYTE);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L409)


<code>  PROCEDURE WriteBytes*(VAR r: Rider; x: ARRAY OF BYTE; n: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L430)


<code>  PROCEDURE Write*(VAR r: Rider; ch: CHAR);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L436)


<code>  PROCEDURE WriteInt*(VAR R: Rider; x: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L457)


<code>  PROCEDURE WriteSet*(VAR R: Rider; s: SET);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L464)


<code>  PROCEDURE WriteReal*(VAR R: Rider; x: REAL);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L468)


<code>  PROCEDURE WriteString*(VAR R: Rider; x: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L472)


<code>  PROCEDURE WriteNum*(VAR R: Rider; x: INTEGER);</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L478)


<code>  PROCEDURE Init*;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L486)


<code>  PROCEDURE RestoreList*; (*after mark phase of garbage collection*)</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L490)


<code>    PROCEDURE mark(f: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L493)

