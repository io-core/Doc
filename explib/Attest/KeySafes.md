
## [MODULE KeySafes](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)

  ## Imports:
` SYSTEM Files Fonts KeyPairs`

  ## Constants:
```
 
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

```
  ## Types:
```
 
    Method* = POINTER TO MethodDesc;
    KeyRing* = POINTER TO KeyRingDesc;
    KeyRingDesc* = RECORD
      x*, y*, w*, h*, d*, p*: INTEGER;
      sx*, sy*: REAL;
      sw*, sh*: INTEGER;
      selected*, marked*: BOOLEAN;
      do*: Method;
      next: KeyRing
    END;

    KeySafe* = POINTER TO KeySafeDesc;
    Notifier* = PROCEDURE (S: KeySafe; op: INTEGER; beg, end: LONGINT);
    KeySafeDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      flattened*: BOOLEAN;
      sel*, first: KeyRing;
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
        copy*: PROCEDURE (from, to: KeyRing);
```
## Procedures:
---

`  PROCEDURE New*(R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L80)


`  PROCEDURE Add*(S: KeySafe; R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L84)


`  PROCEDURE ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing;` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L89)


`  PROCEDURE SelectKeyRing*(S: KeySafe; R: KeyRing);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L96)


`  PROCEDURE SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L101)


`  PROCEDURE Draw*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L115)


`  PROCEDURE List*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L122)


`  PROCEDURE Deselect*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L137)


`  PROCEDURE DrawSel*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L143)


`  PROCEDURE Change*(S: KeySafe; VAR m: Msg);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L152)


`  PROCEDURE WriteFile*(S: KeySafe; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L163)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L171)


`  PROCEDURE Open*(S: KeySafe; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L176)


`  PROCEDURE Delete*(S: KeySafe);` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L193)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg));` [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod#L212)

