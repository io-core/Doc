
## [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)

Procedures:

[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L81) `  PROCEDURE Trailer(): Piece;`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L87) `  PROCEDURE Load* (VAR R: Files.Rider; T: Text);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L113) `  PROCEDURE Open* (T: Text; name: ARRAY OF CHAR);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L131) `  PROCEDURE Store* (VAR W: Files.Rider; T: Text);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L165) `  PROCEDURE Close*(T: Text; name: ARRAY OF CHAR);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L173) `  PROCEDURE OpenBuf* (B: Buffer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L178) `  PROCEDURE FindPiece (T: Text; pos: LONGINT; VAR org: LONGINT; VAR pce: Piece);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L190) `  PROCEDURE SplitPiece (p: Piece; off: LONGINT; VAR pr: Piece);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L205) `  PROCEDURE Save* (T: Text; beg, end: LONGINT; B: Buffer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L223) `  PROCEDURE Copy* (SB, DB: Buffer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L232) `  PROCEDURE Insert* (T: Text; pos: LONGINT; B: Buffer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L251) `  PROCEDURE Append* (T: Text; B: Buffer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L255) `  PROCEDURE Delete* (T: Text; beg, end: LONGINT; B: Buffer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L273) `  PROCEDURE ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L290) `  PROCEDURE Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L297) `  PROCEDURE OpenReader* (VAR R: Reader; T: Text; pos: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L304) `  PROCEDURE Read* (VAR R: Reader; VAR ch: CHAR);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L315) `  PROCEDURE Pos* (VAR R: Reader): LONGINT;`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L321) `  PROCEDURE OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L329) `  PROCEDURE Ten(n: INTEGER): REAL;`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L339) `  PROCEDURE Scan* (VAR S: Scanner);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L406) `  PROCEDURE OpenWriter* (VAR W: Writer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L412) `  PROCEDURE SetFont* (VAR W: Writer; fnt: Fonts.Font);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L416) `  PROCEDURE SetColor* (VAR W: Writer; col: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L420) `  PROCEDURE SetOffset* (VAR W: Writer; voff: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L424) `  PROCEDURE Write* (VAR W: Writer; ch: CHAR);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L437) `  PROCEDURE WriteLn* (VAR W: Writer);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L441) `  PROCEDURE WriteString* (VAR W: Writer; s: ARRAY OF CHAR);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L447) `  PROCEDURE WriteInt* (VAR W: Writer; x, n: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L463) `  PROCEDURE WriteHex* (VAR W: Writer; x: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L474) ` PROCEDURE WriteReal* (VAR W: Writer; x: REAL; n: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L504) `  PROCEDURE WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L525) `  PROCEDURE WritePair(VAR W: Writer; ch: CHAR; x: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/Texts.Mod#L530) `  PROCEDURE WriteClock* (VAR W: Writer; d: LONGINT);`
