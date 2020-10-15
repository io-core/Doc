
## [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)

  ## Imports:
` Files Input Fonts`

  ## Constants:
```
 (*scanner symbol classes*)
    Inval* = 0;         (*invalid symbol*)
    Name* = 1;          (*name s (length len)*)
    String* = 2;        (*literal string s (length len)*)
    Int* = 3;           (*integer i (decimal or hexadecimal)*)
    Real* = 4;          (*real number x*)
    Char* = 6;          (*special character c*)

    (* TextBlock = TextTag offset run {run} "0" len {AsciiCode}.
      run = fnt [name] col voff len. *)

    TAB = Input.TAB; CR = Input.CR;
    TextTag = 0F1X;
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

    ## Constants:
```
 maxExp = 38; maxM = 16777216; (*2^24*)
    VAR ch: CHAR;
      neg, negE, hex: BOOLEAN;
      i, j, h, d, e, n, s: INTEGER;
      x: REAL;
  BEGIN ch := S.nextCh; i := 0;
    WHILE (ch = " ") OR (ch = TAB) OR (ch = CR) DO
      IF ch = CR THEN INC(S.line) END ;
      Read(S, ch)
    END ;
    IF ("A" <= ch) & (ch <= "Z") OR ("a" <= ch) & (ch <= "z") THEN (*name*)
      REPEAT S.s[i] := ch; INC(i); Read(S, ch)
      UNTIL ((ch < "0") & (ch # ".") OR ("9" < ch) & (ch < "A") OR ("Z" < ch) & (ch < "a") OR ("z" < ch)) OR (i = 31);
      S.s[i] := 0X; S.len := i; S.class := Name
    ELSIF ch = 22X THEN (*string*)
      Read(S, ch);
      WHILE (ch # 22X) & (ch >= " ") & (i # 31) DO S.s[i] := ch; INC(i); Read(S, ch) END;
      S.s[i] := 0X; S.len := i+1; Read(S, ch); S.class := String
    ELSE hex := FALSE;
      IF ch = "-" THEN neg := TRUE; Read(S, ch) ELSE neg := FALSE END ;
      IF ("0" <= ch) & (ch <= "9") THEN (*number*)
        n := ORD(ch) - 30H; h := n; Read(S, ch);
        WHILE ("0" <= ch) & (ch <= "9") OR ("A" <= ch) & (ch <= "F") DO
          IF ch <= "9" THEN d := ORD(ch) - 30H ELSE d := ORD(ch) - 37H; hex := TRUE END ;
          n := 10*n + d; h := 10H*h + d; Read(S, ch)
        END ;
        IF ch = "H" THEN (*hex integer*) Read(S, ch); S.i := h; S.class := Int  (*neg?*)
        ELSIF ch = "." THEN (*real number*)
          Read(S, ch); x := 0.0; e := 0; j := 0;
          WHILE ("0" <= ch) & (ch <= "9") DO  (*fraction*)
            h := 10*n + (ORD(ch) - 30H);
            IF h < maxM THEN n := h; INC(j) END ;
            Read(S, ch)
          END ;
          IF ch = "E" THEN (*scale factor*)
            s := 0; Read(S, ch);
            IF ch = "-" THEN negE := TRUE; Read(S, ch)
            ELSE negE := FALSE;
              IF ch = "+" THEN Read(S, ch) END
            END ;
            WHILE ("0" <= ch) & (ch <= "9") DO
              s := s*10 + ORD(ch) - 30H; Read(S, ch)
            END ;
            IF negE THEN DEC(e, s) ELSE INC(e, s) END ;
          END ;
          x := FLT(n); DEC(e, j);
          IF e < 0 THEN
            IF e >= -maxExp THEN x := x / Ten(-e) ELSE x := 0.0 END
          ELSIF e > 0 THEN
            IF e <= maxExp THEN x := Ten(e) * x ELSE x := 0.0 END
          END ;
          IF neg THEN S.x := -x ELSE S.x := x END ;
          IF hex THEN S.class := 0 ELSE S.class := Real END
        ELSE (*decimal integer*)
          IF neg THEN S.i := -n ELSE S.i := n END;
          IF hex THEN S.class := Inval ELSE S.class := Int END
        END
      ELSE (*spectal character*) S.class := Char;
        IF neg THEN S.c := "-" ELSE S.c := ch; Read(S, ch) END
      END
    END ;
    S.nextCh := ch
  END Scan;

  (* --------------- Access: Writers (NW) ------------------ *)

  PROCEDURE OpenWriter* (VAR W: Writer);
  BEGIN NEW(W.buf);
    OpenBuf(W.buf); W.fnt := Fonts.Default; W.col := 15; W.voff := 0;
    Files.Set(W.rider, Files.New(""), 0)
  END OpenWriter;

  PROCEDURE SetFont* (VAR W: Writer; fnt: Fonts.Font);
  BEGIN W.fnt := fnt
  END SetFont;

  PROCEDURE SetColor* (VAR W: Writer; col: INTEGER);
  BEGIN W.col := col
  END SetColor;

  PROCEDURE SetOffset* (VAR W: Writer; voff: INTEGER);
  BEGIN W.voff := voff
  END SetOffset;

  PROCEDURE Write* (VAR W: Writer; ch: CHAR);
    VAR p: Piece;
  BEGIN
    IF (W.buf.last.fnt # W.fnt) OR (W.buf.last.col # W.col) OR (W.buf.last.voff # W.voff) THEN
      NEW(p); p.f := Files.Base(W.rider); p.off := Files.Pos(W.rider); p.len := 0;
      p.fnt := W.fnt; p.col := W.col; p.voff:= W.voff;
      p.next := NIL; W.buf.last.next := p;
      p.prev := W.buf.last; W.buf.last := p
    END;
    Files.Write(W.rider, ch);
    INC(W.buf.last.len); INC(W.buf.len)
  END Write;

  PROCEDURE WriteLn* (VAR W: Writer);
  BEGIN Write(W, CR)
  END WriteLn;

  PROCEDURE WriteString* (VAR W: Writer; s: ARRAY OF CHAR);
    VAR i: INTEGER;
  BEGIN i := 0;
    WHILE s[i] >= " " DO Write(W, s[i]); INC(i) END
  END WriteString;

  PROCEDURE WriteInt* (VAR W: Writer; x, n: LONGINT);
    VAR i: INTEGER; x0: LONGINT;
      a: ARRAY 10 OF CHAR;
  BEGIN
    IF ROR(x, 31) = 1 THEN WriteString(W, " -2147483648")
    ELSE i := 0;
      IF x < 0 THEN DEC(n); x0 := -x ELSE x0 := x END;
      REPEAT
        a[i] := CHR(x0 MOD 10 + 30H); x0 := x0 DIV 10; INC(i)
      UNTIL x0 = 0;
      WHILE n > i DO Write(W, " "); DEC(n) END;
      IF x < 0 THEN Write(W, "-") END;
      REPEAT DEC(i); Write(W, a[i]) UNTIL i = 0
    END
  END WriteInt;

  PROCEDURE WriteHex* (VAR W: Writer; x: LONGINT);
    VAR i: INTEGER; y: LONGINT;
      a: ARRAY 10 OF CHAR;
  BEGIN i := 0; Write(W, " ");
    REPEAT y := x MOD 10H;
      IF y < 10 THEN a[i] := CHR(y + 30H) ELSE a[i] := CHR(y + 37H) END;
      x := x DIV 10H; INC(i)
    UNTIL i = 8;
    REPEAT DEC(i); Write(W, a[i]) UNTIL i = 0
  END WriteHex;

 PROCEDURE WriteReal* (VAR W: Writer; x: REAL; n: INTEGER);
    VAR e, i, k, m: INTEGER;
      d: ARRAY 16 OF CHAR;
  BEGIN e := ASR(ORD(x), 23) MOD 100H;  (*binary exponent*)
    IF e = 0 THEN
      WriteString(W, "  0 ");
      WHILE n >= 3 DO Write(W, " "); DEC(n) END
    ELSIF e = 255 THEN WriteString(W, " NaN ")
    ELSE Write(W, " ");
      WHILE n >= 15 DO DEC(n); Write(W, " ") END ;
      (* 2 < n < 9 digits to be written*)
      IF x < 0.0 THEN Write(W, "-"); x := -x ELSE Write(W, " ") END ;
      e := (e - 127) * 77 DIV 256 - 6;  (*decimal exponent*)
      IF e >= 0 THEN x := x / Ten(e) ELSE x := Ten(-e) * x END ;
      m := FLOOR(x + 0.5);
      IF m >= 10000000 THEN INC(e); m := m DIV 10 END ;
      i := 0; k := 13-n;
      REPEAT
        IF i = k THEN INC(m, 5) END ;    (*rounding*)
        d[i] := CHR(m MOD 10 + 30H); m := m DIV 10; INC(i)
      UNTIL m = 0;
      DEC(i); Write(W, d[i]); Write(W, ".");
      IF i < n-7 THEN n := 0 ELSE n := 14 - n END ;
      WHILE i > n DO DEC(i); Write(W, d[i]) END ;
      Write(W, "E"); INC(e, 6);
       IF e < 0 THEN Write(W, "-"); e := -e ELSE Write(W, "+") END ;
      Write(W, CHR(e DIV 10 + 30H)); Write(W, CHR(e MOD 10 + 30H))
    END
  END WriteReal;

  PROCEDURE WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER);
    VAR i, m: INTEGER; neg: BOOLEAN;
      d: ARRAY 12 OF CHAR;
  BEGIN
    IF x = 0.0 THEN WriteString(W, "  0")
    ELSE
      IF x < 0.0 THEN x := -x; neg := TRUE ELSE neg := FALSE END ;
      IF k > 7 THEN k := 7 END ;
      x := Ten(k) * x; m := FLOOR(x + 0.5);
      i := 0;
      REPEAT d[i] := CHR(m MOD 10 + 30H); m := m DIV 10; INC(i) UNTIL m = 0;
      Write(W, " ");
      WHILE n > i+3 DO  Write(W, " "); DEC(n) END ;
      IF neg THEN Write(W, "-"); DEC(n) ELSE Write(W, " ") END ;
      WHILE i > k DO DEC(i); Write(W, d[i]) END ;
      Write(W, ".");
      WHILE k > i DO DEC(k); Write(W, "0") END ;
      WHILE i > 0 DO DEC(i); Write(W, d[i]) END
    END
  END WriteRealFix;

  PROCEDURE WritePair(VAR W: Writer; ch: CHAR; x: LONGINT);
  BEGIN Write(W, ch);
    Write(W, CHR(x DIV 10 + 30H)); Write(W, CHR(x MOD 10 + 30H))
  END WritePair;

  PROCEDURE WriteClock* (VAR W: Writer; d: LONGINT);
  BEGIN
    WritePair(W, " ", d DIV 20000H MOD 20H);   (*day*)
    WritePair(W, ".", d DIV 400000H MOD 10H); (*month*)
    WritePair(W, ".", d DIV 4000000H MOD 40H);   (*year*)
    WritePair(W, " ", d DIV 1000H MOD 20H);   (*hour*)
    WritePair(W, ":", d DIV 40H MOD 40H);  (*min*)
    WritePair(W, ":", d MOD 40H)  (*sec*)
  END WriteClock;

BEGIN TrailerFile := Files.New("")
END Texts.
```
  ## Types:
```
 Piece = POINTER TO PieceDesc;
    PieceDesc = RECORD
      f: Files.File;
      off, len: LONGINT;
      fnt: Fonts.Font;
      col, voff: INTEGER;
      prev, next: Piece
    END;

    Text* = POINTER TO TextDesc;
    Notifier* = PROCEDURE (T: Text; op: INTEGER; beg, end: LONGINT);
    TextDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      notify*: Notifier;
      trailer: Piece;
      pce: Piece;  (*cache*)
      org: LONGINT (*cache*)
    END;

    Reader* = RECORD
      eot*: BOOLEAN;
      fnt*: Fonts.Font;
      col*, voff*: INTEGER;
      ref: Piece;
      org: LONGINT;
      off: LONGINT;
      rider: Files.Rider
    END;

    Scanner* = RECORD (Reader)
      nextCh*: CHAR;
      line*, class*: INTEGER;
      i*: LONGINT;
      x*: REAL;
      y*: LONGREAL;
      c*: CHAR;
      len*: INTEGER;
      s*: ARRAY 32 OF CHAR
    END;

    Buffer* = POINTER TO BufDesc;
    BufDesc* = RECORD
      len*: LONGINT;
      header, last: Piece
    END;

    Writer* = RECORD
      buf*: Buffer;
      fnt*: Fonts.Font;
      col*, voff*: INTEGER;
      rider: Files.Rider
    END;     

```
## Procedures:
---

`  PROCEDURE Trailer(): Piece;` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L81)


`  PROCEDURE Load* (VAR R: Files.Rider; T: Text);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L87)


`  PROCEDURE Open* (T: Text; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L113)


`  PROCEDURE Store* (VAR W: Files.Rider; T: Text);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L131)


`  PROCEDURE Close*(T: Text; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L165)


`  PROCEDURE OpenBuf* (B: Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L173)


`  PROCEDURE FindPiece (T: Text; pos: LONGINT; VAR org: LONGINT; VAR pce: Piece);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L178)


`  PROCEDURE SplitPiece (p: Piece; off: LONGINT; VAR pr: Piece);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L190)


`  PROCEDURE Save* (T: Text; beg, end: LONGINT; B: Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L205)


`  PROCEDURE Copy* (SB, DB: Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L223)


`  PROCEDURE Insert* (T: Text; pos: LONGINT; B: Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L232)


`  PROCEDURE Append* (T: Text; B: Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L251)


`  PROCEDURE Delete* (T: Text; beg, end: LONGINT; B: Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L255)


`  PROCEDURE ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L273)


`  PROCEDURE Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L290)


`  PROCEDURE OpenReader* (VAR R: Reader; T: Text; pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L297)


`  PROCEDURE Read* (VAR R: Reader; VAR ch: CHAR);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L304)


`  PROCEDURE Pos* (VAR R: Reader): LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L315)


`  PROCEDURE OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L321)


`  PROCEDURE Ten(n: INTEGER): REAL;` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L329)


`  PROCEDURE Scan* (VAR S: Scanner);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L339)


`  PROCEDURE OpenWriter* (VAR W: Writer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L406)


`  PROCEDURE SetFont* (VAR W: Writer; fnt: Fonts.Font);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L412)


`  PROCEDURE SetColor* (VAR W: Writer; col: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L416)


`  PROCEDURE SetOffset* (VAR W: Writer; voff: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L420)


`  PROCEDURE Write* (VAR W: Writer; ch: CHAR);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L424)


`  PROCEDURE WriteLn* (VAR W: Writer);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L437)


`  PROCEDURE WriteString* (VAR W: Writer; s: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L441)


`  PROCEDURE WriteInt* (VAR W: Writer; x, n: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L447)


`  PROCEDURE WriteHex* (VAR W: Writer; x: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L463)


` PROCEDURE WriteReal* (VAR W: Writer; x: REAL; n: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L474)


`  PROCEDURE WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L504)


`  PROCEDURE WritePair(VAR W: Writer; ch: CHAR; x: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L525)


`  PROCEDURE WriteClock* (VAR W: Writer; d: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod#L530)

