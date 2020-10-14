
## [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)

Procedures:

```
[83](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#83)    PROCEDURE Code(VAR s: ARRAY OF CHAR): LONGINT;
```
```
[95](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#95)    PROCEDURE SetUser* (VAR user, password: ARRAY OF CHAR);
```
```
[99](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#99)    PROCEDURE Clock*(): LONGINT;
```
```
[103](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#103)    PROCEDURE SetClock* (d: LONGINT);
```
```
[107](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#107)    PROCEDURE Time*(): LONGINT;
```
```
[113](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#113)    PROCEDURE FlipArrow (X, Y: INTEGER);
```
```
[124](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#124)    PROCEDURE FlipStar (X, Y: INTEGER);
```
```
[135](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#135)    PROCEDURE OpenCursor(VAR c: Cursor);
```
```
[139](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#139)    PROCEDURE FadeCursor(VAR c: Cursor);
```
```
[143](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#143)    PROCEDURE DrawCursor(VAR c: Cursor; m: Marker; x, y: INTEGER);
```
```
[153](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#153)    PROCEDURE DrawMouse*(m: Marker; x, y: INTEGER);
```
```
[157](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#157)    PROCEDURE DrawMouseArrow*(x, y: INTEGER);
```
```
[161](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#161)    PROCEDURE DrawMouseStar* (x, y: INTEGER);
```
```
[165](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#165)    PROCEDURE FadeMouse*;
```
```
[169](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#169)    PROCEDURE MouseOn*(): BOOLEAN;
```
```
[173](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#173)    PROCEDURE DrawPointer*(m: Marker; x, y: INTEGER);
```
```
[177](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#177)    PROCEDURE DrawPointerArrow*(x, y: INTEGER);
```
```
[181](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#181)    PROCEDURE DrawPointerStar*(x, y: INTEGER);
```
```
[185](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#185)    PROCEDURE FadePointer*;
```
```
[189](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#189)    PROCEDURE PointerOn*(): BOOLEAN;
```
```
[193](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#193)    PROCEDURE RemoveMarks* (X, Y, W, H: INTEGER);
```
```
[205](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#205)    PROCEDURE SetFont* (fnt: Fonts.Font);
```
```
[209](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#209)    PROCEDURE SetColor* (col: INTEGER);
```
```
[213](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#213)    PROCEDURE SetOffset* (voff: INTEGER);
```
```
[219](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#219)    PROCEDURE OpenLog* (T: Texts.Text);
```
```
[223](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#223)    PROCEDURE GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT); (*from current display*)
```
```
[231](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#231)    PROCEDURE HandleFiller (V: Display.Frame; VAR M: Display.FrameMsg);
```
```
[250](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#250)    PROCEDURE InitTrack* (D: Viewers.DisplayArea; W, H: INTEGER); (*add new track to the right*)
```
```
[255](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#255)    PROCEDURE OpenTrack* (D: Viewers.DisplayArea; X, W: INTEGER); (*create overlay track at X*)
```
```
[260](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#260)    PROCEDURE InitDisplay* (D: Viewers.DisplayArea; name: ARRAY OF CHAR);
```
```
[266](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#266)    PROCEDURE SetDisplay* (D: Viewers.DisplayArea);
```
```
[270](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#270)    PROCEDURE CloseDisplay* (D: Viewers.DisplayArea; hint: INTEGER);
```
```
[276](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#276)    PROCEDURE DisplayWidth* (X: INTEGER): INTEGER;
```
```
[280](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#280)    PROCEDURE DisplayHeight* (X: INTEGER): INTEGER;
```
```
[284](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#284)    PROCEDURE MarkedViewer* (): Viewers.Viewer;
```
```
[288](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#288)    PROCEDURE PassFocus* (V: Viewers.Viewer);
```
```
[297](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#297)    PROCEDURE FocusViewer(): Viewers.Viewer;
```
```
[303](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#303)    PROCEDURE UserTrack* (X: INTEGER): INTEGER;
```
```
[307](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#307)    PROCEDURE SystemTrack* (X: INTEGER): INTEGER;
```
```
[311](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#311)    PROCEDURE UY (X: INTEGER): INTEGER;
```
```
[319](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#319)    PROCEDURE AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER);
```
```
[326](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#326)    PROCEDURE SY (X: INTEGER): INTEGER;
```
```
[340](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#340)    PROCEDURE AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER);
```
```
[349](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#349)    PROCEDURE SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER);
```
```
[353](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#353)    PROCEDURE ClearPar*;
```
```
[357](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#357)    PROCEDURE Return*(n: INTEGER);
```
```
[361](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#361)    PROCEDURE Skip(VAR S: Texts.Scanner; VAR len: INTEGER);  (*count and skip white spaces*)
```
```
[371](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#371)    PROCEDURE Scan(VAR S: Texts.Scanner);
```
```
[383](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#383)    PROCEDURE Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN);
```
```
[405](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#405)    PROCEDURE Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT);  (*execute multiple commands separated by ~*)
```
```
[420](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#420)    PROCEDURE Batch*;
```
```
[426](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#426)    PROCEDURE GC;
```
```
[443](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#443)    PROCEDURE NewTask*(h: Handler; period: INTEGER): Task;
```
```
[448](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#448)    PROCEDURE Install* (T: Task);
```
```
[455](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#455)    PROCEDURE Remove* (T: Task);
```
```
[464](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#464)    PROCEDURE Collect* (count: INTEGER);
```
```
[468](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#468)    PROCEDURE Loop*;
```
```
[501](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#501)    PROCEDURE Reset*;
```
