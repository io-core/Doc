
#### [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)

Procedures:

```
  PROCEDURE Code(VAR s: ARRAY OF CHAR): LONGINT;
```
```
  PROCEDURE SetUser* (VAR user, password: ARRAY OF CHAR);
```
```
  PROCEDURE Clock*(): LONGINT;
```
```
  PROCEDURE SetClock* (d: LONGINT);
```
```
  PROCEDURE Time*(): LONGINT;
```
```
  PROCEDURE FlipArrow (X, Y: INTEGER);
```
```
  PROCEDURE FlipStar (X, Y: INTEGER);
```
```
  PROCEDURE OpenCursor(VAR c: Cursor);
```
```
  PROCEDURE FadeCursor(VAR c: Cursor);
```
```
  PROCEDURE DrawCursor(VAR c: Cursor; m: Marker; x, y: INTEGER);
```
```
  PROCEDURE DrawMouse*(m: Marker; x, y: INTEGER);
```
```
  PROCEDURE DrawMouseArrow*(x, y: INTEGER);
```
```
  PROCEDURE DrawMouseStar* (x, y: INTEGER);
```
```
  PROCEDURE FadeMouse*;
```
```
  PROCEDURE MouseOn*(): BOOLEAN;
```
```
  PROCEDURE DrawPointer*(m: Marker; x, y: INTEGER);
```
```
  PROCEDURE DrawPointerArrow*(x, y: INTEGER);
```
```
  PROCEDURE DrawPointerStar*(x, y: INTEGER);
```
```
  PROCEDURE FadePointer*;
```
```
  PROCEDURE PointerOn*(): BOOLEAN;
```
```
  PROCEDURE RemoveMarks* (X, Y, W, H: INTEGER);
```
```
  PROCEDURE SetFont* (fnt: Fonts.Font);
```
```
  PROCEDURE SetColor* (col: INTEGER);
```
```
  PROCEDURE SetOffset* (voff: INTEGER);
```
```
  PROCEDURE OpenLog* (T: Texts.Text);
```
```
  PROCEDURE GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT); (*from current display*)
```
```
  PROCEDURE HandleFiller (V: Display.Frame; VAR M: Display.FrameMsg);
```
```
  PROCEDURE InitTrack* (D: Viewers.DisplayArea; W, H: INTEGER); (*add new track to the right*)
```
```
  PROCEDURE OpenTrack* (D: Viewers.DisplayArea; X, W: INTEGER); (*create overlay track at X*)
```
```
  PROCEDURE InitDisplay* (D: Viewers.DisplayArea; name: ARRAY OF CHAR);
```
```
  PROCEDURE SetDisplay* (D: Viewers.DisplayArea);
```
```
  PROCEDURE CloseDisplay* (D: Viewers.DisplayArea; hint: INTEGER);
```
```
  PROCEDURE DisplayWidth* (X: INTEGER): INTEGER;
```
```
  PROCEDURE DisplayHeight* (X: INTEGER): INTEGER;
```
```
  PROCEDURE MarkedViewer* (): Viewers.Viewer;
```
```
  PROCEDURE PassFocus* (V: Viewers.Viewer);
```
```
  PROCEDURE FocusViewer(): Viewers.Viewer;
```
```
  PROCEDURE UserTrack* (X: INTEGER): INTEGER;
```
```
  PROCEDURE SystemTrack* (X: INTEGER): INTEGER;
```
```
  PROCEDURE UY (X: INTEGER): INTEGER;
```
```
  PROCEDURE AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER);
```
```
  PROCEDURE SY (X: INTEGER): INTEGER;
```
```
  PROCEDURE AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER);
```
```
  PROCEDURE SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER);
```
```
  PROCEDURE ClearPar*;
```
```
  PROCEDURE Return*(n: INTEGER);
```
```
  PROCEDURE Skip(VAR S: Texts.Scanner; VAR len: INTEGER);  (*count and skip white spaces*)
```
```
  PROCEDURE Scan(VAR S: Texts.Scanner);
```
```
  PROCEDURE Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN);
```
```
  PROCEDURE Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT);  (*execute multiple commands separated by ~*)
```
```
  PROCEDURE Batch*;
```
```
  PROCEDURE GC;
```
```
  PROCEDURE NewTask*(h: Handler; period: INTEGER): Task;
```
```
  PROCEDURE Install* (T: Task);
```
```
  PROCEDURE Remove* (T: Task);
```
```
  PROCEDURE Collect* (count: INTEGER);
```
```
  PROCEDURE Loop*;
```
```
  PROCEDURE Reset*;
```
