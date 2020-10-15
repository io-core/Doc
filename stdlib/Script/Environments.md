
## [MODULE Environments](https://github.com/io-core/Script/blob/main/Environments.Mod)

  ## Imports:
` SYSTEM Files Intrinsics Texts`

## Constants:
```
 
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

  TYPE 
```
## Types:
```
 
    Method* = POINTER TO MethodDesc;
    Binding* = POINTER TO BindingDesc;
    BindingDesc* = RECORD
      x*, y*, w*, h*, d*, p*: INTEGER;
      sx*, sy*: REAL;
      sw*, sh*: INTEGER;
      selected*, marked*: BOOLEAN;
      do*: Method;
      next: Binding
    END;

    Env* = POINTER TO EnvDesc;
    Notifier* = PROCEDURE (e: Env; op: INTEGER; beg, end: LONGINT);
    EnvDesc* = RECORD
      len*: LONGINT;
      changed*: BOOLEAN;
      flattened*: BOOLEAN;
      sel*, first: Binding;
      notify*: Notifier
    END;


    MethodDesc* = RECORD
        copy*: PROCEDURE (from, to: Binding);
        
        selectable*: PROCEDURE (b: Binding; x, y: INTEGER): BOOLEAN;
        read*: PROCEDURE (b: Binding; VAR r: Files.Rider); (*; VAR c: Context); *)
```
        read*: PROCEDURE (b: Binding; VAR r: Files.Rider); (*; VAR c: Context); *)
        write*: PROCEDURE (b: Binding; cno: INTEGER; VAR r: Files.Rider); (*; VAR c: Context);*)
        print*: PROCEDURE (b: Binding; x, y: INTEGER)
      END ;

```
## Procedures:
---

`  PROCEDURE New*(b: Binding);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L49)


`  PROCEDURE Prepare*(VAR e: Env; VAR T: Text);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L54)


`  PROCEDURE Set*(e: Env; b: Binding);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L60)


`  PROCEDURE Save*(e: Env; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L66)


`  PROCEDURE Resume*(e: Env; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L74)


`  PROCEDURE Unset*(e: Env);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L90)

