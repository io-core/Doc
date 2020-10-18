
## [MODULE Modules](https://github.com/io-core/Modules/blob/main/Modules.Mod)

  ## Imports:
` SYSTEM Kernel Files`

## Constants:
```
 versionkey = 1X; TR = 13; DescSize = 96; MnLength = 32;
    noerr* = 0; nofile* = 1; badversion* = 2; badkey* = 3; badfile* = 4; nospace* = 5; nocmd* = 6; badcmd* = 7; nomod* = 8;
    noref* = 0; clients* = 9; dyntypes* = 10; dynptrs* = 11; dynpvrs* = 12; statptrs* = 13; statpvrs* = 14;
    U = 20000000H; V = 10000000H; B = 100000H;  (*modifier bits*)
    MOV = 40000000H; IOR = 40060000H;  (*F1 register instructions*)
    F2 = -2;  (*F2 memory instruction*)
    F3 = -1; BCT = 0E7000000H; BLT = 0F7000000H;  (*F3 branch instructions*)
    C4 = 10H; C6 = 40H; C8 = 100H; C10 = 400H; C12 = 1000H; C14 = 4000H; C16 = 10000H; C18 = 40000H;
    C20 = 100000H; C22 = 400000H; C24 = 1000000H; C26 = 4000000H; C28 = 10000000H; C30 = 40000000H;

```
## Types:
```
 Module* = POINTER TO ModDesc;
    Command* = PROCEDURE;
    ModuleName* = ARRAY MnLength OF CHAR;

    ModDesc* = RECORD
      name*: ModuleName;
      next*: Module;
      key*, num*, size*, refcnt*: INTEGER;
      data*, str*, tdx*, code*, imp*, cmd*, ent*, ptr*, pvr*: INTEGER;  (*addresses*)
      selected*, marked, hidden, sel: BOOLEAN;
      smb*: INTEGER
    END ;

    ClientHandler* = PROCEDURE(mod, imp: Module; VAR continue: BOOLEAN): INTEGER;
    RefHandler* = PROCEDURE(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;

```
## Variables:
```
 root*, M: Module;
    AllocPtr*, res*, NofSelected*, NofHidden*, limit: INTEGER;
    importing*, imported*: ModuleName;

```
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

