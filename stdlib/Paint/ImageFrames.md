
## [MODULE ImageFrames](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

  ## Imports:
` SYSTEM Display Viewers Input Fonts Texts Images Oberon MenuViewers`

## Constants:
```
 (*update message ids*)
    drawlayer = 1; drawlayers = 2; drawlayerd = 3;
    drawnorm = 4; drawsel = 5; drawdel = 6;

    markW = 5;

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
        image*: Images.Image;
        Xg*, Yg*: INTEGER;  (*pos rel to image origin*)
        X1*, Y1*: INTEGER;  (*right and upper margins*)
        x*, y*, col*: INTEGER;  (*x = X + Xg, y = Y + Yg*)
        marked*, ticked*: BOOLEAN;
        mark*: LocDesc
      END ;

    DrawMsg* = RECORD (Images.Msg)
        f*: Frame;
        x*, y*, col*, mode*: INTEGER
      END ;

    UpdateMsg = RECORD (Display.FrameMsg)
        id: INTEGER;
        image: Images.Image;
        layer: Images.Layer
      END ;

    ChangedMsg = RECORD (Display.FrameMsg)
        f: Frame;
        image: Images.Image;
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
        image: Images.Image
      END ;

```
## Variables:
```
 Crosshair*: Oberon.Marker;
    tack*, dotted*, dotted1*: INTEGER;  (*patterns*)
    (* newcap: Graphics.Caption; *)
    TBuf: Texts.Buffer;
    DW, DH, CL: INTEGER;
    W: Texts.Writer;

```
## Procedures:
---
## ---------- Oberon Message Handling

`  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L79)


`  PROCEDURE Restore*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L88)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L105)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L116)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L121)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L126)


`  PROCEDURE Mark(F: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L131)


`  PROCEDURE Draw*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L136)


`  PROCEDURE DrawNorm(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L141)


`  PROCEDURE Erase*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L146)


`  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L151)


`  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L156)


`  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L161)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L166)


`  PROCEDURE Defocus*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L172)


`  PROCEDURE Deselect*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L182)


`  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L191)


`  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L286)


`  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L294)


`  PROCEDURE DeleteChar(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L304)


`  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L325)


`  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L335)


`  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L395)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L401)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L410)


`  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L419)


`  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L441)


`  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L473)


`  PROCEDURE Open*(F: Frame; I: Images.Image);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L496)

