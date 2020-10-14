## Draw
This package provides line-oriented drawing primitives and a vector drawing tool.



#### [MODULE GraphTool](https://github.com/io-core/doc/blob/main/stdlib/Draw/GraphTool.md) [(source)](https://github.com/io-core/Draw/blob/main/GraphTool.Mod)

Procedures:
```
  DecGraph*

  DecGraph1*

  DecLibrary1*

  ConvertLibrary*

```


#### [MODULE Rectangles](https://github.com/io-core/doc/blob/main/stdlib/Draw/Rectangles.md) [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod)

Procedures:
```
  New*

  Make*  (*command*)

```


#### [MODULE Curves](https://github.com/io-core/doc/blob/main/stdlib/Draw/Curves.md) [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod)

Procedures:
```
  New*

  MakeLine*  (*command*)

  MakeCircle*  (*command*)

  MakeEllipse*  (*command*)

```


#### [MODULE Graphics](https://github.com/io-core/doc/blob/main/stdlib/Draw/Graphics.md) [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod)

Procedures:
```
  New*(obj: Object)

  Add*(G: Graph; obj: Object)

  ThisObj*(G: Graph; x, y: INTEGER): Object

  SelectObj*(G: Graph; obj: Object)

  SelectArea*(G: Graph; x0, y0, x1, y1: INTEGER)

  Draw*(G: Graph; VAR M: Msg)

  List*(G: Graph)

  Deselect*(G: Graph)

  DrawSel*(G: Graph; VAR M: Msg)

  Change*(G: Graph; VAR M: Msg)

  Move*(G: Graph; dx, dy: INTEGER)

  Copy*(Gs, Gd: Graph; dx, dy: INTEGER)

  Delete*(G: Graph)

  FontNo*(VAR W: Files.Rider; VAR C: Context; fnt: Fonts.Font): INTEGER

  Store*(G: Graph; VAR W: Files.Rider)

  WriteObj*(VAR W: Files.Rider; cno: INTEGER; obj: Object)

  WriteFile*(G: Graph; name: ARRAY OF CHAR)

  Print*(G: Graph; x0, y0: INTEGER)

  GetClass*(module, allocator: ARRAY OF CHAR; VAR com: Modules.Command)

  Font*(VAR R: Files.Rider; VAR C: Context): Fonts.Font

  Load*(G: Graph; VAR R: Files.Rider)

  Open*(G: Graph; name: ARRAY OF CHAR)

  SetWidth*(w: INTEGER)

  GetLib*(name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library)

  NewLib*(Lname: ARRAY OF CHAR): Library

  StoreLib*(L: Library; Fname: ARRAY OF CHAR)

  RemoveLibraries*

  ThisMac*(L: Library; Mname: ARRAY OF CHAR): MacHead

  DrawMac*(mh: MacHead; VAR M: Msg)

  OpenMac*(mh: MacHead; G: Graph; x, y: INTEGER)

  MakeMac*(G: Graph; VAR head: MacHead)

  InsertMac*(mh: MacHead; L: Library; VAR new: BOOLEAN)

  InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (obj: Object; VAR msg: Msg))

```


#### [MODULE MacroTool](https://github.com/io-core/doc/blob/main/stdlib/Draw/MacroTool.md) [(source)](https://github.com/io-core/Draw/blob/main/MacroTool.Mod)

Procedures:
```
  OpenMacro*

  MakeMacro*  (*lib mac*)

  LoadLibrary*  (*lib file name*)

  StoreLibrary*  (*lib file name*)

```


#### [MODULE Draw](https://github.com/io-core/doc/blob/main/stdlib/Draw/Draw.md) [(source)](https://github.com/io-core/Draw/blob/main/Draw.Mod)

Procedures:
```
  Open*

  Delete*

  SetWidth*

  ChangeColor*

  ChangeWidth*

  ChangeFont*

  Ticks*

  Restore*

  Store*

  Macro*

```


#### [MODULE GraphicFrames](https://github.com/io-core/doc/blob/main/stdlib/Draw/GraphicFrames.md) [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

Procedures:
```
  Restore*(F: Frame)

  Focus*(): Frame

  Selected*(): Frame

  This*(x, y: INTEGER): Frame

  Draw*(F: Frame)

  Erase*(F: Frame)

  DrawObj*(F: Frame; obj: Graphics.Object)

  EraseObj*(F: Frame; obj: Graphics.Object)

  Change*(F: Frame; VAR msg: Graphics.Msg)

  Defocus*(F: Frame)

  Deselect*(F: Frame)

  Macro*(Lname, Mname: ARRAY OF CHAR)

  Handle*(G: Display.Frame; VAR M: Display.FrameMsg)

  Store*(F: Frame; name: ARRAY OF CHAR)

  ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER)

  ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER)

  Open*(G: Frame; graph: Graphics.Graph) 

```
