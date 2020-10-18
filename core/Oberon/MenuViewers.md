
## [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

  ## Imports:
` Input Display Viewers Oberon`

```
## Types:
```
 Viewer* = POINTER TO ViewerDesc;
    ViewerDesc* = RECORD (Viewers.ViewerDesc) menuH*: INTEGER END;

```
## Variables:
```


```
## Procedures:
---
## ---------- Oberon Message Handling

`  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L20)


`  PROCEDURE Restore (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L28)


`  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L43)


`  PROCEDURE Suspend (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L65)


`  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L72)


`  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L96)


`  PROCEDURE Expand (V: Viewers.Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L111)


`  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L117)


`  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L125)


`  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L166)

