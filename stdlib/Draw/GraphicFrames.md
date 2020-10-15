
## [MODULE GraphicFrames](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

  ## Imports:
` SYSTEM Display Viewers Input Fonts Texts Graphics Oberon`

  ## Constants:
```
 (*update message ids*)
    drawobj = 1; drawobjs = 2; drawobjd = 3;
    drawnorm = 4; drawsel = 5; drawdel = 6;

    markW = 5;

    CR = Input.CR;

```
  ## Types:
```

    Frame* = POINTER TO FrameDesc;
    Location* = POINTER TO LocDesc;

    LocDesc* = RECORD
        x*, y*: INTEGER;
        next*: Location
      END ;

    FrameDesc* = RECORD (Display.FrameDesc)
        graph*: Graphics.Graph;
        Xg*, Yg*: INTEGER;  (*pos rel to graph origin*)
        X1*, Y1*: INTEGER;  (*right and upper margins*)
        x*, y*, col*: INTEGER;  (*x = X + Xg, y = Y + Yg*)
        marked*, ticked*: BOOLEAN;
        mark*: LocDesc
      END ;

    DrawMsg* = RECORD (Graphics.Msg)
        f*: Frame;
        x*, y*, col*, mode*: INTEGER
      END ;

    UpdateMsg = RECORD (Display.FrameMsg)
        id: INTEGER;
        graph: Graphics.Graph;
        obj: Graphics.Object
      END ;

    ChangedMsg = RECORD (Display.FrameMsg)
        f: Frame;
        graph: Graphics.Graph;
        mode: INTEGER
      END ;

    SelQuery = RECORD (Display.FrameMsg)
        f: Frame; time: LONGINT
      END ;

    FocusQuery = RECORD (Display.FrameMsg)
        f: Frame
      END ;

    PosQuery = RECORD (Display.FrameMsg)
        f: Frame; x, y: INTEGER
      END ;

    DispMsg = RECORD (Display.FrameMsg)
        x1, y1, w: INTEGER;
        pat: INTEGER;
        graph: Graphics.Graph
      END ;

```
## Variables:
```
 Crosshair*: Oberon.Marker;
    tack*, dotted*, dotted1*: INTEGER;  (*patterns*)
    newcap: Graphics.Caption;
    TBuf: Texts.Buffer;
    DW, DH, CL: INTEGER;
    W: Texts.Writer;

```
## Procedures:
---

`  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L76)


`  PROCEDURE Restore*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L85)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L102)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L113)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L118)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L123)


`  PROCEDURE Mark(F: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L128)


`  PROCEDURE Draw*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L133)


`  PROCEDURE DrawNorm(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L138)


`  PROCEDURE Erase*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L143)


`  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L148)


`  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L153)


`  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L158)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L163)


`  PROCEDURE Defocus*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L169)


`  PROCEDURE Deselect*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L179)


`  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L188)


`  PROCEDURE CaptionCopy(F: Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L211)


`  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L232)


`  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L239)


`  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L324)


`  PROCEDURE InsertChar(F: Frame; ch: CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L332)


`  PROCEDURE DeleteChar(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L342)


`  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L357)


`  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L367)


`  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L425)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L431)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L440)


`  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L449)


`  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L469)


`  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L498)


`  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); ` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L518)

