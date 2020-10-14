
#### [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

Procedures:

```
  PROCEDURE Min (i, j: INTEGER): INTEGER;
```
```
  PROCEDURE Max (i, j: INTEGER): INTEGER;
```
```
  PROCEDURE NewLine (F: Frame; VAR L: Line);  (*reuse line from line pool if possible*)
```
```
  PROCEDURE PoolLines (F: Frame; L, L1: Line);  (*move lines from L.next to L1 to line pool*)
```
```
  PROCEDURE LastLine (F: Frame; L: Line);  (*move all lines after L to line pool*)
```
```
  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);
```
```
  PROCEDURE FlipSM(X, Y: INTEGER);
```
```
  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)
```
```
  PROCEDURE Mark* (F: Frame; on: BOOLEAN);  (*in scroll bar*)
```
```
  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)
```
```
  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;
```
```
  PROCEDURE MeasureLine (VAR l: LineDesc; VAR R: Texts.Reader);
```
```
  PROCEDURE PrepareLine (L: Line; VAR R: Texts.Reader);  (*pass 1*)
```
```
  PROCEDURE DisplayLine (F: Frame; L: Line;  (*pass 2*)
```
```
  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);
```
```
  PROCEDURE Restore* (F: Frame);
```
```
  PROCEDURE Suspend* (F: Frame);
```
```
  PROCEDURE Extend* (F: Frame; newY: INTEGER);
```
```
  PROCEDURE Reduce* (F: Frame; newY: INTEGER);
```
```
  PROCEDURE ScrollDown (F: Frame; org: LONGINT; voff, dY: INTEGER; lines: ARRAY OF LineDesc; beg, end: INTEGER);
```
```
  PROCEDURE ScrollUp (F: Frame; org: LONGINT; voff, dY: INTEGER; skipto: Line);
```
```
  PROCEDURE Scroll* (F: Frame; dY: INTEGER);  (*scroll displayed text dY pixels up or down*)
```
```
  PROCEDURE Show* (F: Frame; pos: LONGINT);  (*scroll specified text position to the top*)
```
```
  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);
```
```
  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);
```
```
  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);
```
```
  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);
```
```
  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;
```
```
  PROCEDURE FlipCaret (F: Frame);
```
```
  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);
```
```
  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);
```
```
  PROCEDURE RemoveCaret* (F: Frame);
```
```
  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);
```
```
  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);
```
```
  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);
```
```
  PROCEDURE RemoveSelection* (F: Frame);
```
```
  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);
```
```
  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);
```
```
  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);
```
```
  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);
```
```
  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);
```
```
  PROCEDURE Recall*(VAR B: Texts.Buffer);
```
```
  PROCEDURE RemoveMarks (F: Frame);
```
```
  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);
```
```
  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);
```
```
  PROCEDURE Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER);
```
```
  PROCEDURE Defocus* (F: Frame);
```
```
  PROCEDURE Neutralize* (F: Frame);
```
```
  PROCEDURE Modify* (F: Frame; id, Y, H: INTEGER);
```
```
  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;
```
```
  PROCEDURE Copy* (F: Frame; VAR F1: Frame);
```
```
  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);
```
```
  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);
```
```
  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);
```
```
  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);
```
```
  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);
```
```
  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;
```
```
  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;
```
```
  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;
```
```
  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;
```
