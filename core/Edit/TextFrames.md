
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

Procedures:

[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L62) `  PROCEDURE Min (i, j: INTEGER): INTEGER;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L67) `  PROCEDURE Max (i, j: INTEGER): INTEGER;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L72) `  PROCEDURE NewLine (F: Frame; VAR L: Line);  (*reuse line from line pool if possible*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L76) `  PROCEDURE PoolLines (F: Frame; L, L1: Line);  (*move lines from L.next to L1 to line pool*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L81) `  PROCEDURE LastLine (F: Frame; L: Line);  (*move all lines after L to line pool*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L90) `  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L104) `  PROCEDURE FlipSM(X, Y: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L116) `  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L125) `  PROCEDURE Mark* (F: Frame; on: BOOLEAN);  (*in scroll bar*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L134) `  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L143) `  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L153) `  PROCEDURE MeasureLine (VAR l: LineDesc; VAR R: Texts.Reader);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L165) `  PROCEDURE PrepareLine (L: Line; VAR R: Texts.Reader);  (*pass 1*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L169) `  PROCEDURE DisplayLine (F: Frame; L: Line;  (*pass 2*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L187) `  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L200) `  PROCEDURE Restore* (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L223) `  PROCEDURE Suspend* (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L227) `  PROCEDURE Extend* (F: Frame; newY: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L259) `  PROCEDURE Reduce* (F: Frame; newY: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L277) `  PROCEDURE ScrollDown (F: Frame; org: LONGINT; voff, dY: INTEGER; lines: ARRAY OF LineDesc; beg, end: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L306) `  PROCEDURE ScrollUp (F: Frame; org: LONGINT; voff, dY: INTEGER; skipto: Line);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L333) `  PROCEDURE Scroll* (F: Frame; dY: INTEGER);  (*scroll displayed text dY pixels up or down*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L384) `  PROCEDURE Show* (F: Frame; pos: LONGINT);  (*scroll specified text position to the top*)`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L419) `  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L428) `  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L457) `  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L477) `  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L492) `  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L499) `  PROCEDURE FlipCaret (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L506) `  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L510) `  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L525) `  PROCEDURE RemoveCaret* (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L529) `  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L556) `  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L565) `  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L619) `  PROCEDURE RemoveSelection* (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L623) `  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L646) `  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L671) `  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L707) `  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L753) `  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L814) `  PROCEDURE Recall*(VAR B: Texts.Buffer);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L820) `  PROCEDURE RemoveMarks (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L824) `  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L829) `  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L833) `  PROCEDURE Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L871) `  PROCEDURE Defocus* (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L875) `  PROCEDURE Neutralize* (F: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L879) `  PROCEDURE Modify* (F: Frame; id, Y, H: INTEGER);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L897) `  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L908) `  PROCEDURE Copy* (F: Frame; VAR F1: Frame);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L913) `  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L923) `  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L935) `  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L945) `  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1040) `  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1066) `  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1073) `  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1078) `  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;`
[](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1084) `  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;`
