
## [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

  ## Imports:
` Input Display Viewers Oberon`

```
## Types:
```
 Viewer* = POINTER TO ViewerDesc;
    ViewerDesc* = RECORD (Viewers.ViewerDesc) menuH*: INTEGER END;

  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);
  BEGIN
    Display.ReplConst(col, V.X, Y, 1, H, Display.replace);
    Display.ReplConst(col, V.X + V.W - 1, Y, 1, H, Display.replace);
    Display.ReplConst(col, V.X + 1, Y, V.W - 2, 1, Display.replace);
    Display.ReplConst(col, V.X + 1, Y + H - 1, V.W - 2, 1, Display.replace)
  END Draw;

  PROCEDURE Restore (V: Viewer);
```
## Variables:
```
 Menu, Main: Display.Frame;
  BEGIN Menu := V.dsc; Main := V.dsc.next;
    Oberon.RemoveMarks(V.X, V.Y, V.W, V.H); Draw(V, V.Y, V.H, Display.white);
    IF V.H > V.menuH + 1 THEN
      Main.X := V.X + 1; Main.Y := V.Y + 1; Main.W := V.W - 2; Main.H := V.H - V.menuH - 1;
      Menu.X := V.X + 1; Menu.Y := V.Y + V.H - V.menuH; Menu.W := V.W - 2; Menu.H := V.menuH - 1;
      Viewers.Adjust(Menu, Viewers.restore, Menu.Y, Menu.H);
      Viewers.Adjust(Main, Viewers.restore, Main.Y, Main.H)
    ELSE
      Menu.X := V.X + 1; Menu.Y := V.Y + 1; Menu.W := V.W - 2; Menu.H := V.H - 2;
      Viewers.Adjust(Menu, Viewers.restore, Menu.Y, Menu.H)
    END
  END Restore;

```
## Procedures:
---

`  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L14)


`  PROCEDURE Restore (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L22)


`  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L37)


`  PROCEDURE Suspend (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L59)


`  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L66)


`  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L90)


`  PROCEDURE Expand (V: Viewers.Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L105)


`  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L111)


`  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L119)


`  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L160)

