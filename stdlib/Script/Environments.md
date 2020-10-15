
## [MODULE Environments](https://github.com/io-core/Script/blob/main/Environments.Mod)

  ## Imports:
` SYSTEM Files Intrinsics Texts`

  ## Constants:
```
 
    replace* = 0; insert* = 1; delete* = 2; unmark* = 3;  (*op-codes*)

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
```
        read*: PROCEDURE (b: Binding; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context); *)
        write*: PROCEDURE (b: Binding; cno: INTEGER; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context);*)
        write*: PROCEDURE (b: Binding; cno: INTEGER; ## Variables:
```
 r: Files.Rider); (*; ## Variables:
```
 c: Context);*)
        print*: PROCEDURE (b: Binding; x, y: INTEGER)
      END ;
## Variables:
```
 
 
  top*: Env;
  new*: Binding; 
  PROCEDURE Prepare*(## Variables:
```
 e: Env; ## Variables:
```
 T: Text);
    ## Variables:
```
 t: Text;
    ## Variables:
```
 t: Text;
  BEGIN   t := T
  END Prepare;
    ## Variables:
```
 f: Files.File; w: Files.Rider; 
  BEGIN f := Files.New(name); Files.Set(w, f, 0); 
  (*  Files.Write(w, GraphFileId); InitContext(c); StoreElems(w, c, e.first);  *)
    Files.Register(f)
  END Save;
    ## Variables:
```
 tag: CHAR;
          y: BYTE;
          i: INTEGER;
      f: Files.File; r: Files.Rider; 
  BEGIN e.first := NIL; e.sel := NIL; e.changed := FALSE; f := Files.Old(name);
    IF f # NIL THEN
      Files.Set(r, f, 0);
      Files.ReadByte(r, y); i:=y;
      Files.ReadByte(r, y); i:=i+(y*100H);
     
    ELSE 
    END
  END Resume;
    ## Variables:
```
 b, pred: Binding;
  BEGIN e.sel := NIL; e.changed := TRUE; b := e.first;
    WHILE (b # NIL) & b.selected DO b := b.next END ;
    e.first := b;
    IF b # NIL THEN
      pred := b; b := b.next;
      WHILE b # NIL DO
        IF b.selected THEN pred.next := b.next ELSE pred := b END ;
        b := b.next
      END
    END
  END Unset;
```
## Procedures:
---

`  PROCEDURE New*(b: Binding);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L49)


`  PROCEDURE Prepare*(VAR e: Env; VAR T: Text);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L54)


`  PROCEDURE Set*(e: Env; b: Binding);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L60)


`  PROCEDURE Save*(e: Env; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L66)


`  PROCEDURE Resume*(e: Env; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L74)


`  PROCEDURE Unset*(e: Env);` [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod#L90)

