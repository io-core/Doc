
## [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)

## Procedures
---

`  PROCEDURE Code(VAR s: ARRAY OF CHAR): LONGINT;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L83)


`  PROCEDURE SetUser* (VAR user, password: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L95)


`  PROCEDURE Clock*(): LONGINT;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L99)


`  PROCEDURE SetClock* (d: LONGINT);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L103)


`  PROCEDURE Time*(): LONGINT;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L107)


`  PROCEDURE FlipArrow (X, Y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L113)


`  PROCEDURE FlipStar (X, Y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L124)


`  PROCEDURE OpenCursor(VAR c: Cursor);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L135)


`  PROCEDURE FadeCursor(VAR c: Cursor);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L139)


`  PROCEDURE DrawCursor(VAR c: Cursor; m: Marker; x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L143)


`  PROCEDURE DrawMouse*(m: Marker; x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L153)


`  PROCEDURE DrawMouseArrow*(x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L157)


`  PROCEDURE DrawMouseStar* (x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L161)


`  PROCEDURE FadeMouse*;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L165)


`  PROCEDURE MouseOn*(): BOOLEAN;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L169)


`  PROCEDURE DrawPointer*(m: Marker; x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L173)


`  PROCEDURE DrawPointerArrow*(x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L177)


`  PROCEDURE DrawPointerStar*(x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L181)


`  PROCEDURE FadePointer*;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L185)


`  PROCEDURE PointerOn*(): BOOLEAN;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L189)


`  PROCEDURE RemoveMarks* (X, Y, W, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L193)


`  PROCEDURE SetFont* (fnt: Fonts.Font);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L205)


`  PROCEDURE SetColor* (col: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L209)


`  PROCEDURE SetOffset* (voff: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L213)


`  PROCEDURE OpenLog* (T: Texts.Text);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L219)


`  PROCEDURE GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT); (*from current display*)` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L223)


`  PROCEDURE HandleFiller (V: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L231)


`  PROCEDURE InitTrack* (D: Viewers.DisplayArea; W, H: INTEGER); (*add new track to the right*)` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L250)


`  PROCEDURE OpenTrack* (D: Viewers.DisplayArea; X, W: INTEGER); (*create overlay track at X*)` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L255)


`  PROCEDURE InitDisplay* (D: Viewers.DisplayArea; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L260)


`  PROCEDURE SetDisplay* (D: Viewers.DisplayArea);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L266)


`  PROCEDURE CloseDisplay* (D: Viewers.DisplayArea; hint: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L270)


`  PROCEDURE DisplayWidth* (X: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L276)


`  PROCEDURE DisplayHeight* (X: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L280)


`  PROCEDURE MarkedViewer* (): Viewers.Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L284)


`  PROCEDURE PassFocus* (V: Viewers.Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L288)


`  PROCEDURE FocusViewer(): Viewers.Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L297)


`  PROCEDURE UserTrack* (X: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L303)


`  PROCEDURE SystemTrack* (X: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L307)


`  PROCEDURE UY (X: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L311)


`  PROCEDURE AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L319)


`  PROCEDURE SY (X: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L326)


`  PROCEDURE AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L340)


`  PROCEDURE SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L349)


`  PROCEDURE ClearPar*;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L353)


`  PROCEDURE Return*(n: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L357)


`  PROCEDURE Skip(VAR S: Texts.Scanner; VAR len: INTEGER);  (*count and skip white spaces*)` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L361)


`  PROCEDURE Scan(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L371)


`  PROCEDURE Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L383)


`  PROCEDURE Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT);  (*execute multiple commands separated by ~*)` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L405)


`  PROCEDURE Batch*;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L420)


`  PROCEDURE GC;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L426)


`  PROCEDURE NewTask*(h: Handler; period: INTEGER): Task;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L443)


`  PROCEDURE Install* (T: Task);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L448)


`  PROCEDURE Remove* (T: Task);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L455)


`  PROCEDURE Collect* (count: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L464)


`  PROCEDURE Loop*;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L468)


`  PROCEDURE Reset*;` [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L501)

