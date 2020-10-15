
## [MODULE Attest](https://github.com/io-core/Attest/blob/main/Attest.Mod)

  ## Imports:
` Files Fonts Viewers Texts Oberon
  ## Constants:
```
 Menu = "System.Close  System.Copy  System.Grow  Attest.Delete  Attest.Ticks  Attest.Restore  Attest.Store";

  VAR W: Texts.Writer;

  (*Exported commands:
    Open, Delete,
    SetWidth, ChangeColor, ChangeWidth, ChangeFont,
    Store, Print, Macro, Ticks, Restore*)

  PROCEDURE Open*;
    VAR X, Y: INTEGER;
      beg, end, t: LONGINT;
      I: KeySafes.KeySafe;
      F: KeySafeFrames.Frame;
      V: Viewers.Viewer;
      S: Texts.Scanner;
      text: Texts.Text;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF (S.class = Texts.Char) & (S.codepoint = ORD("^")) THEN
      Oberon.GetSelection(text, beg, end, t);
      IF t >= 0 THEN Texts.OpenScanner(S, text, beg); Texts.Scan(S) END
    END ;
    IF S.class = Texts.Name THEN
      NEW(I); KeySafes.Open(I, S.s);
      NEW(F); KeySafeFrames.Open(F, I);
      Oberon.AllocateUserViewer(Oberon.Par.vwr.X, X, Y);
      V := MenuViewers.New(TextFrames.NewMenu(S.s, Menu), F, TextFrames.menuH, X, Y)
    END
  END Open;

  PROCEDURE Delete*;
    VAR F: KeySafeFrames.Frame;
  BEGIN
    IF Oberon.Par.frame = Oberon.Par.vwr.dsc THEN
      F := Oberon.Par.vwr.dsc.next(KeySafeFrames.Frame);
      KeySafeFrames.Erase(F); KeySafes.Delete(F.image)
    END
  END Delete;

  PROCEDURE GetArg(VAR S: Texts.Scanner);
    VAR T: Texts.Text; beg, end, time: LONGINT;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF (S.class = Texts.Char) & (S.codepoint = ORD("^")) THEN
      Oberon.GetSelection(T, beg, end, time);
      IF time >= 0 THEN Texts.OpenScanner(S, T, beg); Texts.Scan(S) END
    END
  END GetArg;

  PROCEDURE SetWidth*;
    VAR S: Texts.Scanner;
  BEGIN GetArg(S);
    IF (S.class = Texts.Int) & (S.i > 0) & (S.i < 7) THEN KeySafes.SetWidth(S.i) END
  END SetWidth;

  PROCEDURE ChangeColor*;
    VAR S: Texts.Scanner; CM: KeySafes.ColorMsg;
  BEGIN GetArg(S);
    IF S.class = Texts.Int THEN
      CM.col := S.i MOD 16; KeySafeFrames.Change(KeySafeFrames.Selected(), CM)
    END
  END ChangeColor;

  PROCEDURE ChangeWidth*;
    VAR S: Texts.Scanner; WM: KeySafes.WidMsg;
  BEGIN GetArg(S);
    IF S.class = Texts.Int THEN
      WM.w := S.i; KeySafeFrames.Change(KeySafeFrames.Selected(), WM)
    END
  END ChangeWidth;

  PROCEDURE ChangeFont*;
    VAR S: Texts.Scanner; FM: KeySafes.FontMsg;
  BEGIN GetArg(S);
    IF S.class = Texts.Name THEN
      FM.fnt := Fonts.This(S.s);
      IF FM.fnt # NIL THEN KeySafeFrames.Change(KeySafeFrames.Selected(), FM) END
    END
  END ChangeFont;

  PROCEDURE Redraw(Q: BOOLEAN);
    VAR v: Viewers.Viewer; G: KeySafeFrames.Frame;
  BEGIN
    IF Oberon.Par.frame = Oberon.Par.vwr.dsc THEN v := Oberon.Par.vwr
    ELSE v := Oberon.MarkedViewer()
    END ;
    IF (v # NIL) & (v.dsc # NIL) & (v.dsc.next IS KeySafeFrames.Frame) THEN
      G := v.dsc.next(KeySafeFrames.Frame); G.ticked := Q OR ~G.ticked; KeySafeFrames.Restore(G)
    END
  END Redraw;

  PROCEDURE Ticks*;
  BEGIN Redraw(FALSE)
  END Ticks;

  PROCEDURE Restore*;
  BEGIN Redraw(TRUE)
  END Restore;

  PROCEDURE Backup (VAR name: ARRAY OF CHAR);
    VAR res, i: INTEGER; ch: CHAR;
      bak: ARRAY 32 OF CHAR;
  BEGIN i := 0; ch := name[0];
    WHILE ch > 0X DO bak[i] := ch; INC(i); ch := name[i] END ;
    IF i < 28 THEN
      bak[i] := "."; bak[i+1] := "B"; bak[i+2] := "a"; bak[i+3] := "k"; bak[i+4] := 0X;
      Files.Rename(name, bak, res)
    END
  END Backup;

  PROCEDURE Store*;
    VAR S: Texts.Scanner;
      Menu: TextFrames.Frame; G: KeySafeFrames.Frame;
      v: Viewers.Viewer;
  BEGIN
    IF Oberon.Par.frame = Oberon.Par.vwr.dsc THEN
      Menu := Oberon.Par.vwr.dsc(TextFrames.Frame); G := Menu.next(KeySafeFrames.Frame);
      Texts.OpenScanner(S, Menu.text, 0); Texts.Scan(S);
      IF S.class = Texts.Name THEN
        Texts.WriteString(W, S.s); Texts.WriteString(W, " storing");
        Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf);
        Backup(S.s); KeySafeFrames.Store(G, S.s)
      END
    ELSE
      Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
      IF S.class = Texts.Name THEN
        v := Oberon.MarkedViewer();
        IF (v.dsc # NIL) & (v.dsc.next IS KeySafeFrames.Frame) THEN
          G := v.dsc.next(KeySafeFrames.Frame);
          Texts.WriteString(W, S.s); Texts.WriteString(W, " storing");
          Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf);
          Backup(S.s); KeySafeFrames.Store(G, S.s)
        END
      END
    END
  END Store;
(*
  PROCEDURE Macro*;
    VAR S: Texts.Scanner;
      T: Texts.Text;
      time, beg, end: LONGINT;
      Lname: ARRAY 32 OF CHAR;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF S.class = Texts.Name THEN
      Lname := S.s; Texts.Scan(S);
      IF S.class = Texts.Name THEN GraphicFrames.Macro(Lname, S.s) END ;
    END
  END Macro;
*)
BEGIN Texts.OpenWriter(W); Texts.WriteString(W, "Attest - CP 1.3.2019");
  Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf)
END Attest.

```
```
## Variables:
```
 W: Texts.Writer;

```
## Procedures:
---

`  PROCEDURE Open*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L24)


`  PROCEDURE Delete*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L45)


`  PROCEDURE GetArg(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L54)


`  PROCEDURE SetWidth*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L63)


`  PROCEDURE ChangeColor*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L69)


`  PROCEDURE ChangeWidth*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L77)


`  PROCEDURE ChangeFont*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L85)


`  PROCEDURE Redraw(Q: BOOLEAN);` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L94)


`  PROCEDURE Ticks*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L105)


`  PROCEDURE Restore*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L109)


`  PROCEDURE Backup (VAR name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L113)


`  PROCEDURE Store*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L124)


`  PROCEDURE Macro*;` [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod#L151)

