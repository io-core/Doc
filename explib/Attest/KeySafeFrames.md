
## [MODULE KeySafeFrames](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod)

  ## Imports:
` SYSTEM Display Viewers Input Fonts Texts KeySafes Oberon MenuViewers`

  ## Constants:
```
 (*update message ids*)
    drawkeyring = 1; drawkeyrings = 2; drawkeyringd = 3;
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
        keysafe*: KeySafes.KeySafe;
        Xg*, Yg*: INTEGER;  (*pos rel to keysafe origin*)
        X1*, Y1*: INTEGER;  (*right and upper margins*)
        x*, y*, col*: INTEGER;  (*x = X + Xg, y = Y + Yg*)
        marked*, ticked*: BOOLEAN;
        mark*: LocDesc
      END ;

    DrawMsg* = RECORD (KeySafes.Msg)
        f*: Frame;
        x*, y*, col*, mode*: INTEGER
      END ;

    UpdateMsg = RECORD (Display.FrameMsg)
        id: INTEGER;
        keysafe: KeySafes.KeySafe;
        keyring: KeySafes.KeyRing
      END ;

    ChangedMsg = RECORD (Display.FrameMsg)
        f: Frame;
        keysafe: KeySafes.KeySafe;
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
        keysafe: KeySafes.KeySafe
      END ;

```
## Variables:
```
 Crosshair*: Oberon.Marker;
    tack*, dotted*, dotted1*: INTEGER;  (*patterns*)
    (* newcap: Graphics.Caption; *)
    TBuf: Texts.Buffer;
    DW, DH, CL: INTEGER;
    w: Texts.Writer;

```
## Procedures:
---

`  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L79)


`  PROCEDURE Restore*(f: Frame);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L88)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L105)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L116)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L121)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L126)


`  PROCEDURE Mark(f: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L131)


`  PROCEDURE Draw*(f: Frame);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L136)


`  PROCEDURE DrawNorm(f: Frame);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L141)


`  PROCEDURE Erase*(f: Frame);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L146)


`  PROCEDURE DrawKeyRing*(f: Frame; L: KeySafes.KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L151)


`  PROCEDURE EraseKeyRing*(f: Frame; R: KeySafes.KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L156)


`  PROCEDURE Change*(f: Frame; VAR msg: KeySafes.Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L161)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L166)


`  PROCEDURE Defocus*(f: Frame);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L172)


`  PROCEDURE Deselect*(f: Frame);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L182)


`  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L191)


`  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L286)


`  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L294)


`  PROCEDURE DeleteChar(f: Frame);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L304)


`  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L325)


`  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L335)


`  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L395)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L401)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L410)


`  PROCEDURE DrawLine(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L419)


`  PROCEDURE DrawCaption(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L441)


`  PROCEDURE DrawMacro(obj: KeySafes.KeyRing; VAR m: KeySafes.Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L473)


`  PROCEDURE Open*(f: Frame; S: KeySafes.KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod#L496)

