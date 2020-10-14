
## [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)

Procedures:


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L83) `  PROCEDURE Code(VAR s: ARRAY OF CHAR): LONGINT;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L95) `  PROCEDURE SetUser* (VAR user, password: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L99) `  PROCEDURE Clock*(): LONGINT;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L103) `  PROCEDURE SetClock* (d: LONGINT);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L107) `  PROCEDURE Time*(): LONGINT;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L113) `  PROCEDURE FlipArrow (X, Y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L124) `  PROCEDURE FlipStar (X, Y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L135) `  PROCEDURE OpenCursor(VAR c: Cursor);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L139) `  PROCEDURE FadeCursor(VAR c: Cursor);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L143) `  PROCEDURE DrawCursor(VAR c: Cursor; m: Marker; x, y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L153) `  PROCEDURE DrawMouse*(m: Marker; x, y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L157) `  PROCEDURE DrawMouseArrow*(x, y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L161) `  PROCEDURE DrawMouseStar* (x, y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L165) `  PROCEDURE FadeMouse*;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L169) `  PROCEDURE MouseOn*(): BOOLEAN;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L173) `  PROCEDURE DrawPointer*(m: Marker; x, y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L177) `  PROCEDURE DrawPointerArrow*(x, y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L181) `  PROCEDURE DrawPointerStar*(x, y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L185) `  PROCEDURE FadePointer*;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L189) `  PROCEDURE PointerOn*(): BOOLEAN;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L193) `  PROCEDURE RemoveMarks* (X, Y, W, H: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L205) `  PROCEDURE SetFont* (fnt: Fonts.Font);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L209) `  PROCEDURE SetColor* (col: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L213) `  PROCEDURE SetOffset* (voff: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L219) `  PROCEDURE OpenLog* (T: Texts.Text);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L223) `  PROCEDURE GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT); (*from current display*)`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L231) `  PROCEDURE HandleFiller (V: Display.Frame; VAR M: Display.FrameMsg);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L250) `  PROCEDURE InitTrack* (D: Viewers.DisplayArea; W, H: INTEGER); (*add new track to the right*)`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L255) `  PROCEDURE OpenTrack* (D: Viewers.DisplayArea; X, W: INTEGER); (*create overlay track at X*)`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L260) `  PROCEDURE InitDisplay* (D: Viewers.DisplayArea; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L266) `  PROCEDURE SetDisplay* (D: Viewers.DisplayArea);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L270) `  PROCEDURE CloseDisplay* (D: Viewers.DisplayArea; hint: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L276) `  PROCEDURE DisplayWidth* (X: INTEGER): INTEGER;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L280) `  PROCEDURE DisplayHeight* (X: INTEGER): INTEGER;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L284) `  PROCEDURE MarkedViewer* (): Viewers.Viewer;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L288) `  PROCEDURE PassFocus* (V: Viewers.Viewer);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L297) `  PROCEDURE FocusViewer(): Viewers.Viewer;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L303) `  PROCEDURE UserTrack* (X: INTEGER): INTEGER;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L307) `  PROCEDURE SystemTrack* (X: INTEGER): INTEGER;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L311) `  PROCEDURE UY (X: INTEGER): INTEGER;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L319) `  PROCEDURE AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L326) `  PROCEDURE SY (X: INTEGER): INTEGER;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L340) `  PROCEDURE AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L349) `  PROCEDURE SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L353) `  PROCEDURE ClearPar*;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L357) `  PROCEDURE Return*(n: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L361) `  PROCEDURE Skip(VAR S: Texts.Scanner; VAR len: INTEGER);  (*count and skip white spaces*)`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L371) `  PROCEDURE Scan(VAR S: Texts.Scanner);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L383) `  PROCEDURE Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L405) `  PROCEDURE Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT);  (*execute multiple commands separated by ~*)`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L420) `  PROCEDURE Batch*;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L426) `  PROCEDURE GC;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L443) `  PROCEDURE NewTask*(h: Handler; period: INTEGER): Task;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L448) `  PROCEDURE Install* (T: Task);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L455) `  PROCEDURE Remove* (T: Task);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L464) `  PROCEDURE Collect* (count: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L468) `  PROCEDURE Loop*;`


[(src)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L501) `  PROCEDURE Reset*;`

