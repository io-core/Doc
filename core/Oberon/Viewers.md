
## [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)

Procedures:


<pre>  PROCEDURE ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L42)


<pre>  PROCEDURE This* (X, Y: INTEGER): Viewer;  (*for backward compatibility*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L55)


<pre>  PROCEDURE ThisDisplay* (V: Viewer): DisplayArea;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L62)


<pre>  PROCEDURE Next* (V: Viewer): Viewer;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L68)


<pre>  PROCEDURE Prev* (V: Viewer): Viewer;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L74)


<pre>  PROCEDURE SetFocus* (D: DisplayArea; V: Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L78)


<pre>  PROCEDURE GetFocus* (D: DisplayArea): Viewer;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L83)


<pre>  PROCEDURE Adjust* (F: Display.Frame; id, Y, H: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L87)


<pre>  PROCEDURE Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L92)


<pre>  PROCEDURE Validate* (V: Viewer; VAR Y, H: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L115)


<pre>  PROCEDURE Change* (V: Viewer; Y, H: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L131)


<pre>  PROCEDURE Spread* (D: DisplayArea; X, W: INTEGER); (*redistribute viewers vertically*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L170)


<pre>  PROCEDURE RestoreTrack (S: Display.Frame);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L192)


<pre>  PROCEDURE Close* (V: Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L204)


<pre>  PROCEDURE Recall* (D: DisplayArea; VAR V: Viewer); (*last closed viewer*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L224)


<pre>  PROCEDURE Flush* (D: DisplayArea); (*last closed viewer*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L228)


<pre>  PROCEDURE Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L232)


<pre>  PROCEDURE Install* (parent, F: Display.Frame); (*frame F as a subframe into parent frame*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L255)


<pre>  PROCEDURE Remove* (parent, F: Display.Frame); (*subframe F from its parent frame*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L265)


<pre>  PROCEDURE InitFiller (X, Y, W, H, minH: INTEGER; Filler: Viewer); (*except fields handle, parent, dsc*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L275)


<pre>  PROCEDURE InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L280)


<pre>  PROCEDURE OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L292)


<pre>  PROCEDURE CloseTrack* (D: DisplayArea; X: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L313)


<pre>  PROCEDURE Broadcast* (VAR M: Display.FrameMsg); (*to current display*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L330)


<pre>  PROCEDURE InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L343)


<pre>  PROCEDURE SetDisplay* (D: DisplayArea);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L355)


<pre>  PROCEDURE GetDisplay* (id: INTEGER): DisplayArea;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L362)


<pre>  PROCEDURE CloseDisplay* (D: DisplayArea; hint: INTEGER); (*except last display*)</pre> [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L369)

