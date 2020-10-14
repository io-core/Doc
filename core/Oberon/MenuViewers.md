
## [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

Procedures:

[14](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#14) `  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);`
[22](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#22) `  PROCEDURE Restore (V: Viewer);`
[37](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#37) `  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);`
[59](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#59) `  PROCEDURE Suspend (V: Viewer);`
[66](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#66) `  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);`
[90](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#90) `  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);`
[105](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#105) `  PROCEDURE Expand (V: Viewers.Viewer);`
[111](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#111) `  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);`
[119](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#119) `  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);`
[160](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#160) `  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;`
