
## [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)

Procedures:


<pre>  PROCEDURE Code(VAR s: ARRAY OF CHAR): LONGINT;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L83)


<pre>  PROCEDURE SetUser* (VAR user, password: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L95)


<pre>  PROCEDURE Clock*(): LONGINT;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L99)


<pre>  PROCEDURE SetClock* (d: LONGINT);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L103)


<pre>  PROCEDURE Time*(): LONGINT;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L107)


<pre>  PROCEDURE FlipArrow (X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L113)


<pre>  PROCEDURE FlipStar (X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L124)


<pre>  PROCEDURE OpenCursor(VAR c: Cursor);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L135)


<pre>  PROCEDURE FadeCursor(VAR c: Cursor);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L139)


<pre>  PROCEDURE DrawCursor(VAR c: Cursor; m: Marker; x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L143)


<pre>  PROCEDURE DrawMouse*(m: Marker; x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L153)


<pre>  PROCEDURE DrawMouseArrow*(x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L157)


<pre>  PROCEDURE DrawMouseStar* (x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L161)


<pre>  PROCEDURE FadeMouse*;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L165)


<pre>  PROCEDURE MouseOn*(): BOOLEAN;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L169)


<pre>  PROCEDURE DrawPointer*(m: Marker; x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L173)


<pre>  PROCEDURE DrawPointerArrow*(x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L177)


<pre>  PROCEDURE DrawPointerStar*(x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L181)


<pre>  PROCEDURE FadePointer*;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L185)


<pre>  PROCEDURE PointerOn*(): BOOLEAN;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L189)


<pre>  PROCEDURE RemoveMarks* (X, Y, W, H: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L193)


<pre>  PROCEDURE SetFont* (fnt: Fonts.Font);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L205)


<pre>  PROCEDURE SetColor* (col: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L209)


<pre>  PROCEDURE SetOffset* (voff: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L213)


<pre>  PROCEDURE OpenLog* (T: Texts.Text);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L219)


<pre>  PROCEDURE GetSelection* (VAR text: Texts.Text; VAR beg, end, time: LONGINT); (*from current display*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L223)


<pre>  PROCEDURE HandleFiller (V: Display.Frame; VAR M: Display.FrameMsg);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L231)


<pre>  PROCEDURE InitTrack* (D: Viewers.DisplayArea; W, H: INTEGER); (*add new track to the right*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L250)


<pre>  PROCEDURE OpenTrack* (D: Viewers.DisplayArea; X, W: INTEGER); (*create overlay track at X*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L255)


<pre>  PROCEDURE InitDisplay* (D: Viewers.DisplayArea; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L260)


<pre>  PROCEDURE SetDisplay* (D: Viewers.DisplayArea);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L266)


<pre>  PROCEDURE CloseDisplay* (D: Viewers.DisplayArea; hint: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L270)


<pre>  PROCEDURE DisplayWidth* (X: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L276)


<pre>  PROCEDURE DisplayHeight* (X: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L280)


<pre>  PROCEDURE MarkedViewer* (): Viewers.Viewer;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L284)


<pre>  PROCEDURE PassFocus* (V: Viewers.Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L288)


<pre>  PROCEDURE FocusViewer(): Viewers.Viewer;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L297)


<pre>  PROCEDURE UserTrack* (X: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L303)


<pre>  PROCEDURE SystemTrack* (X: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L307)


<pre>  PROCEDURE UY (X: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L311)


<pre>  PROCEDURE AllocateUserViewer* (DX: INTEGER; VAR X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L319)


<pre>  PROCEDURE SY (X: INTEGER): INTEGER;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L326)


<pre>  PROCEDURE AllocateSystemViewer* (DX: INTEGER; VAR X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L340)


<pre>  PROCEDURE SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L349)


<pre>  PROCEDURE ClearPar*;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L353)


<pre>  PROCEDURE Return*(n: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L357)


<pre>  PROCEDURE Skip(VAR S: Texts.Scanner; VAR len: INTEGER);  (*count and skip white spaces*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L361)


<pre>  PROCEDURE Scan(VAR S: Texts.Scanner);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L371)


<pre>  PROCEDURE Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L383)


<pre>  PROCEDURE Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT);  (*execute multiple commands separated by ~*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L405)


<pre>  PROCEDURE Batch*;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L420)


<pre>  PROCEDURE GC;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L426)


<pre>  PROCEDURE NewTask*(h: Handler; period: INTEGER): Task;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L443)


<pre>  PROCEDURE Install* (T: Task);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L448)


<pre>  PROCEDURE Remove* (T: Task);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L455)


<pre>  PROCEDURE Collect* (count: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L464)


<pre>  PROCEDURE Loop*;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L468)


<pre>  PROCEDURE Reset*;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Oberon.Mod#L501)

