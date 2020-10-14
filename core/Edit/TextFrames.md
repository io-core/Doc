
## [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)

Procedures:

[62](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#62) `  PROCEDURE Min (i, j: INTEGER): INTEGER;`
[67](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#67) `  PROCEDURE Max (i, j: INTEGER): INTEGER;`
[72](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#72) `  PROCEDURE NewLine (F: Frame; VAR L: Line);  (*reuse line from line pool if possible*)`
[76](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#76) `  PROCEDURE PoolLines (F: Frame; L, L1: Line);  (*move lines from L.next to L1 to line pool*)`
[81](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#81) `  PROCEDURE LastLine (F: Frame; L: Line);  (*move all lines after L to line pool*)`
[90](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#90) `  PROCEDURE ReplConst (col: INTEGER; F: Frame; X, Y, W, H: INTEGER; mode: INTEGER);`
[104](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#104) `  PROCEDURE FlipSM(X, Y: INTEGER);`
[116](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#116) `  PROCEDURE UpdateMark (F: Frame);  (*in scroll bar*)`
[125](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#125) `  PROCEDURE Mark* (F: Frame; on: BOOLEAN);  (*in scroll bar*)`
[134](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#134) `  PROCEDURE SetChangeMark (F: Frame; on: BOOLEAN);  (*in corner*)`
[143](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#143) `  PROCEDURE Width (VAR R: Texts.Reader; len: LONGINT): INTEGER;`
[153](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#153) `  PROCEDURE MeasureLine (VAR l: LineDesc; VAR R: Texts.Reader);`
[165](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#165) `  PROCEDURE PrepareLine (L: Line; VAR R: Texts.Reader);  (*pass 1*)`
[169](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#169) `  PROCEDURE DisplayLine (F: Frame; L: Line;  (*pass 2*)`
[187](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#187) `  PROCEDURE Validate (T: Texts.Text; VAR pos: LONGINT);`
[200](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#200) `  PROCEDURE Restore* (F: Frame);`
[223](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#223) `  PROCEDURE Suspend* (F: Frame);`
[227](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#227) `  PROCEDURE Extend* (F: Frame; newY: INTEGER);`
[259](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#259) `  PROCEDURE Reduce* (F: Frame; newY: INTEGER);`
[277](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#277) `  PROCEDURE ScrollDown (F: Frame; org: LONGINT; voff, dY: INTEGER; lines: ARRAY OF LineDesc; beg, end: INTEGER);`
[306](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#306) `  PROCEDURE ScrollUp (F: Frame; org: LONGINT; voff, dY: INTEGER; skipto: Line);`
[333](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#333) `  PROCEDURE Scroll* (F: Frame; dY: INTEGER);  (*scroll displayed text dY pixels up or down*)`
[384](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#384) `  PROCEDURE Show* (F: Frame; pos: LONGINT);  (*scroll specified text position to the top*)`
[419](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#419) `  PROCEDURE LocateLine (F: Frame; y: INTEGER; VAR loc: Location);`
[428](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#428) `  PROCEDURE LocateString (F: Frame; x, y: INTEGER; VAR loc: Location);`
[457](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#457) `  PROCEDURE LocateChar (F: Frame; x, y: INTEGER; VAR loc: Location);`
[477](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#477) `  PROCEDURE LocatePos (F: Frame; pos: LONGINT; VAR loc: Location);`
[492](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#492) `  PROCEDURE Pos* (F: Frame; X, Y: INTEGER): LONGINT;`
[499](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#499) `  PROCEDURE FlipCaret (F: Frame);`
[506](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#506) `  PROCEDURE SetCaret* (F: Frame; pos: LONGINT);`
[510](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#510) `  PROCEDURE TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET);`
[525](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#525) `  PROCEDURE RemoveCaret* (F: Frame);`
[529](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#529) `  PROCEDURE FlipSelection (F: Frame; VAR beg, end: Location);`
[556](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#556) `  PROCEDURE SetSelection* (F: Frame; beg, end: LONGINT);`
[565](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#565) `  PROCEDURE TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET);`
[619](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#619) `  PROCEDURE RemoveSelection* (F: Frame);`
[623](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#623) `  PROCEDURE TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET);`
[646](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#646) `  PROCEDURE TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET);`
[671](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#671) `  PROCEDURE Replace* (F: Frame; beg, end: LONGINT);`
[707](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#707) `  PROCEDURE Insert* (F: Frame; beg, end: LONGINT);`
[753](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#753) `  PROCEDURE Delete* (F: Frame; beg, end: LONGINT);`
[814](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#814) `  PROCEDURE Recall*(VAR B: Texts.Buffer);`
[820](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#820) `  PROCEDURE RemoveMarks (F: Frame);`
[824](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#824) `  PROCEDURE NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT);`
[829](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#829) `  PROCEDURE Call* (F: Frame; pos: LONGINT; new: BOOLEAN);`
[833](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#833) `  PROCEDURE Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER);`
[871](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#871) `  PROCEDURE Defocus* (F: Frame);`
[875](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#875) `  PROCEDURE Neutralize* (F: Frame);`
[879](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#879) `  PROCEDURE Modify* (F: Frame; id, Y, H: INTEGER);`
[897](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#897) `  PROCEDURE Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT;`
[908](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#908) `  PROCEDURE Copy* (F: Frame; VAR F1: Frame);`
[913](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#913) `  PROCEDURE CopyOver(F: Frame; text: Texts.Text; beg, end: LONGINT);`
[923](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#923) `  PROCEDURE GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);`
[935](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#935) `  PROCEDURE Update* (F: Frame; VAR M: UpdateMsg);`
[945](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#945) `  PROCEDURE Edit* (F: Frame; X, Y: INTEGER; Keys: SET);`
[1040](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#1040) `  PROCEDURE Handle* (F: Display.Frame; VAR M: Display.FrameMsg);`
[1066](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#1066) `  PROCEDURE Menu (name, commands: ARRAY OF CHAR): Texts.Text;`
[1073](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#1073) `  PROCEDURE Text* (name: ARRAY OF CHAR): Texts.Text;`
[1078](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#1078) `  PROCEDURE NewMenu* (name, commands: ARRAY OF CHAR): Frame;`
[1084](https://github.com/io-core/Edit/blob/main/TextFrames.Mod#1084) `  PROCEDURE NewText* (text: Texts.Text; pos: LONGINT): Frame;`
