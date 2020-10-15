
## [MODULE Vaults](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)

  ## Imports:
` SYSTEM Files Fonts Ciphers`

  ## Constants:
```
 
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

```
  ## Types:
```
 
    Method* = POINTER TO MethodDesc;
    Document* = POINTER TO DocumentDesc;
    DocumentDesc* = RECORD
      x*, y*, w*, h*, d*, p*: INTEGER;
      sx*, sy*: REAL;
      sw*, sh*: INTEGER;
      selected*, marked*: BOOLEAN;
      do*: Method;
      next: Document
    END;

    Vault* = POINTER TO VaultDesc;
    Notifier* = PROCEDURE (V: Vault; op: INTEGER; beg, end: LONGINT);
    VaultDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      flattened*: BOOLEAN;
      sel*, first: Document;
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
        copy*: PROCEDURE (from, to: Document);
```
## Procedures:
---

`  PROCEDURE New*(D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L80)


`  PROCEDURE Add*(V: Vault; D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L84)


`  PROCEDURE ThisDocument*(V: Vault; x, y: INTEGER): Document;` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L89)


`  PROCEDURE SelectDocument*(V: Vault; D: Document);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L96)


`  PROCEDURE SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L101)


`  PROCEDURE Draw*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L115)


`  PROCEDURE List*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L122)


`  PROCEDURE Deselect*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L137)


`  PROCEDURE DrawSel*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L143)


`  PROCEDURE Change*(V: Vault; VAR m: Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L152)


`  PROCEDURE WriteFile*(V: Vault; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L163)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L171)


`  PROCEDURE Open*(V: Vault; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L176)


`  PROCEDURE Delete*(V: Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L193)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg));` [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod#L212)

