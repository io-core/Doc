
## [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)

Procedures:

[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L42) `  PROCEDURE ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer;`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L55) `  PROCEDURE This* (X, Y: INTEGER): Viewer;  (*for backward compatibility*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L62) `  PROCEDURE ThisDisplay* (V: Viewer): DisplayArea;`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L68) `  PROCEDURE Next* (V: Viewer): Viewer;`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L74) `  PROCEDURE Prev* (V: Viewer): Viewer;`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L78) `  PROCEDURE SetFocus* (D: DisplayArea; V: Viewer);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L83) `  PROCEDURE GetFocus* (D: DisplayArea): Viewer;`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L87) `  PROCEDURE Adjust* (F: Display.Frame; id, Y, H: INTEGER);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L92) `  PROCEDURE Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L115) `  PROCEDURE Validate* (V: Viewer; VAR Y, H: INTEGER);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L131) `  PROCEDURE Change* (V: Viewer; Y, H: INTEGER);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L170) `  PROCEDURE Spread* (D: DisplayArea; X, W: INTEGER); (*redistribute viewers vertically*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L192) `  PROCEDURE RestoreTrack (S: Display.Frame);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L204) `  PROCEDURE Close* (V: Viewer);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L224) `  PROCEDURE Recall* (D: DisplayArea; VAR V: Viewer); (*last closed viewer*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L228) `  PROCEDURE Flush* (D: DisplayArea); (*last closed viewer*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L232) `  PROCEDURE Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L255) `  PROCEDURE Install* (parent, F: Display.Frame); (*frame F as a subframe into parent frame*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L265) `  PROCEDURE Remove* (parent, F: Display.Frame); (*subframe F from its parent frame*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L275) `  PROCEDURE InitFiller (X, Y, W, H, minH: INTEGER; Filler: Viewer); (*except fields handle, parent, dsc*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L280) `  PROCEDURE InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L292) `  PROCEDURE OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L313) `  PROCEDURE CloseTrack* (D: DisplayArea; X: INTEGER);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L330) `  PROCEDURE Broadcast* (VAR M: Display.FrameMsg); (*to current display*)`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L343) `  PROCEDURE InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L355) `  PROCEDURE SetDisplay* (D: DisplayArea);`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L362) `  PROCEDURE GetDisplay* (id: INTEGER): DisplayArea;`
[(src)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L369) `  PROCEDURE CloseDisplay* (D: DisplayArea; hint: INTEGER); (*except last display*)`
