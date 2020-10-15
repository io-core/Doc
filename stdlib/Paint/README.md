## Paint
This package provides tools for viewing and manipulating bitmap images.



#### [MODULE Images](https://github.com/io-core/doc/blob/main/stdlib/Paint/Images.md) [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod)

  **imports:** ` SYSTEM Files Fonts Bitmaps`

**Procedures:**
```
          read*:(L: Layer; VAR R: Files.Rider); (*; VAR C: Context) *)

          write*:(L: Layer; cno: INTEGER; VAR R: Files.Rider); (*; VAR C: Context)*)

  New*(L: Layer)

  Add*(I: Image; L: Layer)

  ThisLayer*(I: Image; x, y: INTEGER): Layer

  SelectLayer*(I: Image; L: Layer)

  SelectArea*(I: Image; x0, y0, x1, y1: INTEGER)

  Draw*(I: Image; VAR M: Msg)

  List*(I: Image)

  Deselect*(I: Image)

  DrawSel*(I: Image; VAR M: Msg)

  Change*(I: Image; VAR M: Msg)

  WriteFile*(I: Image; name: ARRAY OF CHAR)

  SetWidth*(w: INTEGER)

  Open*(I: Image; name: ARRAY OF CHAR)

  Delete*(I: Image)

  InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg))

```


#### [MODULE Paint](https://github.com/io-core/doc/blob/main/stdlib/Paint/Paint.md) [(source)](https://github.com/io-core/Paint/blob/main/Paint.Mod)

  **imports:** ` Files Fonts Viewers Texts Oberon
**Procedures:**
```
  Open*

  Delete*

  SetWidth*

  ChangeColor*

  ChangeWidth*

  ChangeFont*

  Ticks*

  Restore*

  Store*

  Macro*

```


#### [MODULE Bitmaps](https://github.com/io-core/doc/blob/main/stdlib/Paint/Bitmaps.md) [(source)](https://github.com/io-core/Paint/blob/main/Bitmaps.Mod)

**imports:** ` SYSTEM Kernel Oberon`

**Procedures:**
```
  New*(B: Bitmap; w, h, dpt: INTEGER) : Bitmap

  Get*(B: Bitmap; x, y: INTEGER): INTEGER

  Clear*(B: Bitmap)

  Dot*(B: Bitmap; col, x, y, mode: INTEGER)

  CopyBlock*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER)

  CopyPattern*(B: Bitmap; col, pat, x, y, mode: INTEGER)

  ReplPattern*(B: Bitmap; col, pat, X, Y, W, H, mode: INTEGER)

  ReplConst*(B: Bitmap; col, x, y, w, h, mode: INTEGER)

  DisplayBlock*(B: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER)

  GetPix*(VAR a: INTEGER; VAR bt: BYTE; depth: INTEGER)

  (*PutPix*(a: INTEGER; VAR x: INTEGER; bt: BYTE; depth: INTEGER)

  PutPix*(VAR a, x: INTEGER; bt: BYTE; depth: INTEGER)

  Copy*(sB, dB: Bitmap; sx, sy, w, h, dx, dy, mode: INTEGER)

  PutLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER)

  GetLine*(B: Bitmap; VAR data: ARRAY OF INTEGER; x, y, w: INTEGER)

```


#### [MODULE ImageFrames](https://github.com/io-core/doc/blob/main/stdlib/Paint/ImageFrames.md) [(source)](https://github.com/io-core/Paint/blob/main/ImageFrames.Mod)

  **imports:** ` SYSTEM Display Viewers Input Fonts Texts Images Oberon MenuViewers`

**Procedures:**
```
  Restore*(F: Frame)

  Focus*(): Frame

  Selected*(): Frame

  This*(x, y: INTEGER): Frame

  Draw*(F: Frame)

  Erase*(F: Frame)

  DrawLayer*(F: Frame; L: Images.Layer)

  EraseLayer*(F: Frame; L: Images.Layer)

  Change*(F: Frame; VAR msg: Images.Msg)

  Defocus*(F: Frame)

  Deselect*(F: Frame)

  Handle*(F: Display.Frame; VAR M: Display.FrameMsg)

  Store*(F: Frame; name: ARRAY OF CHAR)

  ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER)

  ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER)

  Open*(F: Frame; I: Images.Image)

```
