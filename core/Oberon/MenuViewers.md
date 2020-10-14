
#### [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

Procedures:

```
  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);
```
```
  PROCEDURE Restore (V: Viewer);
```
```
  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);
```
```
  PROCEDURE Suspend (V: Viewer);
```
```
  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);
```
```
  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);
```
```
  PROCEDURE Expand (V: Viewers.Viewer);
```
```
  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);
```
```
  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);
```
```
  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;
```
