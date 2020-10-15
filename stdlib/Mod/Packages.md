
## [MODULE Packages](https://github.com/io-core/Mod/blob/main/Packages.Mod)

  ## Imports:
` SYSTEM Files Fonts Resources`

## Constants:
```
 
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

```
## Types:
```
 
    Method* = POINTER TO MethodDesc;
    Component* = POINTER TO ComponentDesc;
    ComponentDesc* = RECORD
      x*, y*, w*, h*, d*, p*: INTEGER;
      sx*, sy*: REAL;
      sw*, sh*: INTEGER;
      selected*, marked*: BOOLEAN;
      do*: Method;
      next: Component
    END;

    Package* = POINTER TO PackageDesc;
    Notifier* = PROCEDURE (P: Package; op: INTEGER; beg, end: LONGINT);
    PackageDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      flattened*: BOOLEAN;
      sel*, first: Component;
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
        copy*: PROCEDURE (from, to: Component);
```
        draw*, change*: PROCEDURE (C: Component; VAR msg: Msg);
        selectable*: PROCEDURE (C: Component; x, y: INTEGER): BOOLEAN;
        read*: PROCEDURE (C: Component; VAR r: Files.Rider); (*; VAR c: Context); *)
        write*: PROCEDURE (C: Component; cno: INTEGER; VAR r: Files.Rider); (*; VAR c: Context);*)
        print*: PROCEDURE (C: Component; x, y: INTEGER)
      END ;

```
## Procedures:
---

`  PROCEDURE New*(C: Component);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L76)


`  PROCEDURE Add*(P: Package; C: Component);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L80)


`  PROCEDURE ThisComponent*(P: Package; x, y: INTEGER): Component;` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L85)


`  PROCEDURE SelectComponent*(P: Package; C: Component);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L92)


`  PROCEDURE SelectArea*(P: Package; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L97)


`  PROCEDURE Draw*(P: Package; VAR m: Msg);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L111)


`  PROCEDURE List*(P: Package);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L118)


`  PROCEDURE Deselect*(P: Package);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L133)


`  PROCEDURE DrawSel*(P: Package; VAR m: Msg);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L139)


`  PROCEDURE Change*(P: Package; VAR m: Msg);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L148)


`  PROCEDURE WriteFile*(P: Package; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L159)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L167)


`  PROCEDURE Open*(P: Package; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L172)


`  PROCEDURE Delete*(P: Package);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L189)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg));` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L208)

