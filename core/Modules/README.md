## Modules
This package manages compiled module loading and unloading in Oberon.


The Modules package manages the module heap, the loading and unloading of packages, etc.


#### [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

Procedures:
```
  Load*(name: ARRAY OF CHAR; VAR newmod: Module)

  ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command

  Call*(name: ARRAY OF CHAR; VAR err: INTEGER)

  Select*(name: ARRAY OF CHAR; on, this, clients, imports: BOOLEAN)

  Deselect* (*all modules*)

  FindClients*(client: ClientHandler; VAR res: INTEGER)

  FindDynamicReferences*(typ, ptr, pvr: RefHandler; VAR resTyp, resPtr, resPvr: INTEGER; all: BOOLEAN)

  FindStaticReferences*(ptr, pvr: RefHandler; VAR resPtr, resPvr: INTEGER)

  Check*(VAR res: INTEGER)

  FreeSelection*(hide: BOOLEAN); (*unload or hide selected modules res is set by Check*)

  Free*(name: ARRAY OF CHAR; hide: BOOLEAN); (*unload or hide specified module res is set by Check*)

  Collect* (*no longer referenced hidden modules*)

  Init*

```
