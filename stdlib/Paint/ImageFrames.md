
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

`  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L75)


`  PROCEDURE Restore*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L84)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L101)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L112)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L117)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L122)


`  PROCEDURE Mark(F: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L127)


`  PROCEDURE Draw*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L132)


`  PROCEDURE DrawNorm(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L137)


`  PROCEDURE Erase*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L142)


`  PROCEDURE DrawLayer*(F: Frame; L: Images.Layer);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L147)


`  PROCEDURE EraseLayer*(F: Frame; L: Images.Layer);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L152)


`  PROCEDURE Change*(F: Frame; VAR msg: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L157)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L162)


`  PROCEDURE Defocus*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L168)


`  PROCEDURE Deselect*(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L178)


`  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L187)


`  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L282)


`  PROCEDURE InsertChar(F: Frame; codepoint: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L290)


`  PROCEDURE DeleteChar(F: Frame);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L300)


`  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L321)


`  PROCEDURE Handle*(F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L331)


`  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L391)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L397)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L406)


`  PROCEDURE DrawLine(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L415)


`  PROCEDURE DrawCaption(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L437)


`  PROCEDURE DrawMacro(obj: Images.Layer; VAR M: Images.Msg);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L469)


`  PROCEDURE Open*(F: Frame; I: Images.Image);` [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod#L492)

