
## [MODULE OXTool](https://github.com/io-core/Build/blob/main/OXTool.Mod)

  ## Imports:
` SYSTEM Files Modules Kernel Fonts Texts Viewers MenuViewers TextFrames Oberon ORB`

## Constants:
```
 TAB = 09X;  (*copied from Input for use as cross development tool*)
  VAR W: Texts.Writer; T: Texts.Text; V: MenuViewers.Viewer; 
    mnemo0, mnemo1: ARRAY 16, 4 OF CHAR;  (*mnemonics*)

  PROCEDURE OpenViewer(T: Texts.Text; title: ARRAY OF CHAR);
    VAR X, Y: INTEGER; F: Fonts.Font;
  BEGIN
    Oberon.AllocateUserViewer(0, X, Y);
    V := MenuViewers.New(
        TextFrames.NewMenu(title, "System.Close  System.Copy  System.Grow  Edit.Search  Edit.Store"),
        TextFrames.NewText(T, 0), TextFrames.menuH, X, Y)
  END OpenViewer;

  PROCEDURE Clear*;  (*used to clear output*)
    VAR buf: Texts.Buffer;
  BEGIN NEW(buf); Texts.OpenBuf(buf); Texts.Delete(T, 0, T.len, buf)
  END Clear;
(*
  PROCEDURE Recall*;
    VAR M: Viewers.ViewerMsg;
  BEGIN
    IF (V # NIL) & (V.state = 0) THEN
      Viewers.Open(V, V.X, V.Y + V.H); M.id := Viewers.restore; V.handle(V, M)
    END
  END Recall;
*)
  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);
    VAR b: BYTE;
  BEGIN Files.ReadByte(R, b);
    IF b < 80H THEN x := b ELSE x := b - 100H END
  END Read;


  PROCEDURE classOut( class: INTEGER);
  BEGIN
      IF class = ORB.Head THEN Texts.WriteString(W, " HEAD ")
      ELSIF class = ORB.Const THEN Texts.WriteString(W, " CONST ")
      ELSIF class = ORB.Var THEN Texts.WriteString(W, " VAR ")
      ELSIF class = ORB.Par THEN Texts.WriteString(W, " PAR ")
      ELSIF class = ORB.Fld THEN Texts.WriteString(W, " FIELD ")
      ELSIF class = ORB.Typ THEN Texts.WriteString(W, " TYPE ")
      ELSIF class = ORB.SProc THEN Texts.WriteString(W, " SPROC ")
      ELSIF class = ORB.SFunc THEN Texts.WriteString(W, " SFUNC ")
      ELSIF class = ORB.Mod THEN Texts.WriteString(W, " MOD ")
      ELSE Texts.WriteString(W, "  class = "); Texts.WriteInt(W, class, 1);  END;
  END classOut;

  PROCEDURE formOut( form: INTEGER);
  BEGIN
      IF form = ORB.Byte THEN Texts.WriteString(W, " BYTE ")
      ELSIF form = ORB.Bool THEN Texts.WriteString(W, " BOOL ") 
      ELSIF form = ORB.Char THEN Texts.WriteString(W, " CHAR ") 
      ELSIF form = ORB.Int THEN Texts.WriteString(W, " CHAR ")       
      ELSIF form = ORB.Real THEN Texts.WriteString(W, " REAL ")       
      ELSIF form = ORB.Set THEN Texts.WriteString(W, " SET ")       
      ELSIF form = ORB.Pointer THEN Texts.WriteString(W, " POINTER ")       
      ELSIF form = ORB.Interface THEN Texts.WriteString(W, " INTERFACE ")       
      ELSIF form = ORB.NilTyp THEN Texts.WriteString(W, " NILTYPE ")       
      ELSIF form = ORB.NoTyp THEN Texts.WriteString(W, " NOTYPE ")       
      ELSIF form = ORB.Proc THEN Texts.WriteString(W, " PROC ")       
      ELSIF form = ORB.String THEN Texts.WriteString(W, " STRING ")       
      ELSIF form = ORB.Array THEN Texts.WriteString(W, " ARRAY ")       
      ELSIF form = ORB.Record THEN Texts.WriteString(W, " RECORD ")       
      ELSIF form = ORB.TProc THEN Texts.WriteString(W, " TPROC ")       
      ELSE Texts.WriteString(W, "  form = "); Texts.WriteInt(W, form, 1);  END;
  END formOut;

  PROCEDURE blktypOut( form: INTEGER);
  BEGIN
      IF form = 0 THEN Texts.WriteString(W, " record ")
      ELSIF form = 1 THEN Texts.WriteString(W, " array of record ")
      ELSIF form = 2 THEN Texts.WriteString(W, " array of pointer ")
      ELSIF form = 3 THEN Texts.WriteString(W, " array of basic type ")
      ELSIF form = 4 THEN Texts.WriteString(W, " ?? ")
      ELSIF form = 5 THEN Texts.WriteString(W, " ?? ")
      ELSIF form = 6 THEN Texts.WriteString(W, " ?? ")
      ELSE (*form = 7*)   Texts.WriteString(W, " array of procedure ")
      END;
  END blktypOut;


  PROCEDURE Indent( i: INTEGER );
    VAR c: INTEGER;
  BEGIN
    c:=i;
    Texts.WriteLn(W);
    WHILE c # 0 DO Texts.Write(W," "); DEC(c) END
  END Indent;

  PROCEDURE ReadType(VAR R: Files.Rider; indent: INTEGER);
    VAR key, len, size, off, i: INTEGER;
      ref, class, form, readonly: INTEGER;
      name, modname: ARRAY 32 OF CHAR;
  BEGIN Read(R, ref); Texts.Write(W, " "); i := indent + 2;
    IF ref < 0 THEN Texts.Write(W, "^"); Texts.WriteInt(W, -ref, 1)
    ELSE Texts.WriteInt(W, ref, 1);
      Read(R, form); formOut( form );
      IF form = ORB.Pointer THEN ReadType(R,i)
  (*    ELSIF form = ORB.Interface THEN ReadType(R,i) *)
      ELSIF form = ORB.Array THEN
        ReadType(R,i); Files.ReadNum(R, len); Files.ReadNum(R, size);
        Texts.WriteString(W, "  len = "); Texts.WriteInt(W, len, 1);
        Texts.WriteString(W, "  size = "); Texts.WriteInt(W, size, 1)
      ELSIF form IN {ORB.Record, ORB.Interface} THEN
        ReadType(R,i);  (*base type*)
        Files.ReadNum(R, off); Texts.WriteString(W, "  exno = "); Texts.WriteInt(W, off, 1);
        Files.ReadNum(R, off); Texts.WriteString(W, "  extlev = "); Texts.WriteInt(W, off, 1);
        Files.ReadNum(R, size); Texts.WriteString(W, "  size = "); Texts.WriteInt(W, size, 1);
        (*i:= i+3;*) Read(R, class);
        WHILE class # 0 DO  (*fields*)
          Files.ReadString(R, name);
          Indent(i);
          IF name[0] # 0X THEN Texts.Write(W, " "); Texts.WriteString(W, name); ReadType(R,i)
          ELSE Texts.WriteString(W, " --")
          END ;
          Files.ReadNum(R, off); Texts.WriteString(W, " o/m:"); Texts.WriteInt(W, off, 2); (*offset / mthno*)
          IF (class = ORB.Const) & (name[0] # 0X) THEN (*exported type-bound procedure*)
            Files.ReadNum(R, off); Texts.WriteString(W, " exno:"); Texts.WriteInt(W, off, 2) (*exno*)
          END ;
          Read(R, class)
        END ;
        i:= i - 2; Indent(i)
      ELSIF form IN {ORB.Proc, ORB.TProc} THEN
        ReadType(R,i); Texts.Write(W, "("); Read(R, class);
        WHILE class # 0 DO  (*parameters*)
          classOut(class); Read(R, readonly);
          IF readonly = 1 THEN Texts.Write(W, "#") END ;
          ReadType(R,i); Read(R, class)
        END ;
        Texts.Write(W, ")")
      ELSE
        Texts.WriteString(W, " ?? ");
      END ;
      Files.ReadString(R, modname);
      IF modname[0] # 0X THEN
        Files.ReadInt(R, key); Files.ReadString(R, name);
        Texts.Write(W, " "); Texts.WriteString(W, modname); Texts.Write(W, "."); Texts.WriteString(W, name);
        Texts.WriteHex(W, key)
      END
    END ;
  END ReadType;

  PROCEDURE DecSym*;  (*decode symbol file*)
    VAR class, k: INTEGER;
      name: ARRAY 32 OF CHAR;
      F: Files.File; R: Files.Rider;
      S: Texts.Scanner;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF S.class = Texts.Name THEN
      Texts.WriteString(W, "OR-decode "); Texts.WriteString(W, S.s);
      Texts.WriteLn(W); Texts.Append(T, W.buf);
      F := Files.Old(S.s);
      IF F # NIL THEN
        Files.Set(R, F, 0); Files.ReadInt(R, k); Files.ReadInt(R, k);
        Files.ReadString(R, name); Texts.WriteString(W, "Module:  "); Texts.WriteString(W, name); Texts.WriteLn(W); 
        Texts.WriteString(W, "   Key: "); Texts.WriteHex(W, k); Texts.WriteLn(W); 
        Read(R, class); Texts.WriteString(W, "  smbv:"); Texts.WriteInt(W, class, 3); Texts.WriteLn(W); 
        IF class = ORB.versionkey THEN
          Texts.WriteLn(W); Read(R, class);
          WHILE class # 0 DO
            Files.ReadString(R, name); Texts.WriteString(W, name); classOut(class);
            ReadType(R,0);
            IF class = ORB.Typ THEN
              
              Texts.WriteString(W, "  ("); Read(R, class);
              WHILE class # 0 DO  (*pointer base fixup*)
                Texts.WriteString(W, " ->"); classOut(class); (*Texts.WriteInt(W, class, 4); *) Read(R, class)
              END ;
              Texts.Write(W, ")")
            ELSIF (class = ORB.Const) OR (class = ORB.Var) THEN
              Files.ReadNum(R, k); Texts.WriteInt(W, k, 5);  (*Reals, Strings!*)
            END ;
            Texts.WriteLn(W); Texts.WriteLn(W); Texts.Append(T, W.buf);
            Read(R, class)
          END
        ELSE Texts.WriteString(W, " bad symfile version")
        END
      ELSE Texts.WriteString(W, " not found")
      END ;
      Texts.WriteLn(W); Texts.Append(T, W.buf)
    END
  END DecSym;

(* ---------------------------------------------------*)

  PROCEDURE WriteReg(r: LONGINT);
  BEGIN Texts.Write(W, " ");
    IF r < 13 THEN Texts.WriteString(W, " R"); Texts.WriteInt(W, r MOD 10H, 1)
    ELSIF r = 13 THEN Texts.WriteString(W, "TR")
    ELSIF r = 14 THEN Texts.WriteString(W, "SP")
    ELSE Texts.WriteString(W, "LNK")
    END
  END WriteReg;

  PROCEDURE opcode(w: LONGINT; fixP, fixD: BOOLEAN);
    VAR k, op, a, b, c: LONGINT; U, V: BOOLEAN;
  BEGIN
      k := w DIV 40000000H MOD 4;
      a := w DIV 1000000H MOD 10H;
      b := w DIV 100000H MOD 10H;
      op := w DIV 10000H MOD 10H;
      U := ODD(w DIV 20000000H);
      V := ODD(w DIV 10000000H);
      IF k = 0 THEN
        Texts.WriteString(W, mnemo0[op]);
        IF U THEN Texts.Write(W, "'") END ;
        WriteReg(a); WriteReg(b); WriteReg(w MOD 10H)
      ELSIF k = 1 THEN
        IF fixD THEN (*have only first 2 bits -> assume U = 0, V = 0, i.e. LDW*)
          Texts.WriteString(W, "MOV'");
          a := w DIV 4000000H MOD 10H; (*RH*)
          WriteReg(a);
          b := w DIV 100000H MOD 40H; (*mno*)
          Texts.WriteString(W, " mno "); Texts.WriteInt(W, b, 3)
        ELSE
          Texts.WriteString(W, mnemo0[op]);
          IF U THEN Texts.Write(W, "'") END ;
          WriteReg(a); WriteReg(b); w := w MOD 10000H;
          IF w >= 8000H THEN w := w - 10000H END ;
          Texts.WriteInt(W, w, 7)
        END
      ELSIF k = 2 THEN  (*LDR/STR*)
        IF U THEN Texts.WriteString(W, "ST") ELSE Texts.WriteString(W, "LD") END ;
        IF V THEN Texts.Write(W, "B") ELSE Texts.Write(W, "W") END ;
        WriteReg(a); WriteReg(b); w := w MOD 100000H;
        IF w >= 80000H THEN w := w - 100000H END ;
        Texts.WriteInt(W, w, 8)
      ELSIF k = 3 THEN  (*Branch instr*)
        Texts.Write(W, "B");
        IF V THEN Texts.Write(W, "L") END ;
        IF U THEN
          IF fixP THEN
            a := w DIV 4000H MOD 100H; (*pno*)
            b := w DIV 400000H MOD 40H; (*mno*)
            Texts.WriteString(W, " mno "); Texts.WriteInt(W, b, 3);
            Texts.WriteString(W, ", pno "); Texts.WriteInt(W, a, 3)
          ELSE Texts.WriteString(W, mnemo1[a]); w := w MOD 100000H;
            IF w >= 80000H THEN w := w - 100000H END ;
            Texts.WriteInt(W, w, 8)
          END
        ELSE Texts.WriteString(W, mnemo1[a]); WriteReg(w MOD 10H)
        END
      END
  END opcode;

  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);
  BEGIN Files.WriteByte(R, x)  (* -128 <= x < 128 *)
  END Write;

  PROCEDURE DecObj*;   (*decode object file*)
    VAR class, i, n, key, size, adr, data, code: INTEGER;
      ch: CHAR;
      name: ARRAY 32 OF CHAR;
      fixorgP, fixorgD, nofP, nofD: LONGINT;
      fixP, fixD: ARRAY 1000 OF LONGINT; (*fixup positions*)
      F: Files.File; R: Files.Rider;
      S: Texts.Scanner;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF S.class = Texts.Name THEN
      Texts.WriteString(W, "decode "); Texts.WriteString(W, S.s); F := Files.Old(S.s);
      IF F # NIL THEN
        Files.Set(R, F, 0); Files.ReadString(R, name); Texts.WriteLn(W); Texts.WriteString(W, name);
        Files.ReadInt(R, key); Texts.WriteHex(W, key); Read(R, class); Texts.WriteInt(W, class, 4); (*version*)
        Files.ReadInt(R, size); Texts.WriteInt(W, size, 6); Texts.WriteLn(W);
        Texts.WriteString(W, "imports:"); Texts.WriteLn(W); Files.ReadString(R, name);
        WHILE name[0] # 0X DO
          Texts.Write(W, TAB); Texts.WriteString(W, name);
          Files.ReadInt(R, key); Texts.WriteHex(W, key); Texts.WriteLn(W);
          Files.ReadString(R, name)
        END ;
        Texts.WriteString(W, "data"); Files.ReadInt(R, data); Texts.WriteInt(W, data, 6); Texts.WriteLn(W);
        Texts.WriteString(W, "strings"); Files.ReadInt(R, n); Texts.WriteInt(W, n, 6); Texts.WriteLn(W);
        i := 0;
        WHILE i < n DO Files.Read(R, ch); Texts.Write(W, ch); INC(i) END ;
        Texts.WriteLn(W);
        Texts.WriteString(W, "type descriptors"); Files.ReadInt(R, n); Texts.WriteInt(W, n, 6); Texts.WriteLn(W);
        n := n DIV 4; i := 0;
        WHILE i < n DO Files.ReadInt(R, data); Texts.WriteHex(W, data); Texts.WriteLn(W); INC(i) END ;
        Texts.WriteLn(W);
        (*first pass*)
        Files.ReadInt(R, n); code := Files.Pos(R); Files.Set(R, F, code + n*4); (*code*)
        Files.ReadString(R, name);
        WHILE name[0] # 0X DO Files.ReadInt(R, data); Files.ReadString(R, name) END ; (*commands*)
        Files.ReadInt(R, n); Files.Set(R, F, Files.Pos(R) + n*4); (*entries*)
        Files.ReadInt(R, data);
        WHILE data >= 0 DO Files.ReadInt(R, data) END ; (*pointer references*)
        Files.ReadInt(R, data);
        WHILE data >= 0 DO Files.ReadInt(R, data) END ; (*procedure variable references*)
        Files.ReadInt(R, fixorgP); Files.ReadInt(R, fixorgD);
        (*record fixup positions*)
        adr := code + fixorgP*4; nofP := 0;
        WHILE adr # code DO
          Files.Set(R, F, adr);
          Files.ReadInt(R, data); (*inst*)
          fixP[nofP] := (adr - code) DIV 4; INC(nofP);
          adr := adr - (data MOD 4000H)*4
        END ;
        adr := code + fixorgD*4; nofD := 0;
        WHILE adr # code DO
          Files.Set(R, F, adr);
          Files.ReadInt(R, data); (*inst*)
          fixD[nofD] := (adr - code) DIV 4; INC(nofD);
          adr := adr - (data MOD 10000H)*4
        END ;
        Files.Set(R, F, code-4);
        (*second pass*)
        Texts.WriteString(W, "code"); Texts.WriteLn(W);
        Files.ReadInt(R, n); i := 0; DEC(nofP); DEC(nofD);
        WHILE i < n DO
          Files.ReadInt(R, data); Texts.WriteInt(W, i, 4); Texts.Write(W, TAB); Texts.WriteHex(W, data);
          Texts.Write(W, TAB);
          IF (nofP >= 0) & (i = fixP[nofP]) THEN opcode(data, TRUE, FALSE); DEC(nofP)
          ELSIF (nofD >= 0) & (i = fixD[nofD]) THEN opcode(data, FALSE, TRUE); DEC(nofD)
          ELSE opcode(data, FALSE, FALSE)
          END ;
          Texts.WriteLn(W); INC(i)
        END ;
        Texts.WriteString(W, "commands:"); Texts.WriteLn(W);
        Files.ReadString(R, name);
        WHILE name[0] # 0X DO
          Texts.Write(W, TAB); Texts.WriteString(W, name);
          Files.ReadInt(R, adr); Texts.WriteInt(W, adr, 5); Texts.WriteLn(W);
          Files.ReadString(R, name)
        END ;
        Texts.WriteString(W, "entries"); Texts.WriteLn(W);
        Files.ReadInt(R, n); i := 0;
        WHILE i < n DO Files.ReadInt(R, adr); Texts.WriteInt(W, adr, 6); INC(i) END ;
        Texts.WriteLn(W);
        Texts.WriteString(W, "pointer refs"); Texts.WriteLn(W); Files.ReadInt(R, adr);
        WHILE adr # -1 DO Texts.WriteInt(W, adr, 6); Files.ReadInt(R, adr) END ;
        Texts.WriteLn(W);
        Texts.WriteString(W, "procedure variables"); Texts.WriteLn(W); Files.ReadInt(R, adr);
        WHILE adr # -1 DO Texts.WriteInt(W, adr, 6); Files.ReadInt(R, adr) END ;
        Texts.WriteLn(W);
        Files.ReadInt(R, data); Texts.WriteString(W, "fixP = "); Texts.WriteInt(W, data, 8); Texts.WriteLn(W);
        Files.ReadInt(R, data); Texts.WriteString(W, "fixD = "); Texts.WriteInt(W, data, 8); Texts.WriteLn(W);
        Files.ReadInt(R, data); Texts.WriteString(W, "fixT = "); Texts.WriteInt(W, data, 8); Texts.WriteLn(W);
        Files.ReadInt(R, data); Texts.WriteString(W, "fixM = "); Texts.WriteInt(W, data, 8); Texts.WriteLn(W);
        Files.ReadInt(R, data); Texts.WriteString(W, "entry = "); Texts.WriteInt(W, data, 8); Texts.WriteLn(W);
        Files.Read(R, ch);
        IF ch # "O" THEN Texts.WriteString(W, "format error"); Texts.WriteLn(W) END
      ELSE Texts.WriteString(W, " not found"); Texts.WriteLn(W)
      END ;
      Texts.Append(T, W.buf)
    END
  END DecObj;

  PROCEDURE DecMod*;
    VAR mod: Modules.Module;
      adr, data: INTEGER;
      S: Texts.Scanner;
      class, k: INTEGER;
      name: ARRAY 32 OF CHAR;
      F: Files.File; R: Files.Rider;
   BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
     IF S.class = Texts.Name THEN
       Texts.WriteString(W, "decode "); Texts.WriteString(W, S.s);
       mod := Modules.root;
       WHILE (mod # NIL) & (mod.name # S.s) DO mod := mod.next END ;
       IF mod # NIL THEN
         Texts.WriteLn(W); 
         Texts.WriteString(W, "data at "); Texts.WriteInt(W, mod.data, 6); Texts.WriteLn(W);
         Texts.WriteString(W, " tds at "); Texts.WriteInt(W, mod.tdx, 6); Texts.WriteLn(W);
         adr := mod.tdx;
         SYSTEM.GET(adr, data); 
         WHILE adr # mod.code DO
           Texts.Write(W, TAB); Texts.WriteInt(W, adr, 6); Texts.Write(W, TAB); Texts.WriteInt(W, data, 6);
           Texts.WriteLn(W); Texts.Append(T, W.buf); INC(adr,4); SYSTEM.GET(adr, data); 
         END;

         Texts.WriteString(W, "code at "); Texts.WriteInt(W, mod.code, 6); Texts.WriteLn(W);
         Texts.WriteString(W, " imp at "); Texts.WriteInt(W, mod.imp, 6); Texts.WriteLn(W);
         Texts.WriteString(W, " cmd at "); Texts.WriteInt(W, mod.cmd, 6); Texts.WriteLn(W);
         Texts.WriteString(W, " ent at "); Texts.WriteInt(W, mod.ent, 6); Texts.WriteLn(W);
         adr := mod.ent;
         SYSTEM.GET(adr, data); 
         WHILE adr # mod.ptr DO
           Texts.Write(W, TAB); Texts.WriteInt(W, adr, 6); Texts.Write(W, TAB); Texts.WriteInt(W, data, 6);
           Texts.WriteLn(W); Texts.Append(T, W.buf); INC(adr,4); SYSTEM.GET(adr, data); 
         END;

         Texts.WriteString(W, " ptr at "); Texts.WriteInt(W, mod.ptr, 6); Texts.WriteLn(W);
         adr := mod.ptr;
         SYSTEM.GET(adr, data); 
         WHILE data # 0 DO
           Texts.Write(W, TAB); Texts.WriteInt(W, adr, 6); Texts.Write(W, TAB); Texts.WriteInt(W, data, 6);
            SYSTEM.GET(data, data); Texts.Write(W, TAB); Texts.WriteInt(W, data, 6);
            IF data >= Kernel.heapOrg THEN SYSTEM.GET(data-8, data); blktypOut( data MOD 4 ); Texts.WriteInt(W, data, 6) END;
           Texts.WriteLn(W); Texts.Append(T, W.buf); INC(adr,4); SYSTEM.GET(adr, data); 
         END;

         adr := mod.code; 
         Texts.WriteString(W, "code"); Texts.WriteInt(W, (mod.imp - adr) DIV 4, 6); Texts.WriteLn(W);
         WHILE adr # mod.imp DO
           SYSTEM.GET(adr, data); Texts.WriteInt(W, adr, 4); Texts.Write(W, TAB); Texts.WriteHex(W, data);
           Texts.Write(W, TAB); opcode(data, FALSE, FALSE); Texts.WriteLn(W); INC(adr, 4)
         END ;
       ELSE Texts.WriteString(W, " not loaded"); Texts.WriteLn(W)
       END ;
       Texts.Append(T, W.buf)
     END
  END DecMod;

BEGIN Texts.OpenWriter(W); Texts.SetFont(W,Fonts.Load("Courier12.Scn.Fnt")); Texts.WriteString(W, "ORTool 18.2.2013 / AP 27.4.20 / CP 26.8.20"); T := TextFrames.Text(""); OpenViewer(T, "Tools.Text");
  Texts.WriteLn(W); Texts.Append(T, W.buf); 
  mnemo0[0] := "MOV";
  mnemo0[1] := "LSL";
  mnemo0[2] := "ASR";
  mnemo0[3] := "ROR";
  mnemo0[4] := "AND";
  mnemo0[5] := "ANN";
  mnemo0[6] := "IOR";
  mnemo0[7] := "XOR";
  mnemo0[8] := "ADD";
  mnemo0[9] := "SUB";
  mnemo0[10] := "MUL";
  mnemo0[11] := "DIV";
  mnemo0[12] := "FAD";
  mnemo0[13] := "FSB";
  mnemo0[14] := "FML";
  mnemo0[15] := "FDV";
  mnemo1[0] := "MI ";
  mnemo1[8] := "PL";
  mnemo1[1] := "EQ ";
  mnemo1[9] := "NE ";
  mnemo1[2] := "LS ";
  mnemo1[10] := "HI ";
  mnemo1[5] := "LT ";
  mnemo1[13] := "GE ";
  mnemo1[6] := "LE ";
  mnemo1[14] := "GT ";
  mnemo1[15] := "NO "
END OXTool.
```
```
## Variables:
```
 W: Texts.Writer; T: Texts.Text; V: MenuViewers.Viewer; 
    mnemo0, mnemo1: ARRAY 16, 4 OF CHAR;  (*mnemonics*)

```
## Procedures:
---

`  PROCEDURE OpenViewer(T: Texts.Text; title: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L7)


`  PROCEDURE Clear*;  (*used to clear output*)` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L16)


`  PROCEDURE Recall*;` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L21)


`  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L29)


`  PROCEDURE classOut( class: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L36)


`  PROCEDURE formOut( form: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L50)


`  PROCEDURE blktypOut( form: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L70)


`  PROCEDURE Indent( i: INTEGER );` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L84)


`  PROCEDURE ReadType(VAR R: Files.Rider; indent: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L92)


`  PROCEDURE DecSym*;  (*decode symbol file*)` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L145)


`  PROCEDURE WriteReg(r: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L188)


`  PROCEDURE opcode(w: LONGINT; fixP, fixD: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L197)


`  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L248)


`  PROCEDURE DecObj*;   (*decode object file*)` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L252)


`  PROCEDURE DecMod*;` [(source)](https://github.com/io-core/Build/blob/main/OXTool.Mod#L350)

