
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

Procedures:


<pre>  PROCEDURE Min (i, j: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L62)


<pre>  PROCEDURE Max (i, j: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L67)


<pre>  PROCEDURE NewLine (F: Frame; VAR L: Line);  (*reuse line from line pool if possible*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L72)


<pre>  PROCEDURE PoolLines (F: Frame; L, L1: Line);  (*move lines from L.next to L1 to line pool*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L76)


<pre>  PROCEDURE LastLine (F: Frame; L: Line);  (*move all lines after L to line pool*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L81)


<pre>  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L90)


<pre>  PROCEDURE FlipSM(X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L104)


<pre>  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L116)


<pre>  PROCEDURE Mark* (F: Frame; on: BOOLEAN);  (*in scroll bar*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L125)


<pre>  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L134)


<pre>  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L143)


<pre>  PROCEDURE MeasureLine (VAR l: LineDesc; VAR R: Texts.Reader);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L153)


<pre>  PROCEDURE PrepareLine (L: Line; VAR R: Texts.Reader);  (*pass 1*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L165)


<pre>  PROCEDURE DisplayLine (F: Frame; L: Line;  (*pass 2*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L169)


<pre>  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L187)


<pre>  PROCEDURE Restore* (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L200)


<pre>  PROCEDURE Suspend* (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L223)


<pre>  PROCEDURE Extend* (F: Frame; newY: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L227)


<pre>  PROCEDURE Reduce* (F: Frame; newY: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L259)


<pre>  PROCEDURE ScrollDown (F: Frame; org: LONGINT; voff, dY: INTEGER; lines: ARRAY OF LineDesc; beg, end: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L277)


<pre>  PROCEDURE ScrollUp (F: Frame; org: LONGINT; voff, dY: INTEGER; skipto: Line);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L306)


<pre>  PROCEDURE Scroll* (F: Frame; dY: INTEGER);  (*scroll displayed text dY pixels up or down*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L333)


<pre>  PROCEDURE Show* (F: Frame; pos: LONGINT);  (*scroll specified text position to the top*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L384)


<pre>  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L419)


<pre>  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L428)


<pre>  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L457)


<pre>  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L477)


<pre>  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L492)


<pre>  PROCEDURE FlipCaret (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L499)


<pre>  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L506)


<pre>  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L510)


<pre>  PROCEDURE RemoveCaret* (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L525)


<pre>  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L529)


<pre>  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L556)


<pre>  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L565)


<pre>  PROCEDURE RemoveSelection* (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L619)


<pre>  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L623)


<pre>  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L646)


<pre>  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L671)


<pre>  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L707)


<pre>  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L753)


<pre>  PROCEDURE Recall*(VAR B: Texts.Buffer);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L814)


<pre>  PROCEDURE RemoveMarks (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L820)


<pre>  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L824)


<pre>  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L829)


<pre>  PROCEDURE Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L833)


<pre>  PROCEDURE Defocus* (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L871)


<pre>  PROCEDURE Neutralize* (F: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L875)


<pre>  PROCEDURE Modify* (F: Frame; id, Y, H: INTEGER);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L879)


<pre>  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L897)


<pre>  PROCEDURE Copy* (F: Frame; VAR F1: Frame);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L908)


<pre>  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L913)


<pre>  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L923)


<pre>  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L935)


<pre>  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L945)


<pre>  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1040)


<pre>  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1066)


<pre>  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1073)


<pre>  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1078)


<pre>  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;</pre> [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#L1084)

