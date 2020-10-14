
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

Procedures:


<code>  PROCEDURE Min (i, j: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L62)


<code>  PROCEDURE Max (i, j: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L67)


<code>  PROCEDURE NewLine (F: Frame; VAR L: Line);  (*reuse line from line pool if possible*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L72)


<code>  PROCEDURE PoolLines (F: Frame; L, L1: Line);  (*move lines from L.next to L1 to line pool*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L76)


<code>  PROCEDURE LastLine (F: Frame; L: Line);  (*move all lines after L to line pool*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L81)


<code>  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L90)


<code>  PROCEDURE FlipSM(X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L104)


<code>  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L116)


<code>  PROCEDURE Mark* (F: Frame; on: BOOLEAN);  (*in scroll bar*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L125)


<code>  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L134)


<code>  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L143)


<code>  PROCEDURE MeasureLine (VAR l: LineDesc; VAR R: Texts.Reader);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L153)


<code>  PROCEDURE PrepareLine (L: Line; VAR R: Texts.Reader);  (*pass 1*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L165)


<code>  PROCEDURE DisplayLine (F: Frame; L: Line;  (*pass 2*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L169)


<code>  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L187)


<code>  PROCEDURE Restore* (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L200)


<code>  PROCEDURE Suspend* (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L223)


<code>  PROCEDURE Extend* (F: Frame; newY: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L227)


<code>  PROCEDURE Reduce* (F: Frame; newY: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L259)


<code>  PROCEDURE ScrollDown (F: Frame; org: LONGINT; voff, dY: INTEGER; lines: ARRAY OF LineDesc; beg, end: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L277)


<code>  PROCEDURE ScrollUp (F: Frame; org: LONGINT; voff, dY: INTEGER; skipto: Line);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L306)


<code>  PROCEDURE Scroll* (F: Frame; dY: INTEGER);  (*scroll displayed text dY pixels up or down*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L333)


<code>  PROCEDURE Show* (F: Frame; pos: LONGINT);  (*scroll specified text position to the top*)</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L384)


<code>  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L419)


<code>  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L428)


<code>  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L457)


<code>  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L477)


<code>  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L492)


<code>  PROCEDURE FlipCaret (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L499)


<code>  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L506)


<code>  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L510)


<code>  PROCEDURE RemoveCaret* (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L525)


<code>  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L529)


<code>  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L556)


<code>  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L565)


<code>  PROCEDURE RemoveSelection* (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L619)


<code>  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L623)


<code>  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L646)


<code>  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L671)


<code>  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L707)


<code>  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L753)


<code>  PROCEDURE Recall*(VAR B: Texts.Buffer);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L814)


<code>  PROCEDURE RemoveMarks (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L820)


<code>  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L824)


<code>  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L829)


<code>  PROCEDURE Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L833)


<code>  PROCEDURE Defocus* (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L871)


<code>  PROCEDURE Neutralize* (F: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L875)


<code>  PROCEDURE Modify* (F: Frame; id, Y, H: INTEGER);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L879)


<code>  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L897)


<code>  PROCEDURE Copy* (F: Frame; VAR F1: Frame);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L908)


<code>  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L913)


<code>  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L923)


<code>  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L935)


<code>  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L945)


<code>  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1040)


<code>  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1066)


<code>  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1073)


<code>  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1078)


<code>  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;</code> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1084)

