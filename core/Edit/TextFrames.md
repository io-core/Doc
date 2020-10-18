
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

  ## Imports:
` Input Display Viewers Fonts Texts Oberon`

## Constants:
```
 replace* = Texts.replace; insert* = Texts.insert; delete* = Texts.delete; unmark* = Texts.unmark;  (*message ids*)
    BS = Input.BS; TAB = Input.TAB; CR = Input.CR; DEL = Input.DEL;
    CtrlA = Input.CtrlA; CtrlC = Input.CtrlC; CtrlV = Input.CtrlV; CtrlX = Input.CtrlX;
    CursorLeft = Input.CursorLeft; CursorRight = Input.CursorRight; CursorUp = Input.CursorUp; CursorDown = Input.CursorDown;

```
## Types:
```
 Line = POINTER TO LineDesc;
    LineDesc = RECORD
      len: LONGINT;
      wid: INTEGER;
      eot: BOOLEAN;
      lsp, asr, dsr: BYTE;  (*largest line space, ascender and descender in the line*)
      next: Line
    END;

    Location* = RECORD
      org*, pos*: LONGINT;
      dx*, x*, y*: INTEGER;
      lin: Line
    END;

    Frame* = POINTER TO FrameDesc;
    FrameDesc* = RECORD (Display.FrameDesc)
      text*: Texts.Text;
      org*: LONGINT;
      col*, lsp*: INTEGER;
      left*, right*, top*, bot*: INTEGER;
      markH*: INTEGER;
      time*: LONGINT;
      hasCar*, hasSel*, hasMark: BOOLEAN;
      carloc*: Location;
      selbeg*, selend*: Location;
      trailer: Line;
      voff: INTEGER;  (*vertical offset relative to baseline*)
      pool: Line  (*line pool to minimize consumption of heap space during continuous line scrolling*)
    END;

    UpdateMsg* = RECORD (Display.FrameMsg)
      id*: INTEGER;       (*replace, insert, delete, unmark*)
      text*: Texts.Text;
      beg*, end*: LONGINT
    END;

    CopyOverMsg* = RECORD (Display.FrameMsg)
      text*: Texts.Text;
      beg*, end*: LONGINT
    END;

```
## Variables:
```
 TBuf*, DelBuf: Texts.Buffer;
    menuH*, barW*, left*, right*, top*, bot*, lsp*: INTEGER;  (*standard sizes*)
    asr, dsr, selH, markW, eolW: INTEGER;
    nextCh: CHAR;
    ScrollMarker: Oberon.Marker;
    W, KW: Texts.Writer;  (*keyboard writer*)

```
## Procedures:
---

`  PROCEDURE Min (i, j: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L62)


`  PROCEDURE Max (i, j: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L67)


`  PROCEDURE NewLine (F: Frame; VAR L: Line);  (*reuse line from line pool if possible*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L72)


`  PROCEDURE PoolLines (F: Frame; L, L1: Line);  (*move lines from L.next to L1 to line pool*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L76)


`  PROCEDURE LastLine (F: Frame; L: Line);  (*move all lines after L to line pool*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L81)


`  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L90)


`  PROCEDURE FlipSM(X, Y: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L104)


`  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L116)


`  PROCEDURE Mark* (F: Frame; on: BOOLEAN);  (*in scroll bar*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L125)


`  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L134)


`  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L143)


`  PROCEDURE MeasureLine (VAR l: LineDesc; VAR R: Texts.Reader);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L153)


`  PROCEDURE PrepareLine (L: Line; VAR R: Texts.Reader);  (*pass 1*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L165)


`  PROCEDURE DisplayLine (F: Frame; L: Line;  (*pass 2*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L169)


`  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L187)


`  PROCEDURE Restore* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L200)


`  PROCEDURE Suspend* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L223)


`  PROCEDURE Extend* (F: Frame; newY: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L227)


`  PROCEDURE Reduce* (F: Frame; newY: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L259)


`  PROCEDURE ScrollDown (F: Frame; org: LONGINT; voff, dY: INTEGER; lines: ARRAY OF LineDesc; beg, end: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L277)


`  PROCEDURE ScrollUp (F: Frame; org: LONGINT; voff, dY: INTEGER; skipto: Line);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L306)


`  PROCEDURE Scroll* (F: Frame; dY: INTEGER);  (*scroll displayed text dY pixels up or down*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L333)


`  PROCEDURE Show* (F: Frame; pos: LONGINT);  (*scroll specified text position to the top*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L384)


`  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L419)


`  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L428)


`  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L457)


`  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L477)


`  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L492)


`  PROCEDURE FlipCaret (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L499)


`  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L506)


`  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L510)


`  PROCEDURE RemoveCaret* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L525)


`  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L529)


`  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L556)


`  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L565)


`  PROCEDURE RemoveSelection* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L619)


`  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L623)


`  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L646)


`  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L671)


`  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L707)


`  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L753)


`  PROCEDURE Recall*(VAR B: Texts.Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L814)

## ---------- Oberon Message Handling

`  PROCEDURE RemoveMarks (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L824)


`  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L828)


`  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L833)


`  PROCEDURE Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L837)


`  PROCEDURE Defocus* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L875)


`  PROCEDURE Neutralize* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L879)


`  PROCEDURE Modify* (F: Frame; id, Y, H: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L883)


`  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L901)


`  PROCEDURE Copy* (F: Frame; VAR F1: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L912)


`  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L917)


`  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L927)


`  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L939)


`  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L949)


`  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1044)


`  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1070)


`  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1077)


`  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1082)


`  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1088)

