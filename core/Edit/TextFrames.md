
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

(JG 8.10.90 / NW 10.5.2013 / 11.2.2017 / CP 12.2018 / MS 1.2019 adapted for Unicode / CP 6.2019 / CP 7.2020)


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
      hasCar*, hasSel*, hasMark, atEnd: BOOLEAN;
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

`  PROCEDURE Min (i, j: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L75)


`  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L82)


`  PROCEDURE FlipSM(X, Y: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L89)


`  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L101)


`  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L110)


`  PROCEDURE SetTopMark (F: Frame; on: BOOLEAN);  (*in corner*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L119)


`  PROCEDURE SetBotMark (F: Frame; on: BOOLEAN);  (*in corner*)` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L128)


`  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L137)


`  PROCEDURE DisplayLine (F: Frame; L: Line;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L147)


`  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L162)


`  PROCEDURE previousLine (T: Texts.Text; VAR pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L173)


`  PROCEDURE Mark* (F: Frame; on: BOOLEAN);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L184)


`  PROCEDURE amAtTop(F: Frame):BOOLEAN;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L192)


`  PROCEDURE Restore* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L198)


`  PROCEDURE Suspend* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L220)


`  PROCEDURE Extend* (F: Frame; newY: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L224)


`  PROCEDURE Reduce* (F: Frame; newY: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L250)


`  PROCEDURE Show* (F: Frame; pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L267)


`  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L311)


`  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L320)


`  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L349)


`  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L369)


`  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L384)


`  PROCEDURE FlipCaret (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L389)


`  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L396)


`  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L400)


`  PROCEDURE RemoveCaret* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L414)


`  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L418)


`  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L433)


`  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L442)


`  PROCEDURE RemoveSelection* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L469)


`  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L473)


`  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L496)


`  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L519)


`  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L546)


`  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L597)


`  PROCEDURE Recall*(VAR B: Texts.Buffer);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L649)


`  PROCEDURE RemoveMarks (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L655)


`  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L659)


`  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L664)


`  PROCEDURE Write* (F: Frame; codepoint: INTEGER; fnt: Fonts.Font; col, voff: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L685)


`  PROCEDURE Defocus* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L780)


`  PROCEDURE Neutralize* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L784)


`  PROCEDURE Modify* (F: Frame; id, dY, Y, H: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L788)


`  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L802)


`  PROCEDURE Copy* (F: Frame; VAR F1: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L812)


`  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L817)


`  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L827)


`  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L839)


`  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L851)


`  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L935)


`  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L962)


`  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L969)


`  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L974)


`  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L980)

