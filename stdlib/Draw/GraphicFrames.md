
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
## ---------- Oberon Message Handling

`  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L80)


`  PROCEDURE Restore*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L89)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L106)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L117)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L122)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L127)


`  PROCEDURE Mark(F: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L132)


`  PROCEDURE Draw*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L137)


`  PROCEDURE DrawNorm(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L142)


`  PROCEDURE Erase*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L147)


`  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L152)


`  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L157)


`  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L162)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L167)


`  PROCEDURE Defocus*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L173)


`  PROCEDURE Deselect*(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L183)


`  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L192)


`  PROCEDURE CaptionCopy(F: Frame;` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L215)


`  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L236)


`  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L243)


`  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L328)


`  PROCEDURE InsertChar(F: Frame; ch: CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L336)


`  PROCEDURE DeleteChar(F: Frame);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L346)


`  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L361)


`  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L371)


`  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L429)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L435)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L444)


`  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L453)


`  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L473)


`  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L502)


`  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); ` [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L522)

