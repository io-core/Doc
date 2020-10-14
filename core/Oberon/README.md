## Oberon
This package implements the user-interaction functionality and the task loop of the system.



#### [MODULE Oberon](https://github.com/io-core/doc/blob/main/core/Oberon/Oberon.Mod) [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)
Module Oberon establishes the messaging and callback system for implementing the extensible user interface of Oberon.

Oberon uses SYSTEM, Kernel, Files, Modules, Input, Display, Viewers, Fonts, Texts



Procedures:
```
  SetUser* (VAR user, password: ARRAY OF CHAR)

  Clock*(): LONGINT

  SetClock* (d: LONGINT)

  Time*(): LONGINT

  DrawMouse*(m: Marker; x, y: INTEGER)

  DrawMouseArrow*(x, y: INTEGER)

  DrawMouseStar* (x, y: INTEGER)

  FadeMouse*

  MouseOn*(): BOOLEAN

  DrawPointer*(m: Marker; x, y: INTEGER)

  DrawPointerArrow*(x, y: INTEGER)

  DrawPointerStar*(x, y: INTEGER)

  FadePointer*

  PointerOn*(): BOOLEAN

  RemoveMarks* (X, Y, W, H: INTEGER)

  SetFont* (fnt: Fonts.Font)

  SetColor* (col: INTEGER)

  SetOffset* (voff: INTEGER)

  OpenLog* (T: Texts.Text)

  GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT) (*from current display*)

  InitTrack* (D: Viewers.DisplayArea; W, H: INTEGER) (*add new track to the right*)

  OpenTrack* (D: Viewers.DisplayArea; X, W: INTEGER) (*create overlay track at X*)

  InitDisplay* (D: Viewers.DisplayArea; name: ARRAY OF CHAR)

  SetDisplay* (D: Viewers.DisplayArea)

  CloseDisplay* (D: Viewers.DisplayArea; hint: INTEGER)

  DisplayWidth* (X: INTEGER): INTEGER

  DisplayHeight* (X: INTEGER): INTEGER

  MarkedViewer* (): Viewers.Viewer

  PassFocus* (V: Viewers.Viewer)

  UserTrack* (X: INTEGER): INTEGER

  SystemTrack* (X: INTEGER): INTEGER

  AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER)

  AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER)

  SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER)

  ClearPar*

  Return*(n: INTEGER)

  Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN)

  Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT)  (*execute multiple commands separated by  *)

  Batch*

  NewTask*(h: Handler; period: INTEGER): Task

  Install* (T: Task)

  Remove* (T: Task)

  Collect* (count: INTEGER)

  Loop*

  Reset*

```


#### [MODULE MenuViewers](https://github.com/io-core/doc/blob/main/core/Oberon/MenuViewers.Mod) [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)
Module MenuViewers implements the top-of-pane 'menu' functionality of the Oberon user interface. 

MenuViewers uses Input, Display, Viewers, Oberon



Procedures:
```
  Handle* (V: Display.Frame; VAR M: Display.FrameMsg)

  New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer

```


#### [MODULE Viewers](https://github.com/io-core/doc/blob/main/core/Oberon/Viewers.Mod) [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)
Module Viewers implements base functionaltiy which may be extended for interacting with a pane or 'Viewer' in Oberon.

Viewers uses Display



Procedures:
```
  ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer

  This* (X, Y: INTEGER): Viewer  (*for backward compatibility*)

  ThisDisplay* (V: Viewer): DisplayArea

  Next* (V: Viewer): Viewer

  Prev* (V: Viewer): Viewer

  SetFocus* (D: DisplayArea; V: Viewer)

  GetFocus* (D: DisplayArea): Viewer

  Adjust* (F: Display.Frame; id, Y, H: INTEGER)

  Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER)

  Validate* (V: Viewer; VAR Y, H: INTEGER)

  Change* (V: Viewer; Y, H: INTEGER)

  Spread* (D: DisplayArea; X, W: INTEGER) (*redistribute viewers vertically*)

  Close* (V: Viewer)

  Recall* (D: DisplayArea; VAR V: Viewer) (*last closed viewer*)

  Flush* (D: DisplayArea) (*last closed viewer*)

  Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame)

  Install* (parent, F: Display.Frame) (*frame F as a subframe into parent frame*)

  Remove* (parent, F: Display.Frame) (*subframe F from its parent frame*)

  InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer)

  OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer)

  CloseTrack* (D: DisplayArea; X: INTEGER)

  Broadcast* (VAR M: Display.FrameMsg) (*to current display*)

  InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR)

  SetDisplay* (D: DisplayArea)

  GetDisplay* (id: INTEGER): DisplayArea

  CloseDisplay* (D: DisplayArea; hint: INTEGER) (*except last display*)

```


#### [MODULE Display](https://github.com/io-core/doc/blob/main/core/Oberon/Display.Mod) [(source)](https://github.com/io-core/Oberon/blob/main/Display.Mod)
Module Display implements the drawing primitives for the frame buffer device in Oberon.

Display uses SYSTEM



Procedures:
```
  Handle*(F: Frame; VAR M: FrameMsg)

  Dot*(col, x, y, mode: INTEGER)

  ReplConst*(col, x, y, w, h, mode: INTEGER)

  CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER)  (*only for modes = paint, invert*)

  CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER)  (*only for modes = paint, invert*)

  CopyPattern*(col, patadr, x, y, mode: INTEGER)  (*only for modes = paint, invert*)

  CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER) (*only for mode = replace*)

  CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER) (*only for mode = replace*)

  CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER)

  ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER)

```


#### [MODULE Input](https://github.com/io-core/doc/blob/main/core/Oberon/Input.Mod) [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod)
Module Input reads keyboard and mouse raw data and returns ASCII values and mouse state to Oberon.

Input uses SYSTEM



Procedures:
```
  Available*(): INTEGER

  Read*(VAR ch: CHAR)

  Mouse*(VAR keys: SET; VAR x, y: INTEGER)

  Mouse*(VAR keys: SET; VAR x, y: INTEGER)

  SetMouseLimits*(w, h: INTEGER)

  Init*

```
