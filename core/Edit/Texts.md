
## [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)

Procedures:


<code>  PROCEDURE Trailer(): Piece;</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L81)


<code>  PROCEDURE Load* (VAR R: Files.Rider; T: Text);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L87)


<code>  PROCEDURE Open* (T: Text; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L113)


<code>  PROCEDURE Store* (VAR W: Files.Rider; T: Text);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L131)


<code>  PROCEDURE Close*(T: Text; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L165)


<code>  PROCEDURE OpenBuf* (B: Buffer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L173)


<code>  PROCEDURE FindPiece (T: Text; pos: LONGINT; VAR org: LONGINT; VAR pce: Piece);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L178)


<code>  PROCEDURE SplitPiece (p: Piece; off: LONGINT; VAR pr: Piece);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L190)


<code>  PROCEDURE Save* (T: Text; beg, end: LONGINT; B: Buffer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L205)


<code>  PROCEDURE Copy* (SB, DB: Buffer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L223)


<code>  PROCEDURE Insert* (T: Text; pos: LONGINT; B: Buffer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L232)


<code>  PROCEDURE Append* (T: Text; B: Buffer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L251)


<code>  PROCEDURE Delete* (T: Text; beg, end: LONGINT; B: Buffer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L255)


<code>  PROCEDURE ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L273)


<code>  PROCEDURE Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L290)


<code>  PROCEDURE OpenReader* (VAR R: Reader; T: Text; pos: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L297)


<code>  PROCEDURE Read* (VAR R: Reader; VAR ch: CHAR);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L304)


<code>  PROCEDURE Pos* (VAR R: Reader): LONGINT;</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L315)


<code>  PROCEDURE OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L321)


<code>  PROCEDURE Ten(n: INTEGER): REAL;</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L329)


<code>  PROCEDURE Scan* (VAR S: Scanner);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L339)


<code>  PROCEDURE OpenWriter* (VAR W: Writer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L406)


<code>  PROCEDURE SetFont* (VAR W: Writer; fnt: Fonts.Font);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L412)


<code>  PROCEDURE SetColor* (VAR W: Writer; col: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L416)


<code>  PROCEDURE SetOffset* (VAR W: Writer; voff: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L420)


<code>  PROCEDURE Write* (VAR W: Writer; ch: CHAR);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L424)


<code>  PROCEDURE WriteLn* (VAR W: Writer);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L437)


<code>  PROCEDURE WriteString* (VAR W: Writer; s: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L441)


<code>  PROCEDURE WriteInt* (VAR W: Writer; x, n: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L447)


<code>  PROCEDURE WriteHex* (VAR W: Writer; x: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L463)


<code> PROCEDURE WriteReal* (VAR W: Writer; x: REAL; n: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L474)


<code>  PROCEDURE WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L504)


<code>  PROCEDURE WritePair(VAR W: Writer; ch: CHAR; x: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L525)


<code>  PROCEDURE WriteClock* (VAR W: Writer; d: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L530)

