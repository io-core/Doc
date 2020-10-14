
## [MODULE Rectangles](https://github.com/io-core/Draw/blob/main/Rectangles.Mod)

Procedures:

[13](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#13) `  PROCEDURE New*;`
[18](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#18) `  PROCEDURE Copy(src, dst: Graphics.Object);`
[23](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#23) `  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);`
[27](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#27) `  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);`
[30](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#30) `    PROCEDURE draw(f: GraphicFrames.Frame; col, x, y, w, h, lw: INTEGER);`
[55](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#55) `  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;`
[60](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#60) `  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);`
[69](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#69) `  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);`
[76](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#76) `  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);`
[92](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#92) `  PROCEDURE Make*;  (*command*)`
