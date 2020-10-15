
## [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

  ## imports:
` SYSTEM Kernel Files`
## Procedures:
---

`  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L42)


`  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L51)


`  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L60)


`  PROCEDURE check(s: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L64)


`  PROCEDURE Load*(name: ARRAY OF CHAR; VAR newmod: Module);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L75)


`  PROCEDURE ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command;` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L256)


`  PROCEDURE Call*(name: ARRAY OF CHAR; VAR err: INTEGER);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L276)


`  PROCEDURE select(mod: Module; clients, imports: BOOLEAN);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L320)


`  PROCEDURE Select*(name: ARRAY OF CHAR; on, this, clients, imports: BOOLEAN);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L340)


`  PROCEDURE Deselect*; (*all modules*)` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L360)


`  PROCEDURE FindClients*(client: ClientHandler; VAR res: INTEGER);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L368)


`  PROCEDURE FindDynamicReferences*(typ, ptr, pvr: RefHandler; VAR resTyp, resPtr, resPvr: INTEGER; all: BOOLEAN);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L386)


`  PROCEDURE FindStaticReferences*(ptr, pvr: RefHandler; VAR resPtr, resPvr: INTEGER);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L398)


`  PROCEDURE HandleClient(mod, imp: Module; VAR continue: BOOLEAN): INTEGER;` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L420)


`  PROCEDURE HandleRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L424)


`  PROCEDURE Check*(VAR res: INTEGER);` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L434)


`  PROCEDURE Unload(mod: Module); (*module and selected imports from memory*)` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L458)


`  PROCEDURE Hide(mod: Module); (*module from module list*)` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L474)


`  PROCEDURE FreeSelection*(hide: BOOLEAN); (*unload or hide selected modules; res is set by Check*)` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L483)


`  PROCEDURE Free*(name: ARRAY OF CHAR; hide: BOOLEAN); (*unload or hide specified module; res is set by Check*)` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L501)


`  PROCEDURE Collect*; (*no longer referenced hidden modules*)` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L515)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L575)

