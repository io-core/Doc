
#### [MODULE Rectangles](https://github.com/io-core/Draw/blob/main/Rectangles.Mod)

Procedures:

```
  PROCEDURE New*;
```
```
  PROCEDURE Copy(src, dst: Graphics.Object);
```
```
  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);
```
```
  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);
```
```
    PROCEDURE draw(f: GraphicFrames.Frame; col, x, y, w, h, lw: INTEGER);
```
```
  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;
```
```
  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);
```
```
  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);
```
```
  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);
```
```
  PROCEDURE Make*;  (*command*)
```
