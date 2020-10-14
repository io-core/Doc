
## [MODULE Curves](https://github.com/io-core/Draw/blob/main/Curves.Mod)

Procedures:


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L15) `  PROCEDURE Dot(f: GraphicFrames.Frame; col, x, y: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L20) `  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L29) `  PROCEDURE line(f: GraphicFrames.Frame; col: INTEGER; x, y, w, h, d: LONGINT);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L48) `  PROCEDURE circle(f: GraphicFrames.Frame; col: INTEGER; x0, y0, r: LONGINT);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L65) `  PROCEDURE ellipse(f: GraphicFrames.Frame; col: INTEGER; x0, y0, a, b: LONGINT);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L90) `  PROCEDURE New*;`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L95) `  PROCEDURE Copy(src, dst: Graphics.Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L100) `  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L146) `  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L160) `  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L165) `  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L171) `  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L176) `  PROCEDURE MakeLine*;  (*command*)`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L197) `  PROCEDURE MakeCircle*;  (*command*)`


[(src)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L215) `  PROCEDURE MakeEllipse*;  (*command*)`

