
## [MODULE Rectangles](https://github.com/io-core/Draw/blob/main/Rectangles.Mod)

Procedures:


<code>  PROCEDURE New*;</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L13)


<code>  PROCEDURE Copy(src, dst: Graphics.Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L18)


<code>  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L23)


<code>  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L27)


<code>    PROCEDURE draw(f: GraphicFrames.Frame; col, x, y, w, h, lw: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L30)


<code>  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L55)


<code>  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L60)


<code>  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L69)


<code>  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L76)


<code>  PROCEDURE Make*;  (*command*)</code> [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L92)

