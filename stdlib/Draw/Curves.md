
## [MODULE Curves](https://github.com/io-core/Draw/blob/main/Curves.Mod)

Procedures:


<pre>  PROCEDURE Dot(f: GraphicFrames.Frame; col, x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L15)


<pre>  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L20)


<pre>  PROCEDURE line(f: GraphicFrames.Frame; col: INTEGER; x, y, w, h, d: LONGINT);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L29)


<pre>  PROCEDURE circle(f: GraphicFrames.Frame; col: INTEGER; x0, y0, r: LONGINT);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L48)


<pre>  PROCEDURE ellipse(f: GraphicFrames.Frame; col: INTEGER; x0, y0, a, b: LONGINT);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L65)


<pre>  PROCEDURE New*;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L90)


<pre>  PROCEDURE Copy(src, dst: Graphics.Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L95)


<pre>  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L100)


<pre>  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L146)


<pre>  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L160)


<pre>  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L165)


<pre>  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L171)


<pre>  PROCEDURE MakeLine*;  (*command*)</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L176)


<pre>  PROCEDURE MakeCircle*;  (*command*)</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L197)


<pre>  PROCEDURE MakeEllipse*;  (*command*)</pre> [(source)](https://github.com/io-core/Draw/blob/main/Curves.Mod#L215)

