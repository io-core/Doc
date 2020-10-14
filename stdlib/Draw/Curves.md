
## [MODULE Curves](https://github.com/io-core/Draw/blob/main/Curves.Mod)

Procedures:


<code>  PROCEDURE Dot(f: GraphicFrames.Frame; col, x, y: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L15)


<code>  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L20)


<code>  PROCEDURE line(f: GraphicFrames.Frame; col: INTEGER; x, y, w, h, d: LONGINT);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L29)


<code>  PROCEDURE circle(f: GraphicFrames.Frame; col: INTEGER; x0, y0, r: LONGINT);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L48)


<code>  PROCEDURE ellipse(f: GraphicFrames.Frame; col: INTEGER; x0, y0, a, b: LONGINT);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L65)


<code>  PROCEDURE New*;</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L90)


<code>  PROCEDURE Copy(src, dst: Graphics.Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L95)


<code>  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L100)


<code>  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L146)


<code>  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L160)


<code>  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L165)


<code>  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L171)


<code>  PROCEDURE MakeLine*;  (*command*)</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L176)


<code>  PROCEDURE MakeCircle*;  (*command*)</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L197)


<code>  PROCEDURE MakeEllipse*;  (*command*)</code> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L215)

