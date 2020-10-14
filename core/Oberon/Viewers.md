
## [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)

Procedures:


<code>  PROCEDURE ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L42)


<code>  PROCEDURE This* (X, Y: INTEGER): Viewer;  (*for backward compatibility*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L55)


<code>  PROCEDURE ThisDisplay* (V: Viewer): DisplayArea;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L62)


<code>  PROCEDURE Next* (V: Viewer): Viewer;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L68)


<code>  PROCEDURE Prev* (V: Viewer): Viewer;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L74)


<code>  PROCEDURE SetFocus* (D: DisplayArea; V: Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L78)


<code>  PROCEDURE GetFocus* (D: DisplayArea): Viewer;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L83)


<code>  PROCEDURE Adjust* (F: Display.Frame; id, Y, H: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L87)


<code>  PROCEDURE Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L92)


<code>  PROCEDURE Validate* (V: Viewer; VAR Y, H: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L115)


<code>  PROCEDURE Change* (V: Viewer; Y, H: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L131)


<code>  PROCEDURE Spread* (D: DisplayArea; X, W: INTEGER); (*redistribute viewers vertically*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L170)


<code>  PROCEDURE RestoreTrack (S: Display.Frame);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L192)


<code>  PROCEDURE Close* (V: Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L204)


<code>  PROCEDURE Recall* (D: DisplayArea; VAR V: Viewer); (*last closed viewer*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L224)


<code>  PROCEDURE Flush* (D: DisplayArea); (*last closed viewer*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L228)


<code>  PROCEDURE Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L232)


<code>  PROCEDURE Install* (parent, F: Display.Frame); (*frame F as a subframe into parent frame*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L255)


<code>  PROCEDURE Remove* (parent, F: Display.Frame); (*subframe F from its parent frame*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L265)


<code>  PROCEDURE InitFiller (X, Y, W, H, minH: INTEGER; Filler: Viewer); (*except fields handle, parent, dsc*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L275)


<code>  PROCEDURE InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L280)


<code>  PROCEDURE OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L292)


<code>  PROCEDURE CloseTrack* (D: DisplayArea; X: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L313)


<code>  PROCEDURE Broadcast* (VAR M: Display.FrameMsg); (*to current display*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L330)


<code>  PROCEDURE InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L343)


<code>  PROCEDURE SetDisplay* (D: DisplayArea);</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L355)


<code>  PROCEDURE GetDisplay* (id: INTEGER): DisplayArea;</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L362)


<code>  PROCEDURE CloseDisplay* (D: DisplayArea; hint: INTEGER); (*except last display*)</code> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L369)

