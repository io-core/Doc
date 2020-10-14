
## [MODULE Rectangles](https://github.com/io-core/Draw/blob/main/Rectangles.Mod)

Procedures:


<pre>  PROCEDURE New*;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L13)


<pre>  PROCEDURE Copy(src, dst: Graphics.Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L18)


<pre>  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L23)


<pre>  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L27)


<pre>    PROCEDURE draw(f: GraphicFrames.Frame; col, x, y, w, h, lw: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L30)


<pre>  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L55)


<pre>  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L60)


<pre>  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L69)


<pre>  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L76)


<pre>  PROCEDURE Make*;  (*command*)</pre> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L92)

