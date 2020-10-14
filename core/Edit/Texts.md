
#### [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)

Procedures:

```
  PROCEDURE Trailer(): Piece;
```
```
  PROCEDURE Load* (VAR R: Files.Rider; T: Text);
```
```
  PROCEDURE Open* (T: Text; name: ARRAY OF CHAR);
```
```
  PROCEDURE Store* (VAR W: Files.Rider; T: Text);
```
```
  PROCEDURE Close*(T: Text; name: ARRAY OF CHAR);
```
```
  PROCEDURE OpenBuf* (B: Buffer);
```
```
  PROCEDURE FindPiece (T: Text; pos: LONGINT; VAR org: LONGINT; VAR pce: Piece);
```
```
  PROCEDURE SplitPiece (p: Piece; off: LONGINT; VAR pr: Piece);
```
```
  PROCEDURE Save* (T: Text; beg, end: LONGINT; B: Buffer);
```
```
  PROCEDURE Copy* (SB, DB: Buffer);
```
```
  PROCEDURE Insert* (T: Text; pos: LONGINT; B: Buffer);
```
```
  PROCEDURE Append* (T: Text; B: Buffer);
```
```
  PROCEDURE Delete* (T: Text; beg, end: LONGINT; B: Buffer);
```
```
  PROCEDURE ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER);
```
```
  PROCEDURE Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER);
```
```
  PROCEDURE OpenReader* (VAR R: Reader; T: Text; pos: LONGINT);
```
```
  PROCEDURE Read* (VAR R: Reader; VAR ch: CHAR);
```
```
  PROCEDURE Pos* (VAR R: Reader): LONGINT;
```
```
  PROCEDURE OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT);
```
```
  PROCEDURE Ten(n: INTEGER): REAL;
```
```
  PROCEDURE Scan* (VAR S: Scanner);
```
```
  PROCEDURE OpenWriter* (VAR W: Writer);
```
```
  PROCEDURE SetFont* (VAR W: Writer; fnt: Fonts.Font);
```
```
  PROCEDURE SetColor* (VAR W: Writer; col: INTEGER);
```
```
  PROCEDURE SetOffset* (VAR W: Writer; voff: INTEGER);
```
```
  PROCEDURE Write* (VAR W: Writer; ch: CHAR);
```
```
  PROCEDURE WriteLn* (VAR W: Writer);
```
```
  PROCEDURE WriteString* (VAR W: Writer; s: ARRAY OF CHAR);
```
```
  PROCEDURE WriteInt* (VAR W: Writer; x, n: LONGINT);
```
```
  PROCEDURE WriteHex* (VAR W: Writer; x: LONGINT);
```
```
 PROCEDURE WriteReal* (VAR W: Writer; x: REAL; n: INTEGER);
```
```
  PROCEDURE WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER);
```
```
  PROCEDURE WritePair(VAR W: Writer; ch: CHAR; x: LONGINT);
```
```
  PROCEDURE WriteClock* (VAR W: Writer; d: LONGINT);
```
