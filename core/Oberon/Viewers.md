
## [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)

  ## imports:
` Display`
## Procedures:
---

`  PROCEDURE ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L42)


`  PROCEDURE This* (X, Y: INTEGER): Viewer;  (*for backward compatibility*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L55)


`  PROCEDURE ThisDisplay* (V: Viewer): DisplayArea;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L62)


`  PROCEDURE Next* (V: Viewer): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L68)


`  PROCEDURE Prev* (V: Viewer): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L74)


`  PROCEDURE SetFocus* (D: DisplayArea; V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L78)


`  PROCEDURE GetFocus* (D: DisplayArea): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L83)


`  PROCEDURE Adjust* (F: Display.Frame; id, Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L87)


`  PROCEDURE Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L92)


`  PROCEDURE Validate* (V: Viewer; VAR Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L115)


`  PROCEDURE Change* (V: Viewer; Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L131)


`  PROCEDURE Spread* (D: DisplayArea; X, W: INTEGER); (*redistribute viewers vertically*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L170)


`  PROCEDURE RestoreTrack (S: Display.Frame);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L192)


`  PROCEDURE Close* (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L204)


`  PROCEDURE Recall* (D: DisplayArea; VAR V: Viewer); (*last closed viewer*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L224)


`  PROCEDURE Flush* (D: DisplayArea); (*last closed viewer*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L228)


`  PROCEDURE Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L232)


`  PROCEDURE Install* (parent, F: Display.Frame); (*frame F as a subframe into parent frame*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L255)


`  PROCEDURE Remove* (parent, F: Display.Frame); (*subframe F from its parent frame*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L265)


`  PROCEDURE InitFiller (X, Y, W, H, minH: INTEGER; Filler: Viewer); (*except fields handle, parent, dsc*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L275)


`  PROCEDURE InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L280)


`  PROCEDURE OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L292)


`  PROCEDURE CloseTrack* (D: DisplayArea; X: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L313)


`  PROCEDURE Broadcast* (VAR M: Display.FrameMsg); (*to current display*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L330)


`  PROCEDURE InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L343)


`  PROCEDURE SetDisplay* (D: DisplayArea);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L355)


`  PROCEDURE GetDisplay* (id: INTEGER): DisplayArea;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L362)


`  PROCEDURE CloseDisplay* (D: DisplayArea; hint: INTEGER); (*except last display*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L369)

