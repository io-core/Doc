
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

  ## Imports:
` SYSTEM Files Fonts Ciphers`

  ## Constants:
```
 
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

```
  ## Types:
```
 
    Method* = POINTER TO MethodDesc;
    Document* = POINTER TO DocumentDesc;
    DocumentDesc* = RECORD
      x*, y*, w*, h*, d*, p*: INTEGER;
      sx*, sy*: REAL;
      sw*, sh*: INTEGER;
      selected*, marked*: BOOLEAN;
      do*: Method;
      next: Document
    END;

    Vault* = POINTER TO VaultDesc;
    Notifier* = PROCEDURE (V: Vault; op: INTEGER; beg, end: LONGINT);
    VaultDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      flattened*: BOOLEAN;
      sel*, first: Document;
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
        copy*: PROCEDURE (from, to: Document);
```
        draw*, change*: PROCEDURE (D: Document; ## Variables:
```
 msg: Msg);
        selectable*: PROCEDURE (D: Document; x, y: INTEGER): BOOLEAN;
        read*: PROCEDURE (D: Document; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context); *)
        read*: PROCEDURE (D: Document; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context); *)
        write*: PROCEDURE (D: Document; cno: INTEGER; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context);*)
        write*: PROCEDURE (D: Document; cno: INTEGER; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context);*)
        print*: PROCEDURE (D: Document; x, y: INTEGER)
      END ;
## Variables:
```
 
 
  res*: INTEGER;
  width: INTEGER;
  new*: Document; 
  LineMethod*, CapMethod*, MacMethod* : Method;
    ## Variables:
```
 D: Document;
  BEGIN D := V.first;
    WHILE (D # NIL) & ~D.do.selectable(D, x ,y) DO D := D.next END ;
    RETURN D
  END ThisDocument;
    ## Variables:
```
 D: Document; t: INTEGER;
  BEGIN D := V.first;
    IF x1 < x0 THEN t := x0; x0 := x1; x1 := t END ;
    IF y1 < y0 THEN t := y0; y0 := y1; y1 := t END ;
    WHILE D # NIL DO
      IF (x0 <= D.x) & (D.x + D.w <= x1) & (y0 <= D.y) & (D.y + D.h <= y1) THEN
        D.selected := TRUE; V.sel := D
      END ;
      D := D.next
    END ;
    IF V.sel # NIL THEN  END
  END SelectArea;
  PROCEDURE Draw*(V: Vault; ## Variables:
```
 m: Msg);
    ## Variables:
```
 D: Document;
    ## Variables:
```
 D: Document;
  BEGIN D := V.first;
    WHILE D # NIL DO D.do.draw(D, m); D := D.next END
  END Draw;
    ## Variables:
```
 D: Document; tag: INTEGER;
  BEGIN D := V.first;
    WHILE D # NIL DO
      Texts.Write(XW, 9X); Texts.WriteHex(XW, ORD(D)); Texts.Write(XW, 9X);
      Texts.WriteInt(XW, D.x, 5); Texts.WriteInt(XW, D.y, 5); Texts.WriteInt(XW, D.w, 5); Texts.WriteInt(XW, D.h, 5);
      Texts.Write(XW, "/"); SYSTEM.GET(ORD(D)-8, tag); Texts.WriteHex(XW, tag);
      SYSTEM.GET(ORD(D)-4, tag); Texts.WriteHex(XW, tag); Texts.WriteLn(XW); D := D.next
    END ;
    Texts.Append(Oberon.Log, XW.buf)
  END List;
*)
    ## Variables:
```
 D: Document;
  BEGIN D := V.first; V.sel := NIL; 
    WHILE D # NIL DO D.selected := FALSE; D := D.next END
  END Deselect;
  PROCEDURE DrawSel*(V: Vault; ## Variables:
```
 m: Msg);
    ## Variables:
```
 D: Document;
    ## Variables:
```
 D: Document;
  BEGIN D := V.first;
    WHILE D # NIL DO
      IF D.selected THEN D.do.draw(D, m) END ;
      D := D.next
    END
  END DrawSel;
  PROCEDURE Change*(V: Vault; ## Variables:
```
 m: Msg);
    ## Variables:
```
 D: Document;
    ## Variables:
```
 D: Document;
  BEGIN D := V.first; V.changed := TRUE;
    WHILE D # NIL DO
      IF D.selected THEN D.do.change(D, m) END ;
      D := D.next
    END
  END Change;
    ## Variables:
```
 f: Files.File; w: Files.Rider; 
  BEGIN f := Files.New(name); Files.Set(w, f, 0); 
  (*  Files.Write(w, GraphFileId); InitContext(c); StoreElems(w, c, V.first);  *)
    Files.Register(f)
  END WriteFile;
    ## Variables:
```
 tag: CHAR;
          b: BYTE;
          i: INTEGER;
      f: Files.File; r: Files.Rider; 
  BEGIN V.first := NIL; V.sel := NIL; V.changed := FALSE; f := Files.Old(name);
    IF f # NIL THEN
      Files.Set(r, f, 0);
      Files.ReadByte(r, b); i:=b;
      Files.ReadByte(r, b); i:=i+(b*100H);
     
    ELSE res := 2
    END
  END Open;
    ## Variables:
```
 D, pred: Document;
  BEGIN V.sel := NIL; V.changed := TRUE; D := V.first;
    WHILE (D # NIL) & D.selected DO D := D.next END ;
    V.first := D;
    IF D # NIL THEN
      pred := D; D := D.next;
      WHILE D # NIL DO
        IF D.selected THEN pred.next := D.next ELSE pred := D END ;
        D := D.next
      END
    END
  END Delete;
  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; ## Variables:
```
 msg: Msg));
  BEGIN LineMethod.draw := drawLine; CapMethod.draw := drawCaption; MacMethod.draw := drawMacro
  END InstallDrawMethods;
```
## Procedures:
---

`  PROCEDURE New*(D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L80)


`  PROCEDURE Add*(V: Vault; D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L84)


`  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L89)


`  PROCEDURE SelectDocument*(V: Vault; D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L96)


`  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L101)


`  PROCEDURE Draw*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L115)


`  PROCEDURE List*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L122)


`  PROCEDURE Deselect*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L137)


`  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L143)


`  PROCEDURE Change*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L152)


`  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L163)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L171)


`  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L176)


`  PROCEDURE Delete*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L193)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L212)

