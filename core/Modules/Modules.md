
## [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

Procedures:


<code>  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L42)


<code>  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L51)


<code>  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L60)


<code>  PROCEDURE check(s: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L64)


<code>  PROCEDURE Load*(name: ARRAY OF CHAR; VAR newmod: Module);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L75)


<code>  PROCEDURE ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command;</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L256)


<code>  PROCEDURE Call*(name: ARRAY OF CHAR; VAR err: INTEGER);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L276)


<code>  PROCEDURE select(mod: Module; clients, imports: BOOLEAN);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L320)


<code>  PROCEDURE Select*(name: ARRAY OF CHAR; on, this, clients, imports: BOOLEAN);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L340)


<code>  PROCEDURE Deselect*; (*all modules*)</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L360)


<code>  PROCEDURE FindClients*(client: ClientHandler; VAR res: INTEGER);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L368)


<code>  PROCEDURE FindDynamicReferences*(typ, ptr, pvr: RefHandler; VAR resTyp, resPtr, resPvr: INTEGER; all: BOOLEAN);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L386)


<code>  PROCEDURE FindStaticReferences*(ptr, pvr: RefHandler; VAR resPtr, resPvr: INTEGER);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L398)


<code>  PROCEDURE HandleClient(mod, imp: Module; VAR continue: BOOLEAN): INTEGER;</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L420)


<code>  PROCEDURE HandleRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L424)


<code>  PROCEDURE Check*(VAR res: INTEGER);</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L434)


<code>  PROCEDURE Unload(mod: Module); (*module and selected imports from memory*)</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L458)


<code>  PROCEDURE Hide(mod: Module); (*module from module list*)</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L474)


<code>  PROCEDURE FreeSelection*(hide: BOOLEAN); (*unload or hide selected modules; res is set by Check*)</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L483)


<code>  PROCEDURE Free*(name: ARRAY OF CHAR; hide: BOOLEAN); (*unload or hide specified module; res is set by Check*)</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L501)


<code>  PROCEDURE Collect*; (*no longer referenced hidden modules*)</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L515)


<code>  PROCEDURE Init*;</code> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L575)

