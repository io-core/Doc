
## [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

Procedures:

[42](https://github.com/io-core/Modules/blob/main/Modules.Mod#42) `  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;`
[51](https://github.com/io-core/Modules/blob/main/Modules.Mod#51) `  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;`
[60](https://github.com/io-core/Modules/blob/main/Modules.Mod#60) `  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);`
[64](https://github.com/io-core/Modules/blob/main/Modules.Mod#64) `  PROCEDURE check(s: ARRAY OF CHAR);`
[75](https://github.com/io-core/Modules/blob/main/Modules.Mod#75) `  PROCEDURE Load*(name: ARRAY OF CHAR; VAR newmod: Module);`
[256](https://github.com/io-core/Modules/blob/main/Modules.Mod#256) `  PROCEDURE ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command;`
[276](https://github.com/io-core/Modules/blob/main/Modules.Mod#276) `  PROCEDURE Call*(name: ARRAY OF CHAR; VAR err: INTEGER);`
[320](https://github.com/io-core/Modules/blob/main/Modules.Mod#320) `  PROCEDURE select(mod: Module; clients, imports: BOOLEAN);`
[340](https://github.com/io-core/Modules/blob/main/Modules.Mod#340) `  PROCEDURE Select*(name: ARRAY OF CHAR; on, this, clients, imports: BOOLEAN);`
[360](https://github.com/io-core/Modules/blob/main/Modules.Mod#360) `  PROCEDURE Deselect*; (*all modules*)`
[368](https://github.com/io-core/Modules/blob/main/Modules.Mod#368) `  PROCEDURE FindClients*(client: ClientHandler; VAR res: INTEGER);`
[386](https://github.com/io-core/Modules/blob/main/Modules.Mod#386) `  PROCEDURE FindDynamicReferences*(typ, ptr, pvr: RefHandler; VAR resTyp, resPtr, resPvr: INTEGER; all: BOOLEAN);`
[398](https://github.com/io-core/Modules/blob/main/Modules.Mod#398) `  PROCEDURE FindStaticReferences*(ptr, pvr: RefHandler; VAR resPtr, resPvr: INTEGER);`
[420](https://github.com/io-core/Modules/blob/main/Modules.Mod#420) `  PROCEDURE HandleClient(mod, imp: Module; VAR continue: BOOLEAN): INTEGER;`
[424](https://github.com/io-core/Modules/blob/main/Modules.Mod#424) `  PROCEDURE HandleRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;`
[434](https://github.com/io-core/Modules/blob/main/Modules.Mod#434) `  PROCEDURE Check*(VAR res: INTEGER);`
[458](https://github.com/io-core/Modules/blob/main/Modules.Mod#458) `  PROCEDURE Unload(mod: Module); (*module and selected imports from memory*)`
[474](https://github.com/io-core/Modules/blob/main/Modules.Mod#474) `  PROCEDURE Hide(mod: Module); (*module from module list*)`
[483](https://github.com/io-core/Modules/blob/main/Modules.Mod#483) `  PROCEDURE FreeSelection*(hide: BOOLEAN); (*unload or hide selected modules; res is set by Check*)`
[501](https://github.com/io-core/Modules/blob/main/Modules.Mod#501) `  PROCEDURE Free*(name: ARRAY OF CHAR; hide: BOOLEAN); (*unload or hide specified module; res is set by Check*)`
[515](https://github.com/io-core/Modules/blob/main/Modules.Mod#515) `  PROCEDURE Collect*; (*no longer referenced hidden modules*)`
[575](https://github.com/io-core/Modules/blob/main/Modules.Mod#575) `  PROCEDURE Init*;`
