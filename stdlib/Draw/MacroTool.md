
## [MODULE MacroTool](https://github.com/io-core/Draw/blob/main/MacroTool.Mod)

  ## Imports:
` Texts Oberon Graphics GraphicFrames`

```
```
  ## Variables:
```
 W: Texts.Writer;
    ## Variables:
```
 F: GraphicFrames.Frame; sel: Graphics.Object;
  BEGIN (*expand selected macro to caret position*)
    F := GraphicFrames.Selected();
    IF F # NIL THEN
      sel := F.graph.sel;
      IF (sel # NIL) & (sel IS Graphics.Macro) THEN
        GraphicFrames.Deselect(F);
        Graphics.OpenMac(sel(Graphics.Macro).mac, F.graph, F.mark.x - F.x, F.mark.y - F.y);
        GraphicFrames.Draw(F)
      END
    END
  END OpenMacro;
    ## Variables:
```
 newMac: BOOLEAN;
      machead: Graphics.MacHead;
      F: GraphicFrames.Frame;
      L: Graphics.Library;
      S: Texts.Scanner;
      Lname, Mname: ARRAY 32 OF CHAR;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF S.class = Texts.Name THEN
      Lname := S.s; Texts.Scan(S);
      IF (S.class  = Texts.Name) OR (S.class = Texts.String) & (S.len <= 8) THEN
        F := GraphicFrames.Focus(); Mname := S.s;
        IF (F # NIL) & (F.graph.sel # NIL) THEN
          Graphics.GetLib(Lname, FALSE, L);
          IF L = NIL THEN
            Texts.WriteString(W, "new library "); Texts.WriteString(W, Lname); Texts.WriteLn(W);
            L := Graphics.NewLib(Lname)
          END ;
          Graphics.MakeMac(F.graph, machead);
          IF machead # NIL THEN
            machead.name := Mname; Graphics.InsertMac(machead, L, newMac); Texts.WriteString(W, Mname);
            IF newMac THEN Texts.WriteString(W, " inserted in ") ELSE Texts.WriteString(W, " replaced in ") END ;
            Texts.WriteString(W, Lname)
          ELSE Texts.WriteString(W, " empty macro")
          END ;
          Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf)
        END
      END
    END
  END MakeMacro;
    ## Variables:
```
 S: Texts.Scanner; L: Graphics.Library;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF S.class = Texts.Name THEN
      Texts.WriteString(W, S.s); Graphics.GetLib(S.s, FALSE, L);
      IF L # NIL THEN Texts.WriteString(W, " loaded") ELSE Texts.WriteString(W, " not found") END ;
      Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf)
    END
  END LoadLibrary;
    ## Variables:
```
 i: INTEGER; S: Texts.Scanner; L: Graphics.Library;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    IF S.class = Texts.Name THEN
       Graphics.StoreLib(L, S.s); Texts.WriteString(W, S.s);
       IF L # NIL THEN Texts.WriteString(W, " stored") ELSE Texts.WriteString(W, " not found") END ;
      Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf)
    END
  END StoreLibrary;
```
## Procedures:
---

`  PROCEDURE OpenMacro*;` [(source)](https://github.com/io-core/Draw/blob/main/MacroTool.Mod#L5)


`  PROCEDURE MakeMacro*;  (*lib mac*)` [(source)](https://github.com/io-core/Draw/blob/main/MacroTool.Mod#L19)


`  PROCEDURE LoadLibrary*;  (*lib file name*)` [(source)](https://github.com/io-core/Draw/blob/main/MacroTool.Mod#L51)


`  PROCEDURE StoreLibrary*;  (*lib file name*)` [(source)](https://github.com/io-core/Draw/blob/main/MacroTool.Mod#L61)

