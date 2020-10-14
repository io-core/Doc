
## [MODULE Files](https://github.com/io-core/Files/blob/main/Files.Mod)

Procedures:


<pre>  PROCEDURE Check(s: ARRAY OF CHAR;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L65)


<pre>  PROCEDURE Old*(name: ARRAY OF CHAR): File;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L83)


<pre>  PROCEDURE New*(name: ARRAY OF CHAR): File;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L118)


<pre>  PROCEDURE UpdateHeader(f: File; VAR F: FileDir.FileHeader);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L142)


<pre>  PROCEDURE ReadBuf(f: File; buf: Buffer; pos: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L149)


<pre>  PROCEDURE WriteBuf(f: File; buf: Buffer);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L160)


<pre>  PROCEDURE Buf(f: File; pos: INTEGER): Buffer;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L186)


<pre>  PROCEDURE GetBuf(f: File; pos: INTEGER): Buffer;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L194)


<pre>  PROCEDURE Unbuffer(f: File);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L209)


<pre>  PROCEDURE Register*(f: File);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L235)


<pre>  PROCEDURE Close*(f: File);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L245)


<pre>  PROCEDURE Purge*(f: File);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L250)


<pre>  PROCEDURE Delete*(name: ARRAY OF CHAR; VAR res: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L267)


<pre>  PROCEDURE Rename*(old, new: ARRAY OF CHAR; VAR res: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L277)


<pre>  PROCEDURE Length*(f: File): INTEGER;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L295)


<pre>  PROCEDURE Date*(f: File): INTEGER;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L299)


<pre>  PROCEDURE Set*(VAR r: Rider; f: File; pos: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L305)


<pre>  PROCEDURE Pos*(VAR r: Rider): INTEGER;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L319)


<pre>  PROCEDURE Base*(VAR r: Rider): File;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L323)


<pre>  PROCEDURE ReadByte*(VAR r: Rider; VAR x: BYTE);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L327)


<pre>  PROCEDURE ReadBytes*(VAR r: Rider; VAR x: ARRAY OF BYTE; n: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L344)


<pre>  PROCEDURE Read*(VAR r: Rider; VAR ch: CHAR);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L350)


<pre>  PROCEDURE ReadInt*(VAR R: Rider; VAR x: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L367)


<pre>  PROCEDURE ReadSet*(VAR R: Rider; VAR s: SET);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L373)


<pre>  PROCEDURE ReadReal*(VAR R: Rider; VAR x: REAL);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L378)


<pre>  PROCEDURE ReadString*(VAR R: Rider; VAR x: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L383)


<pre>  PROCEDURE ReadNum*(VAR R: Rider; VAR x: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L393)


<pre>  PROCEDURE NewExt(f: File);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L402)


<pre>  PROCEDURE WriteByte*(VAR r: Rider; x: BYTE);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L409)


<pre>  PROCEDURE WriteBytes*(VAR r: Rider; x: ARRAY OF BYTE; n: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L430)


<pre>  PROCEDURE Write*(VAR r: Rider; ch: CHAR);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L436)


<pre>  PROCEDURE WriteInt*(VAR R: Rider; x: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L457)


<pre>  PROCEDURE WriteSet*(VAR R: Rider; s: SET);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L464)


<pre>  PROCEDURE WriteReal*(VAR R: Rider; x: REAL);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L468)


<pre>  PROCEDURE WriteString*(VAR R: Rider; x: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L472)


<pre>  PROCEDURE WriteNum*(VAR R: Rider; x: INTEGER);</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L478)


<pre>  PROCEDURE Init*;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L486)


<pre>  PROCEDURE RestoreList*; (*after mark phase of garbage collection*)</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L490)


<pre>    PROCEDURE mark(f: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Files/blob/main/Files.Mod#L493)

