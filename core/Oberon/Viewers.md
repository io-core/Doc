
## [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)

Procedures:

```
  PROCEDURE ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer;
```
```
  PROCEDURE This* (X, Y: INTEGER): Viewer;  (*for backward compatibility*)
```
```
  PROCEDURE ThisDisplay* (V: Viewer): DisplayArea;
```
```
  PROCEDURE Next* (V: Viewer): Viewer;
```
```
  PROCEDURE Prev* (V: Viewer): Viewer;
```
```
  PROCEDURE SetFocus* (D: DisplayArea; V: Viewer);
```
```
  PROCEDURE GetFocus* (D: DisplayArea): Viewer;
```
```
  PROCEDURE Adjust* (F: Display.Frame; id, Y, H: INTEGER);
```
```
  PROCEDURE Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER);
```
```
  PROCEDURE Validate* (V: Viewer; VAR Y, H: INTEGER);
```
```
  PROCEDURE Change* (V: Viewer; Y, H: INTEGER);
```
```
  PROCEDURE Spread* (D: DisplayArea; X, W: INTEGER); (*redistribute viewers vertically*)
```
```
  PROCEDURE RestoreTrack (S: Display.Frame);
```
```
  PROCEDURE Close* (V: Viewer);
```
```
  PROCEDURE Recall* (D: DisplayArea; VAR V: Viewer); (*last closed viewer*)
```
```
  PROCEDURE Flush* (D: DisplayArea); (*last closed viewer*)
```
```
  PROCEDURE Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame);
```
```
  PROCEDURE Install* (parent, F: Display.Frame); (*frame F as a subframe into parent frame*)
```
```
  PROCEDURE Remove* (parent, F: Display.Frame); (*subframe F from its parent frame*)
```
```
  PROCEDURE InitFiller (X, Y, W, H, minH: INTEGER; Filler: Viewer); (*except fields handle, parent, dsc*)
```
```
  PROCEDURE InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer);
```
```
  PROCEDURE OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer);
```
```
  PROCEDURE CloseTrack* (D: DisplayArea; X: INTEGER);
```
```
  PROCEDURE Broadcast* (VAR M: Display.FrameMsg); (*to current display*)
```
```
  PROCEDURE InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR);
```
```
  PROCEDURE SetDisplay* (D: DisplayArea);
```
```
  PROCEDURE GetDisplay* (id: INTEGER): DisplayArea;
```
```
  PROCEDURE CloseDisplay* (D: DisplayArea; hint: INTEGER); (*except last display*)
```
