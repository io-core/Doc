
## [MODULE Rectangles](https://github.com/io-core/Draw/blob/main/Rectangles.Mod)

Procedures:


[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L13) `  PROCEDURE New*;`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L18) `  PROCEDURE Copy(src, dst: Graphics.Object);`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L23) `  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L27) `  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L30) `    PROCEDURE draw(f: GraphicFrames.Frame; col, x, y, w, h, lw: INTEGER);`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L55) `  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L60) `  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L69) `  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L76) `  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);`

[(src)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L92) `  PROCEDURE Make*;  (*command*)`
