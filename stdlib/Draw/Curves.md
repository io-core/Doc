
## [MODULE Curves](https://github.com/io-core/Draw/blob/main/Curves.Mod)

Procedures:

```
  PROCEDURE Dot(f: GraphicFrames.Frame; col, x, y: INTEGER);
```
```
  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);
```
```
  PROCEDURE line(f: GraphicFrames.Frame; col: INTEGER; x, y, w, h, d: LONGINT);
```
```
  PROCEDURE circle(f: GraphicFrames.Frame; col: INTEGER; x0, y0, r: LONGINT);
```
```
  PROCEDURE ellipse(f: GraphicFrames.Frame; col: INTEGER; x0, y0, a, b: LONGINT);
```
```
  PROCEDURE New*;
```
```
  PROCEDURE Copy(src, dst: Graphics.Object);
```
```
  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);
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
  PROCEDURE MakeLine*;  (*command*)
```
```
  PROCEDURE MakeCircle*;  (*command*)
```
```
  PROCEDURE MakeEllipse*;  (*command*)
```
