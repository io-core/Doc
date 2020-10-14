
## [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

Procedures:


<code>  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L14)


<code>  PROCEDURE Restore (V: Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L22)


<code>  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L37)


<code>  PROCEDURE Suspend (V: Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L59)


<code>  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L66)


<code>  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L90)


<code>  PROCEDURE Expand (V: Viewers.Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L105)


<code>  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L111)


<code>  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L119)


<code>  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;</code> [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L160)

