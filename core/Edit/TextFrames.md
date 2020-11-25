
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

  ## Imports:
` Modules Input Display Viewers Fonts Texts Oberon MenuViewers`

## Constants:
```
 replace* = 0; insert* = 1; delete* = 2; unmark* = 3; exec* = 4; (*message id*)
    BS = 8X; TAB = 9X; CR = 0DX; NL = 0AX; DEL = 7FX;

```
## Types:
```
 Line = POINTER TO LineDesc;
    LineDesc = RECORD
      len: LONGINT;
      wid: INTEGER;
      eot: BOOLEAN;
      next: Line
    END;

    Location* = RECORD
      org*, pos*: LONGINT;
      dx*, x*, y*: INTEGER;
      lin: Line
    END;

    Frame* = POINTER TO FrameDesc;
    FrameDesc* = RECORD
      (Display.FrameDesc)
      text*: Texts.Text;
      org*: LONGINT;
      col*: INTEGER;
      lsp*: INTEGER;
      left*, right*, top*, bot*: INTEGER;
      markH*: INTEGER;
      time*: LONGINT;
      hasCar*, hasSel*, hasMark: BOOLEAN;
      carloc*: Location;
      selbeg*, selend*: Location;
      trailer: Line
    END;

    UpdateMsg* = RECORD (Display.FrameMsg)
      id*: INTEGER;
      text*: Texts.Text;
      beg*, end*: LONGINT
    END;

    CallMsg* = RECORD (Display.FrameMsg)
      offset*: INTEGER
    END;

    CopyOverMsg = RECORD (Display.FrameMsg)
      text: Texts.Text;
      beg, end: LONGINT
    END;

```
## Variables:
```
 TBuf*, DelBuf: Texts.Buffer;
    menuH*, barW*, left*, right*, top*, bot*, lsp*: INTEGER; (*standard sizes*)
    asr, dsr, selH, markW, eolW: INTEGER;
    nextCodepoint: INTEGER;
    ScrollMarker: Oberon.Marker;
    W, KW: Texts.Writer; (*keyboard writer*)

```
## Procedures:
---

`  PROCEDURE Min (i, j: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L64)


`  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L71)


`  PROCEDURE FlipSM(X, Y: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L78)


`  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L90)


`  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L99)


`  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L108)


`  PROCEDURE DisplayLine (F: Frame; L: Line;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L118)


`  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L133)


`  PROCEDURE Mark* (F: Frame; on: BOOLEAN);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L144)


`  PROCEDURE Restore* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L152)


`  PROCEDURE Suspend* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L171)


`  PROCEDURE Extend* (F: Frame; newY: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L175)


`  PROCEDURE Reduce* (F: Frame; newY: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L199)


`  PROCEDURE Show* (F: Frame; pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L214)


`  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L257)


`  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L266)


`  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L295)


`  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L315)


`  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L330)


`  PROCEDURE FlipCaret (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L335)


`  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L342)


`  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L346)


`  PROCEDURE RemoveCaret* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L360)


`  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L364)


`  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L379)


`  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L388)


`  PROCEDURE RemoveSelection* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L415)


`  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L419)


`  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L442)


`  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L465)


`  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L491)


`  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L541)


`  PROCEDURE Recall*(VAR B: Texts.Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L590)


`  PROCEDURE RemoveMarks (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L596)


`  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L600)


`  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L605)


`  PROCEDURE Write* (F: Frame; codepoint: INTEGER; fnt: Fonts.Font; col, voff: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L626)


`  PROCEDURE Defocus* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L676)


`  PROCEDURE Neutralize* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L680)


`  PROCEDURE Modify* (F: Frame; id, dY, Y, H: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L684)


`  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L697)


`  PROCEDURE Copy* (F: Frame; VAR F1: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L707)


`  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L712)


`  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L722)


`  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L734)


`  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L744)


`  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L828)


`  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L855)


`  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L862)


`  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L867)


`  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L873)

