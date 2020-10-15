
## [MODULE ORS](https://github.com/io-core/Build/blob/main/ORS.Mod)

(NW 19.9.93 / 20.3.2017  Scanner in Oberon-07)

**ORS** is called from ORP, ORG, and ORB and converts the source text to symbols for their consumption.

Oberon Scanner does lexical analysis. Input is Oberon-Text, output is
sequence of symbols, i.e identifiers, numbers, strings, and special symbols.
Recognises all Oberon keywords and skips comments. The keywords are recorded in a table.

`Get(sym)` delivers next symbol from input text with Reader R.

`Mark(msg)` records error and delivers error message with Writer W.

If Get delivers ident, then the identifier (a string) is in variable id, 
if int or char in ival, if real in rval, and if string in str (and slen) *)


  ## Imports:
` SYSTEM Texts Oberon`

  ## Constants:
```
 IdLen* = 32;
    NKW = 35;  (*nof keywords*)
    maxExp = 38; stringBufSize = 256;
  
    (*lexical symbols*)
    null = 0; times* = 1; rdiv* = 2; div* = 3; mod* = 4;
    and* = 5; plus* = 6; minus* = 7; or* = 8; eql* = 9;
    neq* = 10; lss* = 11; leq* = 12; gtr* = 13; geq* = 14;
    in* = 15; is* = 16; arrow* = 17; period* = 18;
    char* = 20; int* = 21; real* = 22; false* = 23; true* = 24;
    nil* = 25; string* = 26; not* = 27; lparen* = 28; lbrak* = 29;
    lbrace* = 30; ident* = 31;
    if* = 32; while* = 34; repeat* = 35; case* = 36; for* = 37;
    comma* = 40; colon* = 41; becomes* = 42; upto* = 43; rparen* = 44;
    rbrak* = 45; rbrace* = 46; then* = 47; of* = 48; do* = 49;
    to* = 50; by* = 51; semicolon* = 52; end* = 53; bar* = 54;
    else* = 55; elsif* = 56; until* = 57; return* = 58;
    array* = 60; record* = 61; pointer* = 62; interface* = 63; const* = 64; type* = 65;
    var* = 66; procedure* = 67; begin* = 68; import* = 69; module* = 70; eot = 71;

    ## Constants:
```
 max = 2147483647 (*2^31 - 1*);
    VAR i, k, e, n, s, h: LONGINT; x: REAL;
      d: ARRAY 16 OF INTEGER;
      negE: BOOLEAN;
  BEGIN ival := 0; i := 0; n := 0; k := 0;
    REPEAT
      IF n < 16 THEN d[n] := ORD(ch)-30H; INC(n) ELSE Mark("too many digits"); n := 0 END ;
      Texts.Read(R, ch)
    UNTIL (ch < "0") OR (ch > "9") & (ch < "A") OR (ch > "F");
    IF (ch = "H") OR (ch = "R") OR (ch = "X") THEN  (*hex*)
      REPEAT h := d[i];
        IF h >= 10 THEN h := h-7 END ;
        k := k*10H + h; INC(i) (*no overflow check*)
      UNTIL i = n;
      IF ch = "X" THEN sym := char;
        IF k < 100H THEN ival := k ELSE Mark("illegal value"); ival := 0 END
      ELSIF ch = "R" THEN sym := real; rval := SYSTEM.VAL(REAL, k)
      ELSE sym := int; ival := k
      END ;
      Texts.Read(R, ch)
    ELSIF ch = "." THEN
      Texts.Read(R, ch);
      IF ch = "." THEN (*double dot*) ch := 7FX;  (*decimal integer*)
        REPEAT
          IF d[i] < 10 THEN
            IF k <= (max-d[i]) DIV 10 THEN k := k *10 + d[i] ELSE Mark("too large"); k := 0 END
          ELSE Mark("bad integer")
          END ;
          INC(i)
        UNTIL i = n;
        sym := int; ival := k
      ELSE (*real number*) x := 0.0; e := 0;
        REPEAT  (*integer part*) x := x * 10.0 + FLT(d[i]); INC(i) UNTIL i = n;
        WHILE (ch >= "0") & (ch <= "9") DO  (*fraction*)
          x := x * 10.0 + FLT(ORD(ch) - 30H); DEC(e); Texts.Read(R, ch)
        END ;
        IF (ch = "E") OR (ch = "D") THEN  (*scale factor*)
          Texts.Read(R, ch); s := 0; 
          IF ch = "-" THEN negE := TRUE; Texts.Read(R, ch)
          ELSE negE := FALSE;
            IF ch = "+" THEN Texts.Read(R, ch) END
          END ;
          IF (ch >= "0") & (ch <= "9") THEN
            REPEAT s := s*10 + ORD(ch)-30H; Texts.Read(R, ch)
            UNTIL (ch < "0") OR (ch >"9");
            IF negE THEN e := e-s ELSE e := e+s END
          ELSE Mark("digit?")
          END
        END ;
        IF e < 0 THEN
          IF e >= -maxExp THEN x := x / Ten(-e) ELSE x := 0.0 END
        ELSIF e > 0 THEN
          IF e <= maxExp THEN x := Ten(e) * x ELSE x := 0.0; Mark("too large") END
        END ;
        sym := real; rval := x
      END
    ELSE  (*decimal integer*)
      REPEAT
        IF d[i] < 10 THEN
          IF k <= (max-d[i]) DIV 10 THEN k := k*10 + d[i] ELSE Mark("too large"); k := 0 END
        ELSE Mark("bad integer")
        END ;
        INC(i)
      UNTIL i = n;
      sym := int; ival := k
    END
  END Number;

  PROCEDURE comment;
  BEGIN Texts.Read(R, ch);
    REPEAT
      WHILE ~R.eot & (ch # "*") DO
        IF ch = "(" THEN Texts.Read(R, ch);
          IF ch = "*" THEN comment END
        ELSE Texts.Read(R, ch)
        END
      END ;
      WHILE ch = "*" DO Texts.Read(R, ch) END
    UNTIL (ch = ")") OR R.eot;
    IF ~R.eot THEN Texts.Read(R, ch) ELSE Mark("unterminated comment") END
  END comment;

  PROCEDURE Get*(VAR sym: INTEGER);
  BEGIN
    REPEAT
      WHILE ~R.eot & (ch <= " ") DO Texts.Read(R, ch) END;
      IF R.eot THEN sym := eot
      ELSIF ch < "A" THEN
        IF ch < "0" THEN
          IF ch = 22X THEN String; sym := string
          ELSIF ch = "#" THEN Texts.Read(R, ch); sym := neq
          ELSIF ch = "$" THEN HexString; sym := string
          ELSIF ch = "&" THEN Texts.Read(R, ch); sym := and
          ELSIF ch = "(" THEN Texts.Read(R, ch); 
            IF ch = "*" THEN sym := null; comment ELSE sym := lparen END
          ELSIF ch = ")" THEN Texts.Read(R, ch); sym := rparen
          ELSIF ch = "*" THEN Texts.Read(R, ch); sym := times
          ELSIF ch = "+" THEN Texts.Read(R, ch); sym := plus
          ELSIF ch = "," THEN Texts.Read(R, ch); sym := comma
          ELSIF ch = "-" THEN Texts.Read(R, ch); sym := minus
          ELSIF ch = "." THEN Texts.Read(R, ch);
            IF ch = "." THEN Texts.Read(R, ch); sym := upto ELSE sym := period END
          ELSIF ch = "/" THEN Texts.Read(R, ch); sym := rdiv
          ELSE Texts.Read(R, ch); (* ! % ' *) sym := null
          END
        ELSIF ch < ":" THEN Number(sym)
        ELSIF ch = ":" THEN Texts.Read(R, ch);
          IF ch = "=" THEN Texts.Read(R, ch); sym := becomes ELSE sym := colon END 
        ELSIF ch = ";" THEN Texts.Read(R, ch); sym := semicolon
        ELSIF ch = "<" THEN  Texts.Read(R, ch);
          IF ch = "=" THEN Texts.Read(R, ch); sym := leq ELSE sym := lss END
        ELSIF ch = "=" THEN Texts.Read(R, ch); sym := eql
        ELSIF ch = ">" THEN Texts.Read(R, ch);
          IF ch = "=" THEN Texts.Read(R, ch); sym := geq ELSE sym := gtr END
        ELSE (* ? @ *) Texts.Read(R, ch); sym := null
        END
      ELSIF ch < "[" THEN Identifier(sym)
      ELSIF ch < "a" THEN
        IF ch = "[" THEN sym := lbrak
        ELSIF ch = "]" THEN  sym := rbrak
        ELSIF ch = "^" THEN sym := arrow
        ELSE (* _ ` *) sym := null
        END ;
        Texts.Read(R, ch)
      ELSIF ch < "{" THEN Identifier(sym) ELSE
        IF ch = "{" THEN sym := lbrace
        ELSIF ch = "}" THEN sym := rbrace
        ELSIF ch = "|" THEN sym := bar
        ELSIF ch = "~" THEN  sym := not
        ELSIF ch = 7FX THEN  sym := upto
        ELSE sym := null
        END ;
        Texts.Read(R, ch)
      END
    UNTIL sym # null
  END Get;

  PROCEDURE Init*(T: Texts.Text; pos: LONGINT);
  BEGIN errpos := pos; errcnt := 0; Texts.OpenReader(R, T, pos); Texts.Read(R, ch)
  END Init;

  PROCEDURE EnterKW(sym: INTEGER; name: ARRAY OF CHAR);
  BEGIN keyTab[k].id := name; keyTab[k].sym := sym; INC(k)
  END EnterKW;

BEGIN Texts.OpenWriter(W); k := 0; KWX[0] := 0; KWX[1] := 0;
  EnterKW(if, "IF");
  EnterKW(do, "DO");
  EnterKW(of, "OF");
  EnterKW(or, "OR");
  EnterKW(to, "TO");
  EnterKW(in, "IN");
  EnterKW(is, "IS");
  EnterKW(by, "BY");
  KWX[2] := k;
  EnterKW(end, "END");
  EnterKW(nil, "NIL");
  EnterKW(var, "VAR");
  EnterKW(div, "DIV");
  EnterKW(mod, "MOD");
  EnterKW(for, "FOR");
  KWX[3] := k;
  EnterKW(else, "ELSE");
  EnterKW(then, "THEN");
  EnterKW(true, "TRUE");
  EnterKW(const, "## Constants:
```
");
  EnterKW(until, "UNTIL");
  EnterKW(while, "WHILE");
  KWX[5] := k;
  EnterKW(record, "RECORD");
  EnterKW(repeat, "REPEAT");
  EnterKW(return, "RETURN");
  EnterKW(import, "IMPORT");
  EnterKW(module, "MODULE");
  KWX[6] := k;
  EnterKW(pointer, "POINTER");
  KWX[7] := k; KWX[8] := k;
  EnterKW(procedure, "PROCEDURE");
  EnterKW(interface, "INTERFACE");
  KWX[9] := k
END ORS.
```
  ## Types:
```
 Ident* = ARRAY IdLen OF CHAR;

  EnterKW(type, "## Types:
```
");
  EnterKW(case, "CASE");
  KWX[4] := k;
  EnterKW(elsif, "ELSIF");
  EnterKW(false, "FALSE");
  EnterKW(array, "ARRAY");
  EnterKW(begin, "BEGIN");
  EnterKW(const, "CONST");
  EnterKW(until, "UNTIL");
  EnterKW(while, "WHILE");
  KWX[5] := k;
  EnterKW(record, "RECORD");
  EnterKW(repeat, "REPEAT");
  EnterKW(return, "RETURN");
  EnterKW(import, "IMPORT");
  EnterKW(module, "MODULE");
  KWX[6] := k;
  EnterKW(pointer, "POINTER");
  KWX[7] := k; KWX[8] := k;
  EnterKW(procedure, "PROCEDURE");
  EnterKW(interface, "INTERFACE");
  KWX[9] := k
END ORS.
```
## Variables:
```
 ival*, slen*: LONGINT;  (*results of Get*)
    rval*: REAL;
    id*: Ident;  (*for identifiers*)
    str*: ARRAY stringBufSize OF CHAR;
    errcnt*: INTEGER;

```
## Procedures:
---
---
**CopyId** copies an object.

`  PROCEDURE CopyId*(VAR ident: Ident);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L70)


`  PROCEDURE Pos*(): LONGINT;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L74)


`  PROCEDURE Mark*(msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L78)


`  PROCEDURE Identifier(VAR sym: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L88)


`  PROCEDURE String;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L103)


`  PROCEDURE HexString;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L115)


`  PROCEDURE Ten(e: LONGINT): REAL;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L135)


`  PROCEDURE Number(VAR sym: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L145)


`  PROCEDURE comment;` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L214)


`  PROCEDURE Get*(VAR sym: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L228)


`  PROCEDURE Init*(T: Texts.Text; pos: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L283)


`  PROCEDURE EnterKW(sym: INTEGER; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORS.Mod#L287)

