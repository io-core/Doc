
## [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)

Procedures:

[81](https://github.com/io-core/Edit/blob/main/Texts.Mod#81) `  PROCEDURE Trailer(): Piece;`
[87](https://github.com/io-core/Edit/blob/main/Texts.Mod#87) `  PROCEDURE Load* (VAR R: Files.Rider; T: Text);`
[113](https://github.com/io-core/Edit/blob/main/Texts.Mod#113) `  PROCEDURE Open* (T: Text; name: ARRAY OF CHAR);`
[131](https://github.com/io-core/Edit/blob/main/Texts.Mod#131) `  PROCEDURE Store* (VAR W: Files.Rider; T: Text);`
[165](https://github.com/io-core/Edit/blob/main/Texts.Mod#165) `  PROCEDURE Close*(T: Text; name: ARRAY OF CHAR);`
[173](https://github.com/io-core/Edit/blob/main/Texts.Mod#173) `  PROCEDURE OpenBuf* (B: Buffer);`
[178](https://github.com/io-core/Edit/blob/main/Texts.Mod#178) `  PROCEDURE FindPiece (T: Text; pos: LONGINT; VAR org: LONGINT; VAR pce: Piece);`
[190](https://github.com/io-core/Edit/blob/main/Texts.Mod#190) `  PROCEDURE SplitPiece (p: Piece; off: LONGINT; VAR pr: Piece);`
[205](https://github.com/io-core/Edit/blob/main/Texts.Mod#205) `  PROCEDURE Save* (T: Text; beg, end: LONGINT; B: Buffer);`
[223](https://github.com/io-core/Edit/blob/main/Texts.Mod#223) `  PROCEDURE Copy* (SB, DB: Buffer);`
[232](https://github.com/io-core/Edit/blob/main/Texts.Mod#232) `  PROCEDURE Insert* (T: Text; pos: LONGINT; B: Buffer);`
[251](https://github.com/io-core/Edit/blob/main/Texts.Mod#251) `  PROCEDURE Append* (T: Text; B: Buffer);`
[255](https://github.com/io-core/Edit/blob/main/Texts.Mod#255) `  PROCEDURE Delete* (T: Text; beg, end: LONGINT; B: Buffer);`
[273](https://github.com/io-core/Edit/blob/main/Texts.Mod#273) `  PROCEDURE ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER);`
[290](https://github.com/io-core/Edit/blob/main/Texts.Mod#290) `  PROCEDURE Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER);`
[297](https://github.com/io-core/Edit/blob/main/Texts.Mod#297) `  PROCEDURE OpenReader* (VAR R: Reader; T: Text; pos: LONGINT);`
[304](https://github.com/io-core/Edit/blob/main/Texts.Mod#304) `  PROCEDURE Read* (VAR R: Reader; VAR ch: CHAR);`
[315](https://github.com/io-core/Edit/blob/main/Texts.Mod#315) `  PROCEDURE Pos* (VAR R: Reader): LONGINT;`
[321](https://github.com/io-core/Edit/blob/main/Texts.Mod#321) `  PROCEDURE OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT);`
[329](https://github.com/io-core/Edit/blob/main/Texts.Mod#329) `  PROCEDURE Ten(n: INTEGER): REAL;`
[339](https://github.com/io-core/Edit/blob/main/Texts.Mod#339) `  PROCEDURE Scan* (VAR S: Scanner);`
[406](https://github.com/io-core/Edit/blob/main/Texts.Mod#406) `  PROCEDURE OpenWriter* (VAR W: Writer);`
[412](https://github.com/io-core/Edit/blob/main/Texts.Mod#412) `  PROCEDURE SetFont* (VAR W: Writer; fnt: Fonts.Font);`
[416](https://github.com/io-core/Edit/blob/main/Texts.Mod#416) `  PROCEDURE SetColor* (VAR W: Writer; col: INTEGER);`
[420](https://github.com/io-core/Edit/blob/main/Texts.Mod#420) `  PROCEDURE SetOffset* (VAR W: Writer; voff: INTEGER);`
[424](https://github.com/io-core/Edit/blob/main/Texts.Mod#424) `  PROCEDURE Write* (VAR W: Writer; ch: CHAR);`
[437](https://github.com/io-core/Edit/blob/main/Texts.Mod#437) `  PROCEDURE WriteLn* (VAR W: Writer);`
[441](https://github.com/io-core/Edit/blob/main/Texts.Mod#441) `  PROCEDURE WriteString* (VAR W: Writer; s: ARRAY OF CHAR);`
[447](https://github.com/io-core/Edit/blob/main/Texts.Mod#447) `  PROCEDURE WriteInt* (VAR W: Writer; x, n: LONGINT);`
[463](https://github.com/io-core/Edit/blob/main/Texts.Mod#463) `  PROCEDURE WriteHex* (VAR W: Writer; x: LONGINT);`
[474](https://github.com/io-core/Edit/blob/main/Texts.Mod#474) ` PROCEDURE WriteReal* (VAR W: Writer; x: REAL; n: INTEGER);`
[504](https://github.com/io-core/Edit/blob/main/Texts.Mod#504) `  PROCEDURE WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER);`
[525](https://github.com/io-core/Edit/blob/main/Texts.Mod#525) `  PROCEDURE WritePair(VAR W: Writer; ch: CHAR; x: LONGINT);`
[530](https://github.com/io-core/Edit/blob/main/Texts.Mod#530) `  PROCEDURE WriteClock* (VAR W: Writer; d: LONGINT);`
