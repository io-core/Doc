
## [MODULE Images](https://github.com/io-core/Paint/blob/main/Images.Mod)

  ## Imports:
` SYSTEM Files Fonts Bitmaps`

## Constants:
```
 BmpFileId = 04D42H;
        JpgFileId = 0D8FFH;
	PngFileId = 08950H;
        PctFileId = 0F003H;

    bmp* = 0; jpg* = 1; png* = 2; pct* = 3; (*filetypes*)
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

```
## Types:
```
 
    Method* = POINTER TO MethodDesc;
    Layer* = POINTER TO LayerDesc;
    LayerDesc* = RECORD
      x*, y*, w*, h*, d*, p*: INTEGER;
      sx*, sy*: REAL;
      sw*, sh*: INTEGER;
      selected*, marked*: BOOLEAN;
      do*: Method;
      next: Layer
    END;
(*
    Effect* = POINTER TO EffectDesc;
    EffectDesc* = RECORD
    END;

    Application* = POINTER TO ApplictionDesc;
    ApplicationDesc* = RECORD
      E: Effect;
      S1,S2: Layer
    END;

*)

    Image* = POINTER TO ImageDesc;
    Notifier* = PROCEDURE (I: Image; op: INTEGER; beg, end: LONGINT);
    ImageDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      flattened*: BOOLEAN;
      sel*, first: Layer;
      notify*: Notifier
    END;

    Msg* = RECORD END ;
    WidMsg* = RECORD (Msg) w*: INTEGER END ;
    ColorMsg* = RECORD (Msg) col*: INTEGER END ;
    FontMsg* = RECORD (Msg) fnt*: Fonts.Font END ;
    

    bmpHeaderEntry = RECORD
        a: INTEGER;
        b: INTEGER;
        c: INTEGER;
        d: INTEGER
    END;

    jpgHeaderEntry = RECORD
        a: INTEGER;
        b: INTEGER;
        c: INTEGER;
        d: INTEGER
    END;

    pngHeaderEntry = RECORD
        a: INTEGER;
        b: INTEGER;
        c: INTEGER;
        d: INTEGER
    END;

    MethodDesc* = RECORD
(*        module*, allocator*: Name;
        new*: Modules.Command;             *)
        copy*: PROCEDURE (from, to: Layer);
```
        draw*, change*: PROCEDURE (L: Layer; VAR msg: Msg);
        selectable*: PROCEDURE (L: Layer; x, y: INTEGER): BOOLEAN;
        read*: PROCEDURE (L: Layer; VAR R: Files.Rider); (*; VAR C: Context); *)
        write*: PROCEDURE (L: Layer; cno: INTEGER; VAR R: Files.Rider); (*; VAR C: Context);*)
        print*: PROCEDURE (L: Layer; x, y: INTEGER)
      END ;

```
## Procedures:
---

`  PROCEDURE New*(L: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L93)


`  PROCEDURE Add*(I: Image; L: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L97)


`  PROCEDURE ThisLayer*(I: Image; x, y: INTEGER): Layer;` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L102)


`  PROCEDURE SelectLayer*(I: Image; L: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L109)


`  PROCEDURE SelectArea*(I: Image; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L114)


`  PROCEDURE Draw*(I: Image; VAR M: Msg);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L128)


`  PROCEDURE List*(I: Image);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L135)


`  PROCEDURE Deselect*(I: Image);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L150)


`  PROCEDURE DrawSel*(I: Image; VAR M: Msg);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L156)


`  PROCEDURE Change*(I: Image; VAR M: Msg);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L165)


`  PROCEDURE WriteFile*(I: Image; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L176)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L184)


`  PROCEDURE LoadBmpLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L189)


`  PROCEDURE LoadJpgLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L195)


`  PROCEDURE LoadPngLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L201)


`  PROCEDURE LoadPctLayer(VAR R: Files.Rider; VAR flyr: Layer);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L207)


`  PROCEDURE Open*(I: Image; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L213)


`  PROCEDURE Delete*(I: Image);` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L238)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (L: Layer; VAR msg: Msg));` [(source)](https://github.com/io-core/Paint/blob/main/Images.Mod#L257)

