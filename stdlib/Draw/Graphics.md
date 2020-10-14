
#### [MODULE Graphics](https://github.com/io-core/Draw/blob/main/Graphics.Mod)

Procedures:

```
  PROCEDURE New*(obj: Object);
```
```
  PROCEDURE Add*(G: Graph; obj: Object);
```
```
  PROCEDURE ThisObj*(G: Graph; x, y: INTEGER): Object;
```
```
  PROCEDURE SelectObj*(G: Graph; obj: Object);
```
```
  PROCEDURE SelectArea*(G: Graph; x0, y0, x1, y1: INTEGER);
```
```
  PROCEDURE Draw*(G: Graph; VAR M: Msg);
```
```
  PROCEDURE List*(G: Graph);
```
```
  PROCEDURE Deselect*(G: Graph);
```
```
  PROCEDURE DrawSel*(G: Graph; VAR M: Msg);
```
```
  PROCEDURE Change*(G: Graph; VAR M: Msg);
```
```
  PROCEDURE Move*(G: Graph; dx, dy: INTEGER);
```
```
  PROCEDURE Copy*(Gs, Gd: Graph; dx, dy: INTEGER);
```
```
  PROCEDURE Delete*(G: Graph);
```
```
  PROCEDURE WMsg(s0, s1: ARRAY OF CHAR);
```
```
  PROCEDURE InitContext(VAR C: Context);
```
```
  PROCEDURE FontNo*(VAR W: Files.Rider; VAR C: Context; fnt: Fonts.Font): INTEGER;
```
```
  PROCEDURE StoreElems(VAR W: Files.Rider; VAR C: Context; obj: Object);
```
```
  PROCEDURE Store*(G: Graph; VAR W: Files.Rider);
```
```
  PROCEDURE WriteObj*(VAR W: Files.Rider; cno: INTEGER; obj: Object);
```
```
  PROCEDURE WriteFile*(G: Graph; name: ARRAY OF CHAR);
```
```
  PROCEDURE Print*(G: Graph; x0, y0: INTEGER);
```
```
  PROCEDURE GetClass*(module, allocator: ARRAY OF CHAR; VAR com: Modules.Command);
```
```
  PROCEDURE Font*(VAR R: Files.Rider; VAR C: Context): Fonts.Font;
```
```
  PROCEDURE ReadObj(VAR R: Files.Rider; obj: Object);
```
```
  PROCEDURE LoadElems(VAR R: Files.Rider; VAR C: Context; VAR fobj: Object);
```
```
  PROCEDURE Load*(G: Graph; VAR R: Files.Rider);
```
```
  PROCEDURE Open*(G: Graph; name: ARRAY OF CHAR);
```
```
  PROCEDURE SetWidth*(w: INTEGER);
```
```
  PROCEDURE GetLib*(name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library);
```
```
  PROCEDURE NewLib*(Lname: ARRAY OF CHAR): Library;
```
```
  PROCEDURE StoreLib*(L: Library; Fname: ARRAY OF CHAR);
```
```
  PROCEDURE RemoveLibraries*;
```
```
  PROCEDURE ThisMac*(L: Library; Mname: ARRAY OF CHAR): MacHead;
```
```
  PROCEDURE DrawMac*(mh: MacHead; VAR M: Msg);
```
```
  PROCEDURE OpenMac*(mh: MacHead; G: Graph; x, y: INTEGER);
```
```
  PROCEDURE MakeMac*(G: Graph; VAR head: MacHead);
```
```
  PROCEDURE InsertMac*(mh: MacHead; L: Library; VAR new: BOOLEAN);
```
```
  PROCEDURE NewLine;
```
```
  PROCEDURE CopyLine(src, dst: Object);
```
```
  PROCEDURE ChangeLine(obj: Object; VAR M: Msg);
```
```
  PROCEDURE LineSelectable(obj: Object; x, y: INTEGER): BOOLEAN;
```
```
  PROCEDURE ReadLine(obj: Object; VAR R: Files.Rider; VAR C: Context);
```
```
  PROCEDURE WriteLine(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);
```
```
  PROCEDURE NewCaption;
```
```
  PROCEDURE CopyCaption(src, dst: Object);
```
```
  PROCEDURE ChangeCaption(obj: Object;  VAR M: Msg);
```
```
  PROCEDURE CaptionSelectable(obj: Object; x, y: INTEGER): BOOLEAN;
```
```
  PROCEDURE ReadCaption(obj: Object; VAR R: Files.Rider; VAR C: Context);
```
```
  PROCEDURE WriteCaption(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);
```
```
  PROCEDURE NewMacro;
```
```
  PROCEDURE CopyMacro(src, dst: Object);
```
```
  PROCEDURE ChangeMacro(obj: Object; VAR M: Msg);
```
```
  PROCEDURE MacroSelectable(obj: Object; x, y: INTEGER): BOOLEAN;
```
```
  PROCEDURE ReadMacro(obj: Object; VAR R: Files.Rider; VAR C: Context);
```
```
  PROCEDURE WriteMacro(obj: Object; cno: INTEGER; VAR W1: Files.Rider; VAR C: Context);
```
```
  PROCEDURE Notify(T: Texts.Text; op: INTEGER; beg, end: LONGINT);
```
```
  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (obj: Object; VAR msg: Msg));
```
