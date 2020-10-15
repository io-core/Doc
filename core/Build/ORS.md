
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

  TYPE Ident* = ARRAY IdLen OF CHAR;
```
## Types:
```
 Ident* = ARRAY IdLen OF CHAR;

  VAR ival*, slen*: LONGINT;  (*results of Get*)
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

