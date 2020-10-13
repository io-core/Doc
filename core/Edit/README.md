## The Edit package manages the text and font handling in Oberon.


#### [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)
Procedures:
```
  Mark* (F: Frame; on: BOOLEAN)  (*in scroll bar*)

  Restore* (F: Frame)

  Suspend* (F: Frame)

  Extend* (F: Frame; newY: INTEGER)

  Reduce* (F: Frame; newY: INTEGER)

  Scroll* (F: Frame; dY: INTEGER)  (*scroll displayed text dY pixels up or down*)

  Show* (F: Frame; pos: LONGINT)  (*scroll specified text position to the top*)

  Pos* (F: Frame; X, Y: INTEGER): LONGINT

  SetCaret* (F: Frame; pos: LONGINT)

  TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET)

  RemoveCaret* (F: Frame)

  SetSelection* (F: Frame; beg, end: LONGINT)

  TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET)

  RemoveSelection* (F: Frame)

  TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET)

  TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET)

  Replace* (F: Frame; beg, end: LONGINT)

  Insert* (F: Frame; beg, end: LONGINT)

  Delete* (F: Frame; beg, end: LONGINT)

  Recall*(VAR B: Texts.Buffer)

  NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT)

  Call* (F: Frame; pos: LONGINT; new: BOOLEAN)

  Write* (F: Frame; ch: CHAR; fnt: Fonts.Font; col, voff: INTEGER)

  Defocus* (F: Frame)

  Neutralize* (F: Frame)

  Modify* (F: Frame; id, Y, H: INTEGER)

  Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT

  Copy* (F: Frame; VAR F1: Frame)

  GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT)

  Update* (F: Frame; VAR M: UpdateMsg)

  Edit* (F: Frame; X, Y: INTEGER; Keys: SET)

  Handle* (F: Display.Frame; VAR M: Display.FrameMsg)

  Text* (name: ARRAY OF CHAR): Texts.Text

  NewMenu* (name, commands: ARRAY OF CHAR): Frame

  NewText* (text: Texts.Text; pos: LONGINT): Frame

```

#### [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)
Procedures:
```
  Load* (VAR R: Files.Rider; T: Text)

  Open* (T: Text; name: ARRAY OF CHAR)

  Store* (VAR W: Files.Rider; T: Text)

  Close*(T: Text; name: ARRAY OF CHAR)

  OpenBuf* (B: Buffer)

  Save* (T: Text; beg, end: LONGINT; B: Buffer)

  Copy* (SB, DB: Buffer)

  Insert* (T: Text; pos: LONGINT; B: Buffer)

  Append* (T: Text; B: Buffer)

  Delete* (T: Text; beg, end: LONGINT; B: Buffer)

  ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER)

  Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER)

  OpenReader* (VAR R: Reader; T: Text; pos: LONGINT)

  Read* (VAR R: Reader; VAR ch: CHAR)

  Pos* (VAR R: Reader): LONGINT

  OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT)

  Scan* (VAR S: Scanner)

  OpenWriter* (VAR W: Writer)

  SetFont* (VAR W: Writer; fnt: Fonts.Font)

  SetColor* (VAR W: Writer; col: INTEGER)

  SetOffset* (VAR W: Writer; voff: INTEGER)

  Write* (VAR W: Writer; ch: CHAR)

  WriteLn* (VAR W: Writer)

  WriteString* (VAR W: Writer; s: ARRAY OF CHAR)

  WriteInt* (VAR W: Writer; x, n: LONGINT)

  WriteHex* (VAR W: Writer; x: LONGINT)

  WriteReal* (VAR W: Writer; x: REAL; n: INTEGER)

  WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER)

  WriteClock* (VAR W: Writer; d: LONGINT)

```

#### [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)
Procedures:
```
  Open*

  Store*

  CopyLooks*

  ChangeFont*

  ChangeColor*

  ChangeOffset*

  Search*  (*uses global variables M, pat, d for Boyer-Moore search*)

  Locate*

  Recall*

```

#### [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)
Procedures:
```
  GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER)

  Load*(name: ARRAY OF CHAR): Font

  This*(name: ARRAY OF CHAR): Font  (*for backward compatibility*)

  Free*  (*remove all but first two from font list*)

```
