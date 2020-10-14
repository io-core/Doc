
## [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

Procedures:


<pre>  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L14)


<pre>  PROCEDURE Restore (V: Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L22)


<pre>  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L37)


<pre>  PROCEDURE Suspend (V: Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L59)


<pre>  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L66)


<pre>  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L90)


<pre>  PROCEDURE Expand (V: Viewers.Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L105)


<pre>  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L111)


<pre>  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L119)


<pre>  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;</pre> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L160)

