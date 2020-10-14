
## [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

Procedures:


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L14) `  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L22) `  PROCEDURE Restore (V: Viewer);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L37) `  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L59) `  PROCEDURE Suspend (V: Viewer);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L66) `  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L90) `  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L105) `  PROCEDURE Expand (V: Viewers.Viewer);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L111) `  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L119) `  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);`


[(src)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L160) `  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;`

