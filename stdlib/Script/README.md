## Script
This package allows the user to batch commands and 'script' the Oberon environment


The Script package automates Oberon commands.


#### [MODULE Script](https://github.com/io-core/doc/blob/main/stdlib/Script/Script.md) [(source)](https://github.com/io-core/Script/blob/main/Script.Mod)
Module Script will implement LIL, a derivative of TCL.


Procedures:
```
  Load*

  Open*

  Run*

```


#### [MODULE Environments](https://github.com/io-core/doc/blob/main/stdlib/Script/Environments.md) [(source)](https://github.com/io-core/Script/blob/main/Environments.Mod)
Module Environments handles script execution context.


Procedures:
```
          read*:(b: Binding; VAR r: Files.Rider); (*; VAR c: Context) *)

          write*:(b: Binding; cno: INTEGER; VAR r: Files.Rider); (*; VAR c: Context)*)

  New*(b: Binding)

  Prepare*(VAR e: Env; VAR T: Text)

  Set*(e: Env; b: Binding)

  Save*(e: Env; name: ARRAY OF CHAR)

  Resume*(e: Env; name: ARRAY OF CHAR)

  Unset*(e: Env)

```


#### [MODULE Intrinsics](https://github.com/io-core/doc/blob/main/stdlib/Script/Intrinsics.md) [(source)](https://github.com/io-core/Script/blob/main/Intrinsics.Mod)
Module Intrinsics handles pseudo-commands and operations internal to the LIL interpreter.


Procedures:
```
  New*(i: Intrinsic; v: INTEGER) : Intrinsic

  Clear*(i: Intrinsic)

```
