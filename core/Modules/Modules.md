
#### [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

Procedures:

```
  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;
```
```
  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;
```
```
  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);
```
```
  PROCEDURE check(s: ARRAY OF CHAR);
```
```
  PROCEDURE Load*(name: ARRAY OF CHAR; VAR newmod: Module);
```
```
  PROCEDURE ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command;
```
```
  PROCEDURE Call*(name: ARRAY OF CHAR; VAR err: INTEGER);
```
```
  PROCEDURE select(mod: Module; clients, imports: BOOLEAN);
```
```
  PROCEDURE Select*(name: ARRAY OF CHAR; on, this, clients, imports: BOOLEAN);
```
```
  PROCEDURE Deselect*; (*all modules*)
```
```
  PROCEDURE FindClients*(client: ClientHandler; VAR res: INTEGER);
```
```
  PROCEDURE FindDynamicReferences*(typ, ptr, pvr: RefHandler; VAR resTyp, resPtr, resPvr: INTEGER; all: BOOLEAN);
```
```
  PROCEDURE FindStaticReferences*(ptr, pvr: RefHandler; VAR resPtr, resPvr: INTEGER);
```
```
  PROCEDURE HandleClient(mod, imp: Module; VAR continue: BOOLEAN): INTEGER;
```
```
  PROCEDURE HandleRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;
```
```
  PROCEDURE Check*(VAR res: INTEGER);
```
```
  PROCEDURE Unload(mod: Module); (*module and selected imports from memory*)
```
```
  PROCEDURE Hide(mod: Module); (*module from module list*)
```
```
  PROCEDURE FreeSelection*(hide: BOOLEAN); (*unload or hide selected modules; res is set by Check*)
```
```
  PROCEDURE Free*(name: ARRAY OF CHAR; hide: BOOLEAN); (*unload or hide specified module; res is set by Check*)
```
```
  PROCEDURE Collect*; (*no longer referenced hidden modules*)
```
```
  PROCEDURE Init*;
```
