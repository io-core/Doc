
## [MODULE System](https://github.com/io-core/System/blob/main/System.Mod)

Procedures:

[](https://github.com/io-core/System/blob/main/System.Mod#L25) `  PROCEDURE GetArg(VAR S: Texts.Scanner);`
[](https://github.com/io-core/System/blob/main/System.Mod#L34) `  PROCEDURE EndLine;`
[](https://github.com/io-core/System/blob/main/System.Mod#L40) `  PROCEDURE SetUser*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L51) `  PROCEDURE SetFont*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L57) `  PROCEDURE SetColor*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L63) `  PROCEDURE SetOffset*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L69) `  PROCEDURE Date*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L83) `  PROCEDURE Collect*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L89) `  PROCEDURE Open*;  (*open viewer in system track*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L102) `  PROCEDURE OpenLog*;  (*open another viewer for Log*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L111) `  PROCEDURE Clear*;  (*clear Log*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L119) `  PROCEDURE Close*;  (*viewer*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L128) `  PROCEDURE CloseTrack*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L133) `  PROCEDURE Flush*;  (*clear the last closed viewer of the current display*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L137) `  PROCEDURE Recall*;  (*recover the last closed viewer of the current display*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L145) `  PROCEDURE RecallFocus*;  (*recover the focus viewer of the current display*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L153) `  PROCEDURE Copy*;  (*create a copy of the viewer in the current display*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L160) `  PROCEDURE Grow*;  (*create a copy of the viewer in a newly created overlaying track*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L173) `  PROCEDURE Expand*;  (*expand the viewer vertically as much as possible*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L179) `  PROCEDURE Spread*;  (*redistribute viewers vertically*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L184) `  PROCEDURE MakeDisplayName(prefix: ARRAY OF CHAR; id: INTEGER; VAR name: ARRAY OF CHAR);  (*0 <= id < 10^5*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L193) `  PROCEDURE OpenViewers;  (*open log and system tool viewer in system track of current display*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L213) `  PROCEDURE CreateDisplay(name: ARRAY OF CHAR);`
[](https://github.com/io-core/System/blob/main/System.Mod#L218) `  PROCEDURE OpenDisplay*;  (*display name is provided as parameter*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L227) `  PROCEDURE Clone*;  (*create a copy of the viewer in a newly created display*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L243) `  PROCEDURE ExtendDisplay*;  (*extend the current display to the right*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L261) `  PROCEDURE CloseDisplay*;  (*display id and (optionally) a hint for the display to switch to are provided as parameters*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L282) `  PROCEDURE SwitchDisplay(D: Viewers.DisplayArea);  (*switch to the specified display*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L291) `  PROCEDURE SetDisplay*;  (*display id is provided as parameter*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L297) `  PROCEDURE NextDisplay*;  (*switch to display on the "right"*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L302) `  PROCEDURE PrevDisplay*;  (*switch to display on the "left"*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L307) `  PROCEDURE SetDisplayName*;  (*display id and name are provided as parameters*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L323) `  PROCEDURE ThisDisplay*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L329) `  PROCEDURE ShowDisplays*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L341) `  PROCEDURE Select(VAR S: Texts.Scanner; on, this, clients, imports: BOOLEAN; handle: Handler);  (*modules*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L360) `  PROCEDURE WriteName(name: ARRAY OF CHAR);  (*write the name of a module*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L364) `  PROCEDURE WriteSelection;  (*write the names of modules previously selected by Select*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L373) `  PROCEDURE WriteRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;  (*write one reference*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L398) `  PROCEDURE WriteReferences;  (*write references from each unselected module to any of the selected modules*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L409) `  PROCEDURE ShowRefs(name: ARRAY OF CHAR);`
[](https://github.com/io-core/System/blob/main/System.Mod#L414) `  PROCEDURE ShowReferences*;  (*show references from all modules to any of the specified modules individually*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L420) `  PROCEDURE ShowGroupReferences*;  (*show references from all modules outside the group to the specified module group*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L427) `  PROCEDURE Show(this, clients, imports: BOOLEAN);`
[](https://github.com/io-core/System/blob/main/System.Mod#L433) `  PROCEDURE ShowLoaded*;  (*show the specified modules if they are loaded*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L437) `  PROCEDURE ShowImports*;  (*show the specified modules and all their direct and indirect imports*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L441) `  PROCEDURE ShowClients*;  (*show the specified modules and all their direct and indirect clients*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L445) `  PROCEDURE WriteClient(mod, imp: Modules.Module; VAR continue: BOOLEAN): INTEGER;`
[](https://github.com/io-core/System/blob/main/System.Mod#L453) `  PROCEDURE FreeModules(this, clients, imports: BOOLEAN);`
[](https://github.com/io-core/System/blob/main/System.Mod#L471) `  PROCEDURE Free*;  (*free the specified modules as a group; if refs exist and the /f option is specified, hide the modules*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L475) `  PROCEDURE FreeImports*;  (*free the specified modules and all their direct and indirect imports as a group*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L479) `  PROCEDURE FreeClients*;  (*free the specified modules and all their direct and indirect clients as a group*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L483) `  PROCEDURE FreeFonts*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L489) `  PROCEDURE List(name: FileDir.FileName; adr: LONGINT; VAR cont: BOOLEAN);`
[](https://github.com/io-core/System/blob/main/System.Mod#L516) `  PROCEDURE Directory*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L549) `  PROCEDURE CopyFiles*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L577) `  PROCEDURE RenameFiles*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L599) `  PROCEDURE DeleteFiles*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L613) `  PROCEDURE Watch*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L624) `  PROCEDURE ShowModules*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L646) `  PROCEDURE ShowCommands*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L673) `  PROCEDURE ShowFonts*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L682) `  PROCEDURE Run(name: ARRAY OF CHAR);  (*execute multiple commands separated by ~ in the specified batch file*)`
[](https://github.com/io-core/System/blob/main/System.Mod#L696) `  PROCEDURE Batch*;`
[](https://github.com/io-core/System/blob/main/System.Mod#L705) `  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);`
[](https://github.com/io-core/System/blob/main/System.Mod#L727) `  PROCEDURE Abort;`
[](https://github.com/io-core/System/blob/main/System.Mod#L742) `  PROCEDURE Deferred;  (*handle trap/abort as soon as the garbage collector has freed up enough heap space*)`
