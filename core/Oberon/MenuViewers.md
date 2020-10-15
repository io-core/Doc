
## [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)

  **imports** Input Display Viewers Oberon
## Procedures
---

`  PROCEDURE Draw (V: Viewer; Y, H, col: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L14)


`  PROCEDURE Restore (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L22)


`  PROCEDURE Modify (V: Viewer; Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L37)


`  PROCEDURE Suspend (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L59)


`  PROCEDURE Move (V: Viewer; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L66)


`  PROCEDURE Change (V: Viewer; X, Y: INTEGER; Keys: SET);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L90)


`  PROCEDURE Expand (V: Viewers.Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L105)


`  PROCEDURE Copy (V: Viewer; VAR V1: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L111)


`  PROCEDURE Handle* (V: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L119)


`  PROCEDURE New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod#L160)

