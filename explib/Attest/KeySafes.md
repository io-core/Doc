
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

  ## Imports:
` SYSTEM Files Fonts KeyPairs`

  ## Constants:
```
 
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

```
  ## Types:
```
 
    Method* = POINTER TO MethodDesc;
    KeyRing* = POINTER TO KeyRingDesc;
    KeyRingDesc* = RECORD
      x*, y*, w*, h*, d*, p*: INTEGER;
      sx*, sy*: REAL;
      sw*, sh*: INTEGER;
      selected*, marked*: BOOLEAN;
      do*: Method;
      next: KeyRing
    END;

    KeySafe* = POINTER TO KeySafeDesc;
    Notifier* = PROCEDURE (S: KeySafe; op: INTEGER; beg, end: LONGINT);
    KeySafeDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      flattened*: BOOLEAN;
      sel*, first: KeyRing;
      notify*: Notifier
    END;

    Msg* = RECORD END ;
    WidMsg* = RECORD (Msg) w*: INTEGER END ;
    ColorMsg* = RECORD (Msg) col*: INTEGER END ;
    FontMsg* = RECORD (Msg) fnt*: Fonts.Font END ;
    

    bmpHeaderEntry = RECORD
        a: INTEGER;
        b: INTEGER;
        c: INTEGER;
        d: INTEGER
    END;

    jpgHeaderEntry = RECORD
        a: INTEGER;
        b: INTEGER;
        c: INTEGER;
        d: INTEGER
    END;

    pngHeaderEntry = RECORD
        a: INTEGER;
        b: INTEGER;
        c: INTEGER;
        d: INTEGER
    END;

    MethodDesc* = RECORD
(*        module*, allocator*: Name;
        new*: Modules.Command;             *)
        copy*: PROCEDURE (from, to: KeyRing);
```
        draw*, change*: PROCEDURE (R: KeyRing; ## Variables:
```
 msg: Msg);
        selectable*: PROCEDURE (R: KeyRing; x, y: INTEGER): BOOLEAN;
        read*: PROCEDURE (R: KeyRing; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context); *)
        read*: PROCEDURE (R: KeyRing; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context); *)
        write*: PROCEDURE (R: KeyRing; cno: INTEGER; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context);*)
        write*: PROCEDURE (R: KeyRing; cno: INTEGER; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context);*)
        print*: PROCEDURE (R: KeyRing; x, y: INTEGER)
      END ;
## Variables:
```
 
 
  res*: INTEGER;
  width: INTEGER;
  new*: KeyRing; 
  LineMethod*, CapMethod*, MacMethod* : Method;
    ## Variables:
```
 R: KeyRing;
  BEGIN R := S.first;
    WHILE (R # NIL) & ~R.do.selectable(R, x ,y) DO R := R.next END ;
    RETURN R
  END ThisKeyRing;
    ## Variables:
```
 R: KeyRing; t: INTEGER;
  BEGIN R := S.first;
    IF x1 < x0 THEN t := x0; x0 := x1; x1 := t END ;
    IF y1 < y0 THEN t := y0; y0 := y1; y1 := t END ;
    WHILE R # NIL DO
      IF (x0 <= R.x) & (R.x + R.w <= x1) & (y0 <= R.y) & (R.y + R.h <= y1) THEN
        R.selected := TRUE; S.sel := R
      END ;
      R := R.next
    END ;
    IF S.sel # NIL THEN  END
  END SelectArea;
  PROCEDURE Draw*(S: KeySafe; ## Variables:
```
 m: Msg);
    ## Variables:
```
 R: KeyRing;
    ## Variables:
```
 R: KeyRing;
  BEGIN R := S.first;
    WHILE R # NIL DO R.do.draw(R, m); R := R.next END
  END Draw;
    ## Variables:
```
 R: KeyRing; tag: INTEGER;
  BEGIN R := S.first;
    WHILE R # NIL DO
      Texts.Write(XW, 9X); Texts.WriteHex(XW, ORD(R)); Texts.Write(XW, 9X);
      Texts.WriteInt(XW, R.x, 5); Texts.WriteInt(XW, R.y, 5); Texts.WriteInt(XW, R.w, 5); Texts.WriteInt(XW, R.h, 5);
      Texts.Write(XW, "/"); SYSTEM.GET(ORD(R)-8, tag); Texts.WriteHex(XW, tag);
      SYSTEM.GET(ORD(R)-4, tag); Texts.WriteHex(XW, tag); Texts.WriteLn(XW); R := R.next
    END ;
    Texts.Append(Oberon.Log, XW.buf)
  END List;
*)
    ## Variables:
```
 R: KeyRing;
  BEGIN R := S.first; S.sel := NIL; 
    WHILE R # NIL DO R.selected := FALSE; R := R.next END
  END Deselect;
  PROCEDURE DrawSel*(S: KeySafe; ## Variables:
```
 m: Msg);
    ## Variables:
```
 R: KeyRing;
    ## Variables:
```
 R: KeyRing;
  BEGIN R := S.first;
    WHILE R # NIL DO
      IF R.selected THEN R.do.draw(R, m) END ;
      R := R.next
    END
  END DrawSel;
  PROCEDURE Change*(S: KeySafe; ## Variables:
```
 m: Msg);
    ## Variables:
```
 R: KeyRing;
    ## Variables:
```
 R: KeyRing;
  BEGIN R := S.first; S.changed := TRUE;
    WHILE R # NIL DO
      IF R.selected THEN R.do.change(R, m) END ;
      R := R.next
    END
  END Change;
    ## Variables:
```
 f: Files.File; w: Files.Rider; 
  BEGIN f := Files.New(name); Files.Set(w, f, 0); 
  (*  Files.Write(w, GraphFileId); InitContext(c); StoreElems(w, c, S.first);  *)
    Files.Register(f)
  END WriteFile;
    ## Variables:
```
 tag: CHAR;
          b: BYTE;
          i: INTEGER;
      f: Files.File; r: Files.Rider; 
  BEGIN S.first := NIL; S.sel := NIL; S.changed := FALSE; f := Files.Old(name);
    IF f # NIL THEN
      Files.Set(r, f, 0);
      Files.ReadByte(r, b); i:=b;
      Files.ReadByte(r, b); i:=i+(b*100H);
     
    ELSE res := 2
    END
  END Open;
    ## Variables:
```
 R, pred: KeyRing;
  BEGIN S.sel := NIL; S.changed := TRUE; R := S.first;
    WHILE (R # NIL) & R.selected DO R := R.next END ;
    S.first := R;
    IF R # NIL THEN
      pred := R; R := R.next;
      WHILE R # NIL DO
        IF R.selected THEN pred.next := R.next ELSE pred := R END ;
        R := R.next
      END
    END
  END Delete;
  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; ## Variables:
```
 msg: Msg));
  BEGIN LineMethod.draw := drawLine; CapMethod.draw := drawCaption; MacMethod.draw := drawMacro
  END InstallDrawMethods;
```
## Procedures:
---

`  PROCEDURE New*(R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L80)


`  PROCEDURE Add*(S: KeySafe; R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L84)


`  PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L89)


`  PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L96)


`  PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L101)


`  PROCEDURE Draw*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L115)


`  PROCEDURE List*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L122)


`  PROCEDURE Deselect*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L137)


`  PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L143)


`  PROCEDURE Change*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L152)


`  PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L163)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L171)


`  PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L176)


`  PROCEDURE Delete*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L193)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L212)

