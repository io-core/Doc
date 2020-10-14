
## [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

Procedures:


<pre>  PROCEDURE ThisFile(name: ARRAY OF CHAR): Files.File;</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L42)


<pre>  PROCEDURE ThisSmb(name: ARRAY OF CHAR): Files.File;</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L51)


<pre>  PROCEDURE error(n: INTEGER; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L60)


<pre>  PROCEDURE check(s: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L64)


<pre>  PROCEDURE Load*(name: ARRAY OF CHAR; VAR newmod: Module);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L75)


<pre>  PROCEDURE ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command;</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L256)


<pre>  PROCEDURE Call*(name: ARRAY OF CHAR; VAR err: INTEGER);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L276)


<pre>  PROCEDURE select(mod: Module; clients, imports: BOOLEAN);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L320)


<pre>  PROCEDURE Select*(name: ARRAY OF CHAR; on, this, clients, imports: BOOLEAN);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L340)


<pre>  PROCEDURE Deselect*; (*all modules*)</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L360)


<pre>  PROCEDURE FindClients*(client: ClientHandler; VAR res: INTEGER);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L368)


<pre>  PROCEDURE FindDynamicReferences*(typ, ptr, pvr: RefHandler; VAR resTyp, resPtr, resPvr: INTEGER; all: BOOLEAN);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L386)


<pre>  PROCEDURE FindStaticReferences*(ptr, pvr: RefHandler; VAR resPtr, resPvr: INTEGER);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L398)


<pre>  PROCEDURE HandleClient(mod, imp: Module; VAR continue: BOOLEAN): INTEGER;</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L420)


<pre>  PROCEDURE HandleRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L424)


<pre>  PROCEDURE Check*(VAR res: INTEGER);</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L434)


<pre>  PROCEDURE Unload(mod: Module); (*module and selected imports from memory*)</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L458)


<pre>  PROCEDURE Hide(mod: Module); (*module from module list*)</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L474)


<pre>  PROCEDURE FreeSelection*(hide: BOOLEAN); (*unload or hide selected modules; res is set by Check*)</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L483)


<pre>  PROCEDURE Free*(name: ARRAY OF CHAR; hide: BOOLEAN); (*unload or hide specified module; res is set by Check*)</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L501)


<pre>  PROCEDURE Collect*; (*no longer referenced hidden modules*)</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L515)


<pre>  PROCEDURE Init*;</pre> [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod#L575)

