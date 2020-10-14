
## [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

Procedures:


[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L42) `  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L51) `  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L60) `  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L64) `  PROCEDURE check(s: ARRAY OF CHAR);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L75) `  PROCEDURE Load*(name: ARRAY OF CHAR; VAR newmod: Module);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L256) `  PROCEDURE ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command;`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L276) `  PROCEDURE Call*(name: ARRAY OF CHAR; VAR err: INTEGER);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L320) `  PROCEDURE select(mod: Module; clients, imports: BOOLEAN);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L340) `  PROCEDURE Select*(name: ARRAY OF CHAR; on, this, clients, imports: BOOLEAN);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L360) `  PROCEDURE Deselect*; (*all modules*)`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L368) `  PROCEDURE FindClients*(client: ClientHandler; VAR res: INTEGER);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L386) `  PROCEDURE FindDynamicReferences*(typ, ptr, pvr: RefHandler; VAR resTyp, resPtr, resPvr: INTEGER; all: BOOLEAN);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L398) `  PROCEDURE FindStaticReferences*(ptr, pvr: RefHandler; VAR resPtr, resPvr: INTEGER);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L420) `  PROCEDURE HandleClient(mod, imp: Module; VAR continue: BOOLEAN): INTEGER;`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L424) `  PROCEDURE HandleRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L434) `  PROCEDURE Check*(VAR res: INTEGER);`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L458) `  PROCEDURE Unload(mod: Module); (*module and selected imports from memory*)`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L474) `  PROCEDURE Hide(mod: Module); (*module from module list*)`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L483) `  PROCEDURE FreeSelection*(hide: BOOLEAN); (*unload or hide selected modules; res is set by Check*)`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L501) `  PROCEDURE Free*(name: ARRAY OF CHAR; hide: BOOLEAN); (*unload or hide specified module; res is set by Check*)`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L515) `  PROCEDURE Collect*; (*no longer referenced hidden modules*)`

[(src)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L575) `  PROCEDURE Init*;`
