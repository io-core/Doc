
## [MODULE Curves](https://github.com/io-core/Draw/blob/main/Curves.Mod)

Procedures:

```
[15](https://github.com/io-core/Draw/blob/main/Curves.Mod#15)    PROCEDURE Dot(f: GraphicFrames.Frame; col, x, y: INTEGER);
```
```
[20](https://github.com/io-core/Draw/blob/main/Curves.Mod#20)    PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);
```
```
[29](https://github.com/io-core/Draw/blob/main/Curves.Mod#29)    PROCEDURE line(f: GraphicFrames.Frame; col: INTEGER; x, y, w, h, d: LONGINT);
```
```
[48](https://github.com/io-core/Draw/blob/main/Curves.Mod#48)    PROCEDURE circle(f: GraphicFrames.Frame; col: INTEGER; x0, y0, r: LONGINT);
```
```
[65](https://github.com/io-core/Draw/blob/main/Curves.Mod#65)    PROCEDURE ellipse(f: GraphicFrames.Frame; col: INTEGER; x0, y0, a, b: LONGINT);
```
```
[90](https://github.com/io-core/Draw/blob/main/Curves.Mod#90)    PROCEDURE New*;
```
```
[95](https://github.com/io-core/Draw/blob/main/Curves.Mod#95)    PROCEDURE Copy(src, dst: Graphics.Object);
```
```
[100](https://github.com/io-core/Draw/blob/main/Curves.Mod#100)    PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);
```
```
[146](https://github.com/io-core/Draw/blob/main/Curves.Mod#146)    PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;
```
```
[160](https://github.com/io-core/Draw/blob/main/Curves.Mod#160)    PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);
```
```
[165](https://github.com/io-core/Draw/blob/main/Curves.Mod#165)    PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);
```
```
[171](https://github.com/io-core/Draw/blob/main/Curves.Mod#171)    PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);
```
```
[176](https://github.com/io-core/Draw/blob/main/Curves.Mod#176)    PROCEDURE MakeLine*;  (*command*)
```
```
[197](https://github.com/io-core/Draw/blob/main/Curves.Mod#197)    PROCEDURE MakeCircle*;  (*command*)
```
```
[215](https://github.com/io-core/Draw/blob/main/Curves.Mod#215)    PROCEDURE MakeEllipse*;  (*command*)
```
