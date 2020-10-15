
## [MODULE Rectangles](https://github.com/io-core/Draw/blob/main/Rectangles.Mod)

  ## Imports:
` SYSTEM Display Files Input Texts Oberon Graphics GraphicFrames`

```
  ## Types:
```

    Rectangle* = POINTER TO RectDesc;
    RectDesc* = RECORD (Graphics.ObjectDesc)
        lw*, vers*: INTEGER
      END ;

```
  ## Variables:
```
 method*: Graphics.Method;
    tack*, grey*: INTEGER;
    ## Variables:
```
 r: Rectangle;
  BEGIN NEW(r); r.do := method; Graphics.New(r)
  END New;
  PROCEDURE Draw(obj: Graphics.Object; ## Variables:
```
 M: Graphics.Msg);
    ## Variables:
```
 x, y, w, h, lw, col: INTEGER; f: GraphicFrames.Frame;
    ## Variables:
```
 x, y, w, h, lw, col: INTEGER; f: GraphicFrames.Frame;
  PROCEDURE Change(obj: Graphics.Object; ## Variables:
```
 M: Graphics.Msg);
    ## Variables:
```
 x0, y0, x1, y1, dx, dy: INTEGER; k: SET;
    ## Variables:
```
 x0, y0, x1, y1, dx, dy: INTEGER; k: SET;
  BEGIN
    CASE M OF
    Graphics.WidMsg: obj(Rectangle).lw := M.w |
    Graphics.ColorMsg: obj.col := M.col
    END
  END Change;
  PROCEDURE Read(obj: Graphics.Object; ## Variables:
```
 R: Files.Rider; ## Variables:
```
 C: Graphics.Context);
    ## Variables:
```
 b: BYTE; len: INTEGER;
    ## Variables:
```
 b: BYTE; len: INTEGER;
  BEGIN Files.ReadByte(R, b); (*len*);
    Files.ReadByte(R, b); obj(Rectangle).lw := b;
    Files.ReadByte(R, b); obj(Rectangle).vers := b;
  END Read;
  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; ## Variables:
```
 W: Files.Rider; ## Variables:
```
 C: Graphics.Context);
  BEGIN Graphics.WriteObj(W, cno, obj); Files.WriteByte(W, 2);
    Files.WriteByte(W, obj(Rectangle).lw); Files.WriteByte(W, obj(Rectangle).vers)
  END Write;
    ## Variables:
```
 w, h, lw, s: INTEGER;
  BEGIN INC(x, obj.x * 4); INC(y, obj.y * 4); w := obj.w * 4; h := obj.h * 4;
    lw := obj(Rectangle).lw * 2; s := obj(Rectangle).vers;
    Printer.ReplConst(x, y, w, lw);
    Printer.ReplConst(x+w-lw, y, lw, h);
    Printer.ReplConst(x, y+h-lw, w, lw);
    Printer.ReplConst(x, y, lw, h);
    IF s > 0 THEN Printer.ReplPattern(x, y, w, h, s) END
  END Print; *)
    ## Variables:
```
 x0, x1, y0, y1: INTEGER;
      R: Rectangle;
      G: GraphicFrames.Frame;
  BEGIN G := GraphicFrames.Focus();
    IF (G # NIL) & (G.mark.next # NIL) THEN
      GraphicFrames.Deselect(G);
      x0 := G.mark.x; y0 := G.mark.y; x1 := G.mark.next.x; y1 := G.mark.next.y;
      NEW(R); R.col := Oberon.CurCol;
      R.w := ABS(x1-x0); R.h := ABS(y1-y0);
      IF x1 < x0 THEN x0 := x1 END ;
      IF y1 < y0 THEN y0 := y1 END ;
      R.x := x0 - G.x; R.y := y0 - G.y;
      R.lw := Graphics.width; R.vers := 0; R.do := method;
      Graphics.Add(G.graph, R);
      GraphicFrames.Defocus(G); GraphicFrames.DrawObj(G, R)
    END
  END Make;
```
## Procedures:
---

`  PROCEDURE New*;` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L13)


`  PROCEDURE Copy(src, dst: Graphics.Object);` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L18)


`  PROCEDURE mark(f: GraphicFrames.Frame; col, x, y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L23)


`  PROCEDURE Draw(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L27)


`    PROCEDURE draw(f: GraphicFrames.Frame; col, x, y, w, h, lw: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L30)


`  PROCEDURE Selectable(obj: Graphics.Object; x, y: INTEGER): BOOLEAN;` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L55)


`  PROCEDURE Change(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L60)


`  PROCEDURE Read(obj: Graphics.Object; VAR R: Files.Rider; VAR C: Graphics.Context);` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L69)


`  PROCEDURE Write(obj: Graphics.Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Graphics.Context);` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L76)


`  PROCEDURE Make*;  (*command*)` [(source)](https://github.com/io-core/Draw/blob/main/Rectangles.Mod#L92)

