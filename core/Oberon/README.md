## Oberon
This package implements the user-interaction functionality and the task loop of the system.


### _Package Overview:_
The Oberon package defines the user interface of Oberon.


### _Package Use:_

USAGE:
```
Modules.Load("something",M)
```

### _Modules in this package:_

#### [MODULE Oberon](https://github.com/io-core/doc/blob/main/core/Oberon/Oberon.md) [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)
Module Oberon coordinates the interaction of the user with the system.


  **imports:** ` SYSTEM Kernel Files Modules Input Display Viewers Fonts Texts`

**Procedures:**
```
  SetUser* (VAR user, password: ARRAY OF CHAR)

  Clock*(): LONGINT

  SetClock* (d: LONGINT)

  Time*(): LONGINT

  DrawMouse*(m: Marker; x, y: INTEGER)

  DrawMouseArrow*(x, y: INTEGER)

  FadeMouse*

  DrawPointer*(x, y: INTEGER)

  RemoveMarks* (X, Y, W, H: INTEGER)

  OpenDisplay* (UW, SW, H: INTEGER)

  DisplayWidth* (X: INTEGER): INTEGER

  DisplayHeight* (X: INTEGER): INTEGER

  OpenTrack* (X, W: INTEGER)

  UserTrack* (X: INTEGER): INTEGER

  SystemTrack* (X: INTEGER): INTEGER

  AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER)

  AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER)

  MarkedViewer* (): Viewers.Viewer

  PassFocus* (V: Viewers.Viewer)

  OpenLog*(T: Texts.Text)

  SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT)

  Call* (name: ARRAY OF CHAR; VAR res: INTEGER)

  GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT)

  NewTask*(h: Handler; period: INTEGER): Task

  Install* (T: Task)

  Remove* (T: Task)

  Collect* (count: INTEGER)

  SetFont* (fnt: Fonts.Font)

  SetColor* (col: INTEGER)

  SetOffset* (voff: INTEGER)

  Loop*

  Reset*

```


#### [MODULE Viewers](https://github.com/io-core/doc/blob/main/core/Oberon/Viewers.md) [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)
Module Viewers introduces rectangular areas of the display that present information and 
react to user input -- 'tracks' and 'viewers'.


  **imports:** ` Display`

**Procedures:**
```
  Open* (V: Viewer; X, Y: INTEGER)

  Change* (V: Viewer; Y: INTEGER)

  Close* (V: Viewer)

  Recall* (VAR V: Viewer)

  This* (X, Y: INTEGER): Viewer

  Next* (V: Viewer): Viewer

  Locate* (X, H: INTEGER; VAR fil, bot, alt, max: Display.Frame)

  InitTrack* (W, H: INTEGER; Filler: Viewer)

  OpenTrack* (X, W: INTEGER; Filler: Viewer)

  CloseTrack* (X: INTEGER)

  Broadcast* (VAR M: Display.FrameMsg)

```


#### [MODULE Display](https://github.com/io-core/doc/blob/main/core/Oberon/Display.md) [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod)
Module Display implements the drawing primitives for the frame buffer device in Oberon.

A pattern is an array of bytes; the first is its width (< 32), the second its height, the rest the raster data.


  **imports:** ` SYSTEM`

**Procedures:**
```
  Handle*(F: Frame; VAR M: FrameMsg)

  Dot*(col, x, y, mode: INTEGER)

  ReplConst*(col, x, y, w, h, mode: INTEGER)

  CopyPattern*(col, patadr, x, y, mode: INTEGER)  (*only for modes = paint, invert*)

  CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER) (*only for mode = replace*)

  ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER)

```


#### [MODULE Input](https://github.com/io-core/doc/blob/main/core/Oberon/Input.md) [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod)
Module Input reads keyboard and mouse raw data and returns ASCII values and mouse state to Oberon.


  **imports:** ` SYSTEM`

**Procedures:**
```
  Available*(): INTEGER

  ReadUnicode*(VAR codepoint: INTEGER)

  Mouse*(VAR keys: SET; VAR x, y: INTEGER)

  SetMouseLimits*(w, h: INTEGER)

  Init*

```
