
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

Procedures:


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


`  PROCEDURE RemoveMarks (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L820)


`  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L824)


`  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L829)


`  PROCEDURE Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L833)


`  PROCEDURE Defocus* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L871)


`  PROCEDURE Neutralize* (F: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L875)


`  PROCEDURE Modify* (F: Frame; id, Y, H: INTEGER);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L879)


`  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L897)


`  PROCEDURE Copy* (F: Frame; VAR F1: Frame);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L908)


`  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L913)


`  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L923)


`  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L935)


`  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L945)


`  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1040)


`  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1066)


`  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1073)


`  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1078)


`  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;` [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1084)

