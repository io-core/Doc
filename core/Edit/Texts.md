
## [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)

Procedures:


<pre>  PROCEDURE Trailer(): Piece;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L81)


<pre>  PROCEDURE Load* (VAR R: Files.Rider; T: Text);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L87)


<pre>  PROCEDURE Open* (T: Text; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L113)


<pre>  PROCEDURE Store* (VAR W: Files.Rider; T: Text);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L131)


<pre>  PROCEDURE Close*(T: Text; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L165)


<pre>  PROCEDURE OpenBuf* (B: Buffer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L173)


<pre>  PROCEDURE FindPiece (T: Text; pos: LONGINT; VAR org: LONGINT; VAR pce: Piece);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L178)


<pre>  PROCEDURE SplitPiece (p: Piece; off: LONGINT; VAR pr: Piece);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L190)


<pre>  PROCEDURE Save* (T: Text; beg, end: LONGINT; B: Buffer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L205)


<pre>  PROCEDURE Copy* (SB, DB: Buffer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L223)


<pre>  PROCEDURE Insert* (T: Text; pos: LONGINT; B: Buffer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L232)


<pre>  PROCEDURE Append* (T: Text; B: Buffer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L251)


<pre>  PROCEDURE Delete* (T: Text; beg, end: LONGINT; B: Buffer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L255)


<pre>  PROCEDURE ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L273)


<pre>  PROCEDURE Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L290)


<pre>  PROCEDURE OpenReader* (VAR R: Reader; T: Text; pos: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L297)


<pre>  PROCEDURE Read* (VAR R: Reader; VAR ch: CHAR);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L304)


<pre>  PROCEDURE Pos* (VAR R: Reader): LONGINT;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L315)


<pre>  PROCEDURE OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L321)


<pre>  PROCEDURE Ten(n: INTEGER): REAL;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L329)


<pre>  PROCEDURE Scan* (VAR S: Scanner);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L339)


<pre>  PROCEDURE OpenWriter* (VAR W: Writer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L406)


<pre>  PROCEDURE SetFont* (VAR W: Writer; fnt: Fonts.Font);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L412)


<pre>  PROCEDURE SetColor* (VAR W: Writer; col: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L416)


<pre>  PROCEDURE SetOffset* (VAR W: Writer; voff: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L420)


<pre>  PROCEDURE Write* (VAR W: Writer; ch: CHAR);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L424)


<pre>  PROCEDURE WriteLn* (VAR W: Writer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L437)


<pre>  PROCEDURE WriteString* (VAR W: Writer; s: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L441)


<pre>  PROCEDURE WriteInt* (VAR W: Writer; x, n: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L447)


<pre>  PROCEDURE WriteHex* (VAR W: Writer; x: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L463)


<pre> PROCEDURE WriteReal* (VAR W: Writer; x: REAL; n: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L474)


<pre>  PROCEDURE WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L504)


<pre>  PROCEDURE WritePair(VAR W: Writer; ch: CHAR; x: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L525)


<pre>  PROCEDURE WriteClock* (VAR W: Writer; d: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L530)

