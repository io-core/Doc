
## [MODULE VaultFrames](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod)

  ## Imports:
` SYSTEM Display Viewers Input Fonts Texts Vaults Oberon MenuViewers`

  ## Constants:
```
 (*update message ids*)
    drawdocument = 1; drawdocuments = 2; drawdocumentd = 3;
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
        vault*: Vaults.Vault;
        Xg*, Yg*: INTEGER;  (*pos rel to vault origin*)
        X1*, Y1*: INTEGER;  (*right and upper margins*)
        x*, y*, col*: INTEGER;  (*x = X + Xg, y = Y + Yg*)
        marked*, ticked*: BOOLEAN;
        mark*: LocDesc
      END ;

    DrawMsg* = RECORD (Vaults.Msg)
        f*: Frame;
        x*, y*, col*, mode*: INTEGER
      END ;

    UpdateMsg = RECORD (Display.FrameMsg)
        id: INTEGER;
        vault: Vaults.Vault;
        document: Vaults.Document
      END ;

    ChangedMsg = RECORD (Display.FrameMsg)
        f: Frame;
        vault: Vaults.Vault;
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
        vault: Vaults.Vault
      END ;

```
  ## Variables:
```
 Crosshair*: Oberon.Marker;
    tack*, dotted*, dotted1*: INTEGER;  (*patterns*)
    (* newcap: Graphics.Caption; *)
    TBuf: Texts.Buffer;
    DW, DH, CL: INTEGER;
    w: Texts.Writer;
    ## Variables:
```
 x, x0, y: INTEGER; m: DrawMsg;
  BEGIN f.X1 := f.X + f.W; f.Y1 := f.Y + f.H;
    f.x := (f.X + f.Xg) DIV 16 * 16; f.y := (f.Y + f.Yg) DIV 16 * 16; f.marked := FALSE; f.mark.next := NIL;
    Oberon.RemoveMarks(f.X, f.Y, f.W, f.H); Display.ReplConst(f.col, f.X, f.Y, f.W, f.H, 0);
    IF f.ticked THEN
      x0 := (f.X + 15) DIV 16 * 16; y := (f.Y + 15) DIV 16 * 16;
      WHILE y < f.Y1 DO
        x := x0;
        WHILE x < f.X1 DO Display.Dot(Display.white, x, y, Display.replace); INC(x, 16) END ;
        INC(y, 16)
      END
    END ;
    m.f := f; m.x := f.x; m.y := f.y; m.col := 0; m.mode := 0; Vaults.Draw(f.vault, m);
    IF f.vault.changed THEN SetChangeMark(f, 1) END
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
  BEGIN CM.f := f; CM.vault := f.vault; CM.mode := mode; Viewers.Broadcast(CM)
  END Mark;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawsel; UM.vault := f.vault; Viewers.Broadcast(UM)
  END Draw;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawnorm; UM.vault := f.vault; Viewers.Broadcast(UM)
  END DrawNorm;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawdel; UM.vault := f.vault; Viewers.Broadcast(UM); Mark(f, 1)
  END Erase;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawdocument; UM.vault := f.vault; UM.document := L; Viewers.Broadcast(UM)
  END DrawDocument;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN UM.id := drawdocumentd; UM.vault := f.vault; UM.document := D; Viewers.Broadcast(UM)
  END EraseDocument;
  PROCEDURE Change*(f: Frame; ## Variables:
```
 msg: Vaults.Msg);
  BEGIN
    IF F # NIL THEN Erase(f); Vaults.Change(f.vault, msg); Draw(f) END
  END Change;
    ## Variables:
```
 m: Location;
  BEGIN (* newcap := NIL; *)
    IF f.marked THEN
      FlipMark(f.mark.x, f.mark.y); m := f.mark.next;
      WHILE m # NIL DO FlipMark(m.x, m.y); m := m.next END ;
      f.marked := FALSE; f.mark.next := NIL
    END
  END Defocus;
    ## Variables:
```
 UM: UpdateMsg;
  BEGIN
    IF f # NIL THEN
      UM.id := drawnorm; UM.vault := f.vault; Viewers.Broadcast(UM);
      Vaults.Deselect(f.vault)
    END
  END Deselect;
    ## Variables:
```
 D: Vaults.Document;
      x1, y1, w, h, t: INTEGER;
      beg, end, time: LONGINT;
      k1, k2: SET;
      mark, newmark: Location;
      t: Texts.Text;
      Fd: Frame;
      V: Vaults.Vault;  
  BEGIN  k1 := k0; V := F.vault;
    REPEAT Input.Mouse(k2, x1, y1); k1 := k1 + k2;
      DEC(x1, (x1-F.x) MOD 4); DEC(y1, (y1-F.y) MOD 4);
      Oberon.DrawMouse(Crosshair, x1, y1)
    UNTIL  k2 = {};
    Oberon.FadeMouse;
    IF k0 = {2} THEN (*left key*)
      w := ABS(x1-x0); h := ABS(y1-y0);
      IF k1 = {2} THEN
        IF (w < 7) & (h < 7) THEN (*set mark*)
          IF (x1 - markW >= f.X) & (x1 + markW < f.X1) &
            (y1 - markW >= f.Y) & (y1 + markW < f.Y1) THEN
            Defocus(F); Oberon.PassFocus(Viewers.This(f.X, F.Y));
            f.mark.x := x1; f.mark.y := y1; f.marked := TRUE; FlipMark(x1, y1)
          END
        ELSE (*draw line*) Deselect(f);
(*
          IF w < h THEN
            IF y1 < y0 THEN y0 := y1 END ;
            NewLine(f, V, x0, y0, Vaults.width, h)
          ELSE
            IF x1 < x0 THEN x0 := x1 END ;
            NewLine(f, V, x0, y0, w, Vaults.width)
          END ;
*)
          Draw(f)
        END
      ELSIF k1 = {2, 1} THEN (*copy text selection to mark*)
        Deselect(f); (* Oberon.GetSelection(t, beg, end, time);
        IF time >= 0 THEN
          DrawObj(f, CaptionCopy(f, x1, y1, t, beg, end)); Mark(f, 1)
        END *)
      ELSIF k1 = {2, 0} THEN
        IF f.marked THEN (*set secondary mark*)
            NEW(newmark); newmark.x := x1; newmark.y := y1; newmark.next := NIL;
          FlipMark(x1, y1); mark := f.mark.next;
          IF mark = NIL THEN f.mark.next := newmark ELSE
            WHILE mark.next # NIL DO mark := mark.next END ;
            mark.next := newmark
          END
        END
      END
    ELSIF k0 = {1} THEN (*middle key*)
      IF k1 = {1} THEN (*move*)
(*
        IF (x0 # x1) OR (y0 # y1) THEN
          Fd := This(x1, y1); Erase(f);
          IF Fd = f THEN Vaults.Move(I, x1-x0, y1-y0)
          ELSIF (Fd # NIL) & (Fd.vault = V) THEN
            Vaults.Move(V, (x1-Fd.x-x0+f.x) DIV 4 * 4, (y1-Fd.y-y0+f.y) DIV 4 * 4)
          END ;
          Draw(f); Mark(f, 1)
        END
 (*   ## Variables:
```
 w1, h1: INTEGER; DM: DispMsg; *)
  BEGIN (* DM.graph := F.graph;
    Fonts.GetUniPat(w.fnt, codepoint, DM.w, DM.x1, DM.y1, w1, h1, DM.pat); DEC(DM.y1, w.fnt.minY);
    IF newcap.x + newcap.w + DM.w + F.x < F.X1 THEN
      Viewers.Broadcast(DM); INC(newcap.w, DM.w); INC(newcap.len, Texts.UnicodeWidth(codepoint)); Texts.WriteUnicode(w, codepoint)
    END ;
    Texts.Append(Graphics.T, w.buf) *)
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
  PROCEDURE GetSelection(f: Frame; ## Variables:
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
  PROCEDURE Handle*(f: Display.Frame; ## Variables:
```
 m: Display.FrameMsg);
    ## Variables:
```
 x, y, h: INTEGER;
    ## Variables:
```
 x, y, h: INTEGER;
      DM: DispMsg; dM: DrawMsg;
      F1: Frame;
  BEGIN  
    CASE f OF Frame:
      CASE m OF
      Oberon.InputMsg:
        IF m.id = Oberon.track THEN
          x := m.X - (m.X - f.x) MOD 4; y := m.Y - (m.Y - f.y) MOD 4;
          IF m.keys # {} THEN Edit(f, x, y, m.keys) ELSE Oberon.DrawMouse(Crosshair, x, y) END
        ELSIF m.id = Oberon.consume THEN
          IF m.codepoint = 7FH THEN (*DEL*)
            Erase(f); Vaults.Delete(f.vault); Mark(f, 1)
          (*
          ELSIF (m.codepoint >= 20H) THEN
            IF newcap # NIL THEN InsertChar(f, m.codepoint); Mark(f, 1)
            ELSIF f.marked THEN
              Defocus(f); Deselect(f); NewCaption(f, m.col, m.fnt); InsertChar(f, m.codepoint)
            END
          ELSIF (m.codepoint = ORD(08X)) & (newcap # NIL) THEN DeleteChar(f); Mark(f, 1)
          *)
          END
        END
      | UpdateMsg:
          IF m.vault = f.vault THEN
            dM.f := f; dM.x := f.x; dM.y := f.y; dM.col := 0;
            IF m.id = drawdocument THEN dM.mode := 0; m.document.do.draw(m.document, dM)
            ELSIF m.id = drawdocuments THEN dM.mode := 1; m.document.do.draw(m.document, dM)
            ELSIF m.id = drawdocumentd THEN dM.mode := 3; m.document.do.draw(m.document, dM)
            ELSIF m.id = drawsel THEN  dM.mode := 0; Vaults.DrawSel(f.vault, dM)
            ELSIF m.id = drawnorm THEN dM.mode := 2; Vaults.DrawSel(f.vault, dM)
            ELSIF m.id = drawdel THEN dM.mode := 3; Vaults.DrawSel(f.vault, dM)
            END
          END
      | ChangedMsg:
          IF m.vault = f.vault THEN SetChangeMark(f, m.mode) END
      | SelQuery:
          IF (f.vault.sel # NIL) (* & (m.time < f.vault.time) *) THEN m.f := f(Frame) (* ; m.time := f.vault.time *) END
      | FocusQuery: IF f.marked THEN m.f := f END
      | PosQuery: IF (f.X <= m.x) & (m.x < f.X1) & (f.Y <= m.y) & (m.y < f.Y1) THEN m.f := f END
      | DispMsg:
        DM := m;
        x := f.x (*+ newcap.x + newcap.w *); y := f.y (*+ newcap.y*) ;
        IF (DM.vault = f.vault) & (x >= f.X) & (x + DM.w < f.X1) & (y >= f.Y) & (y < f.Y1) THEN
          Display.CopyPattern(Oberon.CurCol, DM.pat, x + DM.x1, y + DM.y1, 2);
          (*Display.ReplConst(Display.white, x, y, DM.w, newcap.h, 2)*)
        END
      | Oberon.ControlMsg:
          IF m.id = Oberon.neutralize THEN
            Oberon.RemoveMarks(f.X, f.Y, f.W, f.H); Defocus(f); DrawNorm(f); Vaults.Deselect(f.vault)
          ELSIF m.id = Oberon.defocus THEN Defocus(f)
          END
      | Oberon.SelectionMsg: GetSelection(f, m.text, m.beg, m.end (*, m.time *))
      | Oberon.CopyMsg: Oberon.RemoveMarks(f.X, f.Y, f.W, f.H); Defocus(f); NEW(F1); F1^ := f^; m.F := F1
      | MenuViewers.ModifyMsg: f.Y := m.Y; f.H := m.H; Restore(f)
      END
    END  
  END Handle;
  PROCEDURE DrawLine(obj: Vaults.Document; ## Variables:
```
 m: Vaults.Msg);
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
    CASE m OF DrawMsg:
      x := obj.x + m.x; y := obj.y + m.y; w := obj.w; h := obj.h; f := m.f;
      IF (x+w > f.X) & (x < f.X1) & (y+h > f.Y) & (y < f.Y1) THEN
        col := Display.white;
        IF (m.mode = 0) & obj.selected OR (m.mode = 1) THEN
          ReplPattern(f, col, Display.grey, x, y, w, h, Display.replace)
        ELSIF m.mode IN {0, 2} THEN ReplConst(f, col, x, y, w, h, Display.replace)
        ELSIF m.mode = 3 THEN ReplConst(f, Display.black, x, y, w, h, Display.replace)  (*erase*)
        END
      END
    END
  END DrawLine;
  PROCEDURE DrawCaption(obj: Vaults.Document; ## Variables:
```
 m: Vaults.Msg);
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
  PROCEDURE DrawMacro(obj: Vaults.Document; ## Variables:
```
 m: Vaults.Msg);
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

`  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L79)


`  PROCEDURE Restore*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L88)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L105)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L116)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L121)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L126)


`  PROCEDURE Mark(f: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L131)


`  PROCEDURE Draw*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L136)


`  PROCEDURE DrawNorm(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L141)


`  PROCEDURE Erase*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L146)


`  PROCEDURE DrawDocument*(f: Frame; L: Vaults.Document);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L151)


`  PROCEDURE EraseDocument*(f: Frame; D: Vaults.Document);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L156)


`  PROCEDURE Change*(f: Frame; VAR msg: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L161)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L166)


`  PROCEDURE Defocus*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L172)


`  PROCEDURE Deselect*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L182)


`  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L191)


`  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L286)


`  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L294)


`  PROCEDURE DeleteChar(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L304)


`  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L325)


`  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L335)


`  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L395)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L401)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L410)


`  PROCEDURE DrawLine(obj: Vaults.Document; VAR m: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L419)


`  PROCEDURE DrawCaption(obj: Vaults.Document; VAR m: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L441)


`  PROCEDURE DrawMacro(obj: Vaults.Document; VAR m: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L473)


`  PROCEDURE Open*(f: Frame; V: Vaults.Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L496)

