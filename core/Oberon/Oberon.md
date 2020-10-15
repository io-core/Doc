
## [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)

  ## Imports:
` SYSTEM Kernel Files Modules Input Display Viewers Fonts Texts`

  ## Constants:
```
 (*message ids*)
    consume* = 0; track* = 1; defocus* = 0; neutralize* = 1; mark* = 2;
    off = 0; idle = 1; active = 2;   (*task states*)
    BasicCycle = 20;
    TAB = Input.TAB; CR = Input.CR; ESC = Input.ESC; SETSTAR = 1AX;

```
  ## Types:
```
 Painter* = PROCEDURE (x, y: INTEGER);
    Marker* = RECORD Fade*, Draw*: Painter END;
    
    Cursor* = RECORD
       marker*: Marker; on*: BOOLEAN; X*, Y*: INTEGER
    END;

    InputMsg* = RECORD (Display.FrameMsg)
      id*: INTEGER;                      (*consume, track*)
      keys*: SET;
      X*, Y*: INTEGER;
      ch*: CHAR;
      fnt*: Fonts.Font;
      col*, voff*: INTEGER
    END;

    SelectionMsg* = RECORD (Display.FrameMsg)
      time*: LONGINT;
      text*: Texts.Text;
      beg*, end*: LONGINT
    END;

    ControlMsg* = RECORD (Display.FrameMsg)
      id*, X*, Y*: INTEGER               (*defocus, neutralize, mark*)
    END;

    CopyMsg* = RECORD (Display.FrameMsg)
        F*: Display.Frame
      END;

    Task* = POINTER TO TaskDesc;

    Handler* = PROCEDURE;

    TaskDesc* = RECORD
      state, nextTime, period*: INTEGER;
      next: Task;
      handle: Handler
    END;

```
  ## Variables:
```
 User*: ARRAY 8 OF CHAR; Password*: LONGINT;
    Arrow*, Star*: Marker; (*predefined markers representing an arrow pointing to the NW and a star symbol*)
    Mouse, Pointer: Cursor; (*predefined cursors representing a mouse and a global system pointer*)
    Log*: Texts.Text;
  PROCEDURE Code(## Variables:
```
 s: ARRAY OF CHAR): LONGINT;
    ## Variables:
```
 i: INTEGER; a, b, c: LONGINT;
    ## Variables:
```
 i: INTEGER; a, b, c: LONGINT;
  BEGIN
    a := 0; b := 0; i := 0;
    WHILE s[i] # 0X DO
      c := b; b := a; a := (c MOD 509 + 1) * 127 + ORD(s[i]);
      INC(i)
    END;
    IF b >= 32768 THEN b := b - 65536 END;
    RETURN b * 65536 + a
  END Code;
  PROCEDURE SetUser* (## Variables:
```
 user, password: ARRAY OF CHAR);
  BEGIN User := user; Password := Code(password)
  END SetUser;
  PROCEDURE OpenCursor(## Variables:
```
 c: Cursor);
  BEGIN c.on := FALSE; c.X := 0; c.Y := 0
  END OpenCursor;
 
  PROCEDURE FadeCursor(## Variables:
```
 c: Cursor);
  PROCEDURE FadeCursor(## Variables:
```
 c: Cursor);
  BEGIN IF c.on THEN c.marker.Fade(c.X, c.Y); c.on := FALSE END
  END FadeCursor;
  PROCEDURE DrawCursor(## Variables:
```
 c: Cursor; m: Marker; x, y: INTEGER);
  BEGIN
    IF c.on & ((x # c.X) OR (y # c.Y) OR (m.Draw # c.marker.Draw)) THEN
      c.marker.Fade(c.X, c.Y); c.on := FALSE
    END;
    IF ~c.on THEN
      m.Draw(x, y); c.marker := m; c.X := x; c.Y := y; c.on := TRUE
    END
  END DrawCursor;
  PROCEDURE GetSelection* (## Variables:
```
 text: Texts.Text; ## Variables:
```
 beg, end, time: LONGINT); (*from current display*)
    ## Variables:
```
 M: SelectionMsg;
    ## Variables:
```
 M: SelectionMsg;
  BEGIN M.time := -1; Viewers.Broadcast(M); time := M.time;
    IF time >= 0 THEN text := M.text; beg := M.beg; end := M.end END
  END GetSelection;
  PROCEDURE HandleFiller (V: Display.Frame; ## Variables:
```
 M: Display.FrameMsg);
  BEGIN
    CASE M OF
    InputMsg: IF M.id = track THEN DrawMouseArrow(M.X, M.Y) END |
    ControlMsg: IF M.id = mark THEN DrawPointerStar(M.X, M.Y) END |
    Viewers.ViewerMsg:
      IF (M.id = Viewers.restore) & (V.W > 0) & (V.H > 0) THEN
        RemoveMarks(V.X, V.Y, V.W, V.H);
        Display.ReplConst(Display.black, V.X, V.Y, V.W, V.H, Display.replace)
      ELSIF M.id = Viewers.modify THEN
        IF M.Y < V.Y THEN
          RemoveMarks(V.X, M.Y, V.W, V.Y - M.Y);
          Display.ReplConst(Display.black, V.X, M.Y, V.W, V.Y - M.Y, Display.replace)
        ELSIF M.Y > V.Y THEN RemoveMarks(V.X, V.Y, V.W, M.Y - V.Y)
        END
      END
    END
  END HandleFiller;
    ## Variables:
```
 Filler: Viewers.Viewer;
  BEGIN NEW(Filler); Filler.handle := HandleFiller; Viewers.InitTrack(D, W, H, Filler)
  END InitTrack;
    ## Variables:
```
 Filler: Viewers.Viewer;
  BEGIN NEW(Filler); Filler.handle := HandleFiller; Viewers.OpenTrack(D, X, W, Filler)
  END OpenTrack;
    ## Variables:
```
 prev: Viewers.DisplayArea;
  BEGIN prev := Viewers.CurDisplay; Viewers.CloseDisplay(D, hint);
    IF Viewers.CurDisplay # prev THEN Input.SetMouseLimits(Viewers.CurDisplay.curW, Viewers.CurDisplay.H) END
  END CloseDisplay;
    ## Variables:
```
 M: ControlMsg;
  BEGIN
    IF Viewers.FocusViewer # NIL  THEN
      M.id := defocus; Viewers.FocusViewer.handle(Viewers.FocusViewer, M)
    END ;
    Viewers.SetFocus(Viewers.ThisDisplay(V), V)
  END PassFocus;
    ## Variables:
```
 y: INTEGER;
      fil, top, bot, alt, max: Display.Frame;
  BEGIN Viewers.Locate(Viewers.CurDisplay, X, 0, fil, top, bot, alt, max);
    IF fil.H >= DH DIV 8 THEN y := DH ELSE y := max.Y + max.H DIV 2 END ;
    RETURN y
  END UY;
  PROCEDURE AllocateUserViewer* (DX: INTEGER; ## Variables:
```
 X, Y: INTEGER);
  BEGIN
    IF PointerOn() THEN X := Pointer.X; Y := Pointer.Y
    ELSE X := DX DIV DW * DW; Y := UY(X)
    END
  END AllocateUserViewer;
    ## Variables:
```
 H0, H1, H2, H3, y: INTEGER;
      fil, top, bot, alt, max: Display.Frame;
  BEGIN H3 := DH - DH DIV 3; H2 := H3 - H3 DIV 2; H1 := DH DIV 5; H0 := DH DIV 10;
    Viewers.Locate(Viewers.CurDisplay, X, DH, fil, top, bot, alt, max);
    IF fil.H >= DH DIV 8 THEN y := DH
    ELSIF max.H >= DH - H0 THEN y := max.Y + H3
    ELSIF max.H >= H3 - H0 THEN y := max.Y + H2
    ELSIF max.H >= H2 - H0 THEN y := max.Y + H1
    ELSE y := max.Y + max.H DIV 2
    END ;
    RETURN y
  END SY;
  PROCEDURE AllocateSystemViewer* (DX: INTEGER; ## Variables:
```
 X, Y: INTEGER);
  BEGIN
    IF PointerOn() THEN X := Pointer.X; Y := Pointer.Y
    ELSE X := DX DIV DW * DW + DW DIV 8 * 5; Y := SY(X)
    END
  END AllocateSystemViewer;
  PROCEDURE Skip(## Variables:
```
 S: Texts.Scanner; ## Variables:
```
 len: INTEGER);  (*count and skip white spaces*)
    ## Variables:
```
 ch: CHAR; i: INTEGER;
    ## Variables:
```
 ch: CHAR; i: INTEGER;
  BEGIN Texts.Read(S, ch); i := 0;
    WHILE (ch = " ") OR (ch = TAB) OR (ch = CR) DO
      IF ch = CR THEN INC(S.line) END ;
      Texts.Read(S, ch); INC(i)
    END ;
    S.nextCh := ch; len := i
  END Skip;
  PROCEDURE Scan(## Variables:
```
 S: Texts.Scanner);
    ## Variables:
```
 ch: CHAR; i: INTEGER;
    ## Variables:
```
 ch: CHAR; i: INTEGER;
  BEGIN ch := S.nextCh; i := 0;
    IF ("A" <= ch) & (ch <= "Z") OR ("a" <= ch) & (ch <= "z") OR (ch = "*") OR ("0" <= ch) & (ch <= "9") THEN (*command*)
      REPEAT S.s[i] := ch; INC(i); Texts.Read(S, ch)
      UNTIL ((ch < "0") & (ch # ".") & (ch # "*") OR ("9" < ch) & (ch < "A") OR ("Z" < ch) & (ch < "a") OR ("z" < ch)) OR (i = 31);
      S.s[i] := 0X; S.len := i; S.class := Texts.Name
    ELSE S.class := Texts.Inval
    END ;
    S.nextCh := ch
  END Scan;
    ## Variables:
```
 S: Texts.Scanner; res, len: INTEGER;
  BEGIN Texts.OpenScanner(S, T, pos); Skip(S, len); Scan(S);
    IF (S.class = Texts.Name) & (S.line = 0) THEN
      SetPar(F, T, pos + len + S.len, 0); Modules.Call(S.s, res);
      IF (res > Modules.noerr) & (res < Modules.clients) & (Log # NIL) THEN Texts.WriteString(W, "Call error: ");
        CASE res OF
           Modules.nofile: Texts.WriteString(W, Modules.importing); Texts.WriteString(W, " module not found")
         | Modules.badversion: Texts.WriteString(W, Modules.importing); Texts.WriteString(W, " bad version")
         | Modules.badkey: Texts.WriteString(W, Modules.importing); Texts.WriteString(W, " imports ");
             Texts.WriteString(W, Modules.imported); Texts.WriteString(W, " with bad key")
         | Modules.badfile: Texts.WriteString(W, Modules.importing); Texts.WriteString(W, " corrupted obj file")
         | Modules.nospace: Texts.WriteString(W, Modules.importing); Texts.WriteString(W, " insufficient space")
         | Modules.nocmd: Texts.WriteString(W, Modules.importing); Texts.WriteString(W, " command not found")
         | Modules.badcmd: Texts.WriteString(W, S.s); Texts.WriteString(W, " invalid command")
         | Modules.nomod: Texts.WriteString(W, Modules.importing); Texts.WriteString(W, " module not found")
        END ;
        Par.res := res; Texts.WriteLn(W); Texts.Append(Log, W.buf)
      END
    END
  END Call;
    ## Variables:
```
 S: Texts.Scanner; len: LONGINT; continue: BOOLEAN; 
  BEGIN continue := pos >= 0;
    WHILE continue DO
      Texts.OpenScanner(S, T, pos); Skip(S, len); Scan(S); continue := FALSE;
      IF S.class = Texts.Name THEN S.line := 0;
        Call(F, T, pos + len, FALSE);
        IF Par.res = 0 THEN
          REPEAT Texts.Scan(S) UNTIL S.eot OR (S.class = Texts.Char) & (S.c = "~");
          IF ~S.eot THEN pos := Texts.Pos(S); continue := TRUE END
        END
      END
    END
  END Run;
    ## Variables:
```
 mod: Modules.Module;
  BEGIN
    IF (ActCnt <= 0) OR (Kernel.allocated >= Kernel.heapLim - Kernel.heapOrg - 10000H) THEN
      mod := Modules.root; LED(21H);
      WHILE mod # NIL DO
        IF mod.name[0] # 0X THEN Kernel.Mark(mod.ptr) END ;
        mod := mod.next
      END ;
      LED(23H);
      Files.RestoreList; LED(27H);
      Kernel.Collect; LED(20H);
      Modules.Collect;
      ActCnt := BasicCycle
    END
  END GC;
    ## Variables:
```
 t: Task;
  BEGIN NEW(t); t.state := off; t.next := t; t.handle := h; t.period := period; RETURN t
  END NewTask;
  
  PROCEDURE Install* (T: Task);
  BEGIN
    IF T.state = off THEN
      T.next := CurTask.next; CurTask.next := T; T.state := idle; T.nextTime := 0; INC(NofTasks)
    END
  END Install;
    ## Variables:
```
 t: Task;
  BEGIN
    IF T.state # off THEN t := T;
      WHILE t.next # T DO t := t.next END ;
      t.next := T.next; T.state := off; T.next := NIL; CurTask := t; DEC(NofTasks)
    END
  END Remove;
    ## Variables:
```
 V: Viewers.Viewer; M: InputMsg; N: ControlMsg;
      prevX, prevY, X, Y, t: INTEGER; keys: SET; ch: CHAR;
  BEGIN
    REPEAT
      Input.Mouse(keys, X, Y);
      IF Input.Available() > 0 THEN Input.Read(ch);
        IF ch = ESC THEN
          N.id := neutralize; Viewers.Broadcast(N); FadePointer; LED(0)
        ELSIF ch = SETSTAR THEN
          N.id := mark; N.X := X; N.Y := Y; V := Viewers.This(X, Y); V.handle(V, N)
        ELSE M.id := consume; M.ch := ch; M.fnt := CurFnt; M.col := CurCol; M.voff := CurOff;
          V := Viewers.FocusViewer; V.handle(V, M); DEC(ActCnt)
        END
      ELSIF keys # {} THEN
        M.id := track; M.X := X; M.Y := Y; M.keys := keys;
        REPEAT V := Viewers.This(M.X, M.Y); V.handle(V, M); Input.Mouse(M.keys, M.X, M.Y)
        UNTIL M.keys = {};
        DEC(ActCnt)
      ELSE
        IF (X # prevX) OR (Y # prevY) OR ~MouseOn() THEN
          M.id := track; M.X := X;
          IF Y >= DH THEN Y := DH END ;
          M.Y := Y; M.keys := keys; V := Viewers.This(X, Y); V.handle(V, M); prevX := X; prevY := Y
        END ;
        CurTask := CurTask.next; t := Kernel.Time();
        IF t >= CurTask.nextTime THEN
          CurTask.nextTime := t + CurTask.period; CurTask.state := active; CurTask.handle; CurTask.state := idle
        END
      END
    UNTIL FALSE
  END Loop;
```
## Procedures:
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

