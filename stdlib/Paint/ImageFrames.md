
## [MODULE ImageFrames](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

  ## Imports:
` SYSTEM Display Viewers Input Fonts Texts Images Oberon MenuViewers`

  ## Constants:
```
 (*update message ids*)
    drawlayer = 1; drawlayers = 2; drawlayerd = 3;
    drawnorm = 4; drawsel = 5; drawdel = 6;

    markW = 5;

```
  ## Types:
```

    Frame* = POINTER TO FrameDesc;
    Location* = POINTER TO LocDesc;

    LocDesc* = RECORD
        x*, y*: INTEGER;
        next*: Location
      END ;

    FrameDesc* = RECORD (Display.FrameDesc)
        image*: Images.Image;
        Xg*, Yg*: INTEGER;  (*pos rel to image origin*)
        X1*, Y1*: INTEGER;  (*right and upper margins*)
        x*, y*, col*: INTEGER;  (*x = X + Xg, y = Y + Yg*)
        marked*, ticked*: BOOLEAN;
        mark*: LocDesc
      END ;

    DrawMsg* = RECORD (Images.Msg)
        f*: Frame;
        x*, y*, col*, mode*: INTEGER
      END ;

    UpdateMsg = RECORD (Display.FrameMsg)
        id: INTEGER;
        image: Images.Image;
        layer: Images.Layer
      END ;

    ChangedMsg = RECORD (Display.FrameMsg)
        f: Frame;
        image: Images.Image;
        mode: INTEGER
      END ;

    SelQuery = RECORD (Display.FrameMsg)
        f: Frame; time: LONGINT
      END ;

    FocusQuery = RECORD (Display.FrameMsg)
        f: Frame
      END ;

    PosQuery = RECORD (Display.FrameMsg)
        f: Frame; x, y: INTEGER
      END ;

    DispMsg = RECORD (Display.FrameMsg)
        x1, y1, w: INTEGER;
        pat: INTEGER;
        image: Images.Image
      END ;

```
  ## Variables:
```
 Crosshair*: Oberon.Marker;
    tack*, dotted*, dotted1*: INTEGER;  (*patterns*)
    (* newcap: Graphics.Caption; *)
    TBuf: Texts.Buffer;
    DW, DH, CL: INTEGER;
    W: Texts.Writer;
    ## Variables:
```
 x, x0, y: INTEGER; M: DrawMsg;
  BEGIN F.X1 := F.X + F.W; F.Y1 := F.Y + F.H;
    F.x := (F.X + F.Xg) DIV 16 * 16; F.y := (F.Y + F.Yg) DIV 16 * 16; F.marked := FALSE; F.mark.next := NIL;
    Oberon.RemoveMarks(F.X, F.Y, F.W, F.H); Display.ReplConst(F.col, F.X, F.Y, F.W, F.H, 0);
    IF F.ticked THEN
      x0 := (F.X + 15) DIV 16 * 16; y := (F.Y + 15) DIV 16 * 16;
      WHILE y < F.Y1 DO
        x := x0;
        WHILE x < F.X1 DO Display.Dot(Display.white, x, y, Display.replace); INC(x, 16) END ;
        INC(y, 16)
      END
    END ;
    M.f := F; M.x := F.x; M.y := F.y; M.col := 0; M.mode := 0; Images.Draw(F.image, M);
    IF F.image.changed THEN SetChangeMark(F, 1) END
  END Restore;
    ## Variables:
```
 FQ: FocusQuery;
  BEGIN FQ.f := NIL; Viewers.Broadcast(FQ); RETURN FQ.f
  END Focus;
    ## Variables:
```
 SQ: SelQuery;
  BEGIN SQ.f := NIL; SQ.time := 0; Viewers.Broadcast(SQ); RETURN SQ.f
  END Selected;
    ## Variables:
```
 PQ: PosQuery;
  BEGIN PQ.f := NIL; PQ.x := x; PQ.y := y; Viewers.Broadcast(PQ); RETURN PQ.f
  END This;
    ## Variables:
```
 CM: ChangedMsg;
  BEGIN CM.f := F; CM.image := F.image; CM.mode := mode; Viewers.Broadcast(CM)
  END Mark;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawsel; UM.image := F.image; Viewers.Broadcast(UM)
  END Draw;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawnorm; UM.image := F.image; Viewers.Broadcast(UM)
  END DrawNorm;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawdel; UM.image := F.image; Viewers.Broadcast(UM); Mark(F, 1)
  END Erase;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawlayer; UM.image := F.image; UM.layer := L; Viewers.Broadcast(UM)
  END DrawLayer;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawlayerd; UM.image := F.image; UM.layer := L; Viewers.Broadcast(UM)
  END EraseLayer;
  PROCEDURE Change*(F: Frame; ## Variables:
```
 msg: Images.Msg);
  BEGIN
    IF F # NIL THEN Erase(F); Images.Change(F.image, msg); Draw(F) END
  END Change;
    ## Variables:
```
 m: Location;
  BEGIN (* newcap := NIL; *)
    IF F.marked THEN
      FlipMark(F.mark.x, F.mark.y); m := F.mark.next;
      WHILE m # NIL DO FlipMark(m.x, m.y); m := m.next END ;
      F.marked := FALSE; F.mark.next := NIL
    END
  END Defocus;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN
    IF F # NIL THEN
      UM.id := drawnorm; UM.image := F.image; Viewers.Broadcast(UM);
      Images.Deselect(F.image)
    END
  END Deselect;
    ## Variables:
```
 L: Images.Layer;
      x1, y1, w, h, t: INTEGER;
      beg, end, time: LONGINT;
      k1, k2: SET;
      mark, newmark: Location;
      T: Texts.Text;
      Fd: Frame;
      I: Images.Image;  
  BEGIN  k1 := k0; I := F.image;
    REPEAT Input.Mouse(k2, x1, y1); k1 := k1 + k2;
      DEC(x1, (x1-F.x) MOD 4); DEC(y1, (y1-F.y) MOD 4);
      Oberon.DrawMouse(Crosshair, x1, y1)
    UNTIL  k2 = {};
    Oberon.FadeMouse;
    IF k0 = {2} THEN (*left key*)
      w := ABS(x1-x0); h := ABS(y1-y0);
      IF k1 = {2} THEN
        IF (w < 7) & (h < 7) THEN (*set mark*)
          IF (x1 - markW >= F.X) & (x1 + markW < F.X1) &
            (y1 - markW >= F.Y) & (y1 + markW < F.Y1) THEN
            Defocus(F); Oberon.PassFocus(Viewers.This(F.X, F.Y));
            F.mark.x := x1; F.mark.y := y1; F.marked := TRUE; FlipMark(x1, y1)
          END
        ELSE (*draw line*) Deselect(F);
(*
          IF w < h THEN
            IF y1 < y0 THEN y0 := y1 END ;
            NewLine(F, I, x0, y0, Images.width, h)
          ELSE
            IF x1 < x0 THEN x0 := x1 END ;
            NewLine(F, I, x0, y0, w, Images.width)
          END ;
*)
          Draw(F)
        END
      ELSIF k1 = {2, 1} THEN (*copy text selection to mark*)
        Deselect(F); (* Oberon.GetSelection(T, beg, end, time);
        IF time >= 0 THEN
          DrawObj(F, CaptionCopy(F, x1, y1, T, beg, end)); Mark(F, 1)
        END *)
      ELSIF k1 = {2, 0} THEN
        IF F.marked THEN (*set secondary mark*)
            NEW(newmark); newmark.x := x1; newmark.y := y1; newmark.next := NIL;
          FlipMark(x1, y1); mark := F.mark.next;
          IF mark = NIL THEN F.mark.next := newmark ELSE
            WHILE mark.next # NIL DO mark := mark.next END ;
            mark.next := newmark
          END
        END
      END
    ELSIF k0 = {1} THEN (*middle key*)
      IF k1 = {1} THEN (*move*)
(*
        IF (x0 # x1) OR (y0 # y1) THEN
          Fd := This(x1, y1); Erase(F);
          IF Fd = F THEN Images.Move(I, x1-x0, y1-y0)
          ELSIF (Fd # NIL) & (Fd.image = I) THEN
            Images.Move(I, (x1-Fd.x-x0+F.x) DIV 4 * 4, (y1-Fd.y-y0+F.y) DIV 4 * 4)
          END ;
          Draw(F); Mark(F, 1)
        END
 (*   ## Variables:
```
 w1, h1: INTEGER; DM: DispMsg; *)
  BEGIN (* DM.graph := F.graph;
    Fonts.GetUniPat(W.fnt, codepoint, DM.w, DM.x1, DM.y1, w1, h1, DM.pat); DEC(DM.y1, W.fnt.minY);
    IF newcap.x + newcap.w + DM.w + F.x < F.X1 THEN
      Viewers.Broadcast(DM); INC(newcap.w, DM.w); INC(newcap.len, Texts.UnicodeWidth(codepoint)); Texts.WriteUnicode(W, codepoint)
    END ;
    Texts.Append(Graphics.T, W.buf) *)
  END InsertChar;
  (*  ## Variables:
```
 w1, h1, charlen, codepoint, pos: INTEGER; ch: CHAR;
      DM: DispMsg; R: Texts.Reader; *)
  BEGIN (* DM.graph := F.graph;
    IF newcap.len > 0 THEN
      charlen := 0; (*backspace*)
      pos := Graphics.T.len;
      REPEAT INC(charlen);
        Texts.OpenReader(R, Graphics.T, pos-charlen);
        Texts.Read(R, ch);
      UNTIL (ch < 80X) OR (ch >= 0C0X); (* skip over continuation *)
      Texts.OpenReader(R, Graphics.T, pos-charlen);
      Texts.ReadUnicode(R, codepoint);
      IF codepoint >= ORD(" ") THEN
        Fonts.GetUniPat(R.fnt, codepoint, DM.w, DM.x1, DM.y1, w1, h1, DM.pat);
        DEC(newcap.w, DM.w); DEC(newcap.len, charlen); DEC(DM.y1, R.fnt.minY);
        Viewers.Broadcast(DM); Texts.Delete(Graphics.T, pos-charlen, pos, TBuf)
      END
    END *)
  END DeleteChar;
  PROCEDURE GetSelection(F: Frame; ## Variables:
```
 text: Texts.Text; ## Variables:
```
 beg, end: (*, time:*) LONGINT);
 (*   ## Variables:
```
 obj: Graphics.Object; *)
 (*   ## Variables:
```
 obj: Graphics.Object; *)
  BEGIN (* obj := F.graph.sel;
    IF (obj # NIL) & (F.graph.time >= time) THEN
      CASE obj OF Graphics.Caption:
        beg := obj.pos; end := obj.pos + obj.len; text := Graphics.T; time := F.graph.time
      END
    END *)
  END GetSelection;
  PROCEDURE Handle*(F: Display.Frame; ## Variables:
```
 M: Display.FrameMsg);
    ## Variables:
```
 x, y, h: INTEGER;
    ## Variables:
```
 x, y, h: INTEGER;
      DM: DispMsg; dM: DrawMsg;
      F1: Frame;
  BEGIN  
    CASE F OF Frame:
      CASE M OF
      Oberon.InputMsg:
        IF M.id = Oberon.track THEN
          x := M.X - (M.X - F.x) MOD 4; y := M.Y - (M.Y - F.y) MOD 4;
          IF M.keys # {} THEN Edit(F, x, y, M.keys) ELSE Oberon.DrawMouse(Crosshair, x, y) END
        ELSIF M.id = Oberon.consume THEN
          IF M.codepoint = 7FH THEN (*DEL*)
            Erase(F); Images.Delete(F.image); Mark(F, 1)
          (*
          ELSIF (M.codepoint >= 20H) THEN
            IF newcap # NIL THEN InsertChar(F, M.codepoint); Mark(F, 1)
            ELSIF F.marked THEN
              Defocus(F); Deselect(F); NewCaption(F, M.col, M.fnt); InsertChar(F, M.codepoint)
            END
          ELSIF (M.codepoint = ORD(08X)) & (newcap # NIL) THEN DeleteChar(F); Mark(F, 1)
          *)
          END
        END
      | UpdateMsg:
          IF M.image = F.image THEN
            dM.f := F; dM.x := F.x; dM.y := F.y; dM.col := 0;
            IF M.id = drawlayer THEN dM.mode := 0; M.layer.do.draw(M.layer, dM)
            ELSIF M.id = drawlayers THEN dM.mode := 1; M.layer.do.draw(M.layer, dM)
            ELSIF M.id = drawlayerd THEN dM.mode := 3; M.layer.do.draw(M.layer, dM)
            ELSIF M.id = drawsel THEN  dM.mode := 0; Images.DrawSel(F.image, dM)
            ELSIF M.id = drawnorm THEN dM.mode := 2; Images.DrawSel(F.image, dM)
            ELSIF M.id = drawdel THEN dM.mode := 3; Images.DrawSel(F.image, dM)
            END
          END
      | ChangedMsg:
          IF M.image = F.image THEN SetChangeMark(F, M.mode) END
      | SelQuery:
          IF (F.image.sel # NIL) (* & (M.time < F.image.time) *) THEN M.f := F(Frame) (* ; M.time := F.image.time *) END
      | FocusQuery: IF F.marked THEN M.f := F END
      | PosQuery: IF (F.X <= M.x) & (M.x < F.X1) & (F.Y <= M.y) & (M.y < F.Y1) THEN M.f := F END
      | DispMsg:
        DM := M;
        x := F.x (*+ newcap.x + newcap.w *); y := F.y (*+ newcap.y*) ;
        IF (DM.image = F.image) & (x >= F.X) & (x + DM.w < F.X1) & (y >= F.Y) & (y < F.Y1) THEN
          Display.CopyPattern(Oberon.CurCol, DM.pat, x + DM.x1, y + DM.y1, 2);
          (*Display.ReplConst(Display.white, x, y, DM.w, newcap.h, 2)*)
        END
      | Oberon.ControlMsg:
          IF M.id = Oberon.neutralize THEN
            Oberon.RemoveMarks(F.X, F.Y, F.W, F.H); Defocus(F); DrawNorm(F); Images.Deselect(F.image)
          ELSIF M.id = Oberon.defocus THEN Defocus(F)
          END
      | Oberon.SelectionMsg: GetSelection(F, M.text, M.beg, M.end (*, M.time *))
      | Oberon.CopyMsg: Oberon.RemoveMarks(F.X, F.Y, F.W, F.H); Defocus(F); NEW(F1); F1^ := F^; M.F := F1
      | MenuViewers.ModifyMsg: F.Y := M.Y; F.H := M.H; Restore(F)
      END
    END  
  END Handle;
  PROCEDURE DrawLine(obj: Images.Layer; ## Variables:
```
 M: Images.Msg);
(*
       M.mode = 0: draw according to state,
        = 1: normal -> selected,
        = 2: selected -> normal,
        = 3: erase
*)
    ## Variables:
```
 x, y, w, h, col: INTEGER; f: Frame;
    ## Variables:
```
 x, y, w, h, col: INTEGER; f: Frame;
  BEGIN
    CASE M OF DrawMsg:
      x := obj.x + M.x; y := obj.y + M.y; w := obj.w; h := obj.h; f := M.f;
      IF (x+w > f.X) & (x < f.X1) & (y+h > f.Y) & (y < f.Y1) THEN
        col := Display.white;
        IF (M.mode = 0) & obj.selected OR (M.mode = 1) THEN
          ReplPattern(f, col, Display.grey, x, y, w, h, Display.replace)
        ELSIF M.mode IN {0, 2} THEN ReplConst(f, col, x, y, w, h, Display.replace)
        ELSIF M.mode = 3 THEN ReplConst(f, Display.black, x, y, w, h, Display.replace)  (*erase*)
        END
      END
    END
  END DrawLine;
  PROCEDURE DrawCaption(obj: Images.Layer; ## Variables:
```
 M: Images.Msg);
    ## Variables:
```
 x, y, dx, x0, x1, y0, y1, w, h, w1, h1, col, codepoint: INTEGER;
    ## Variables:
```
 x, y, dx, x0, x1, y0, y1, w, h, w1, h1, col, codepoint: INTEGER;
      f: Frame;
      pat: INTEGER; fnt: Fonts.Font;
      R: Texts.Reader;
  BEGIN
(*
    CASE M OF DrawMsg:
      x := obj.x + M.x; y := obj.y + M.y; w := obj.w; h := obj.h; f := M.f;
      IF (f.X <= x) & (x <= f.X1) & (f.Y <= y) & (y+h <= f.Y1) THEN
        IF x+w > f.X1 THEN w := f.X1-x END ;
        Texts.OpenReader(R, Graphics.T, obj(Graphics.Caption).pos); Texts.ReadUnicode(R, codepoint);
        IF M.mode = 0 THEN
          IF codepoint >= ORD(" ") THEN
            fnt := R.fnt; x0 := x; y0 := y - fnt.minY;
            REPEAT Fonts.GetUniPat(fnt, codepoint, dx, x1, y1, w1, h1, pat);
              IF x0+x1+w1 <= f.X1 THEN
                Display.CopyPattern(col, pat, x0+x1, y0+y1, Display.paint); INC(x0, dx); Texts.ReadUnicode(R, codepoint)
              ELSE codepoint := 0
              END
            UNTIL codepoint < ORD(" ");
            IF obj.selected THEN ReplConst(f, Display.white, x, y, w, h, Display.invert) END
          END
        ELSIF M.mode IN {1, 2} THEN ReplConst(f, Display.white, x, y, w, h, Display.invert)
        ELSIF M.mode = 3 THEN ReplConst(f, Display.black, x, y, w, h, Display.replace)
        END
      END
    END
*)
  END DrawCaption;
  PROCEDURE DrawMacro(obj: Images.Layer; ## Variables:
```
 M: Images.Msg);
    ## Variables:
```
 x, y, w, h: INTEGER;
    ## Variables:
```
 x, y, w, h: INTEGER;
      f: Frame; M1: DrawMsg;
  BEGIN
(*
    CASE M OF DrawMsg:
      x := obj.x + M.x; y := obj.y + M.y; w := obj.w; h := obj.h; f := M.f;
      IF (x+w > f.X) & (x < f.X1) & (y+h > f.Y) & (y < f.Y1) THEN
        M1.x := x; M1.y := y;
        IF M.mode = 0 THEN
          M1.f := f; M1.col := obj.col; M1.mode := 0; Graphics.DrawMac(obj(Graphics.Macro).mac, M1);
          IF obj.selected THEN ReplPattern(f, Display.white, dotted, x, y, w, h, Display.invert) END
        ELSIF M.mode IN {1, 2} THEN ReplPattern(f, Display.white, dotted, x, y, w, h, Display.invert)
        ELSIF M.mode = 3 THEN ReplConst(f, Display.black, x, y, w, h, Display.replace)
        END
      END
    END
*)
  END DrawMacro;
```
## Procedures:
---

`  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L75)


`  PROCEDURE Restore*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L84)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L101)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L112)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L117)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L122)


`  PROCEDURE Mark(F: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L127)


`  PROCEDURE Draw*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L132)


`  PROCEDURE DrawNorm(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L137)


`  PROCEDURE Erase*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L142)


`  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L147)


`  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L152)


`  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L157)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L162)


`  PROCEDURE Defocus*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L168)


`  PROCEDURE Deselect*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L178)


`  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L187)


`  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L282)


`  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L290)


`  PROCEDURE DeleteChar(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L300)


`  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L321)


`  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L331)


`  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L391)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L397)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L406)


`  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L415)


`  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L437)


`  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L469)


`  PROCEDURE Open*(F: Frame; I: Images.Image);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L492)

