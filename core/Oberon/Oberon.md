
## [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)

Procedures:


<code>  PROCEDURE Code(VAR s: ARRAY OF CHAR): LONGINT;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L83)


<code>  PROCEDURE SetUser* (VAR user, password: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L95)


<code>  PROCEDURE Clock*(): LONGINT;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L99)


<code>  PROCEDURE SetClock* (d: LONGINT);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L103)


<code>  PROCEDURE Time*(): LONGINT;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L107)


<code>  PROCEDURE FlipArrow (X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L113)


<code>  PROCEDURE FlipStar (X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L124)


<code>  PROCEDURE OpenCursor(VAR c: Cursor);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L135)


<code>  PROCEDURE FadeCursor(VAR c: Cursor);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L139)


<code>  PROCEDURE DrawCursor(VAR c: Cursor; m: Marker; x, y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L143)


<code>  PROCEDURE DrawMouse*(m: Marker; x, y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L153)


<code>  PROCEDURE DrawMouseArrow*(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L157)


<code>  PROCEDURE DrawMouseStar* (x, y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L161)


<code>  PROCEDURE FadeMouse*;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L165)


<code>  PROCEDURE MouseOn*(): BOOLEAN;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L169)


<code>  PROCEDURE DrawPointer*(m: Marker; x, y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L173)


<code>  PROCEDURE DrawPointerArrow*(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L177)


<code>  PROCEDURE DrawPointerStar*(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L181)


<code>  PROCEDURE FadePointer*;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L185)


<code>  PROCEDURE PointerOn*(): BOOLEAN;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L189)


<code>  PROCEDURE RemoveMarks* (X, Y, W, H: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L193)


<code>  PROCEDURE SetFont* (fnt: Fonts.Font);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L205)


<code>  PROCEDURE SetColor* (col: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L209)


<code>  PROCEDURE SetOffset* (voff: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L213)


<code>  PROCEDURE OpenLog* (T: Texts.Text);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L219)


<code>  PROCEDURE GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT); (*from current display*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L223)


<code>  PROCEDURE HandleFiller (V: Display.Frame; VAR M: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L231)


<code>  PROCEDURE InitTrack* (D: Viewers.DisplayArea; W, H: INTEGER); (*add new track to the right*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L250)


<code>  PROCEDURE OpenTrack* (D: Viewers.DisplayArea; X, W: INTEGER); (*create overlay track at X*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L255)


<code>  PROCEDURE InitDisplay* (D: Viewers.DisplayArea; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L260)


<code>  PROCEDURE SetDisplay* (D: Viewers.DisplayArea);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L266)


<code>  PROCEDURE CloseDisplay* (D: Viewers.DisplayArea; hint: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L270)


<code>  PROCEDURE DisplayWidth* (X: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L276)


<code>  PROCEDURE DisplayHeight* (X: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L280)


<code>  PROCEDURE MarkedViewer* (): Viewers.Viewer;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L284)


<code>  PROCEDURE PassFocus* (V: Viewers.Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L288)


<code>  PROCEDURE FocusViewer(): Viewers.Viewer;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L297)


<code>  PROCEDURE UserTrack* (X: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L303)


<code>  PROCEDURE SystemTrack* (X: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L307)


<code>  PROCEDURE UY (X: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L311)


<code>  PROCEDURE AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L319)


<code>  PROCEDURE SY (X: INTEGER): INTEGER;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L326)


<code>  PROCEDURE AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L340)


<code>  PROCEDURE SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L349)


<code>  PROCEDURE ClearPar*;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L353)


<code>  PROCEDURE Return*(n: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L357)


<code>  PROCEDURE Skip(VAR S: Texts.Scanner; VAR len: INTEGER);  (*count and skip white spaces*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L361)


<code>  PROCEDURE Scan(VAR S: Texts.Scanner);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L371)


<code>  PROCEDURE Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L383)


<code>  PROCEDURE Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT);  (*execute multiple commands separated by ~*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L405)


<code>  PROCEDURE Batch*;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L420)


<code>  PROCEDURE GC;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L426)


<code>  PROCEDURE NewTask*(h: Handler; period: INTEGER): Task;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L443)


<code>  PROCEDURE Install* (T: Task);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L448)


<code>  PROCEDURE Remove* (T: Task);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L455)


<code>  PROCEDURE Collect* (count: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L464)


<code>  PROCEDURE Loop*;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L468)


<code>  PROCEDURE Reset*;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L501)

