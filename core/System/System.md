
## [MODULE System](https://github.com/io-core/System/blob/main/System.Mod)

Procedures:


`  PROCEDURE GetArg(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L25)


`  PROCEDURE EndLine;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L34)


`  PROCEDURE SetUser*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L40)


`  PROCEDURE SetFont*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L51)


`  PROCEDURE SetColor*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L57)


`  PROCEDURE SetOffset*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L63)


`  PROCEDURE Date*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L69)


`  PROCEDURE Collect*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L83)


`  PROCEDURE Open*;  (*open viewer in system track*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L89)


`  PROCEDURE OpenLog*;  (*open another viewer for Log*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L102)


`  PROCEDURE Clear*;  (*clear Log*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L111)


`  PROCEDURE Close*;  (*viewer*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L119)


`  PROCEDURE CloseTrack*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L128)


`  PROCEDURE Flush*;  (*clear the last closed viewer of the current display*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L133)


`  PROCEDURE Recall*;  (*recover the last closed viewer of the current display*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L137)


`  PROCEDURE RecallFocus*;  (*recover the focus viewer of the current display*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L145)


`  PROCEDURE Copy*;  (*create a copy of the viewer in the current display*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L153)


`  PROCEDURE Grow*;  (*create a copy of the viewer in a newly created overlaying track*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L160)


`  PROCEDURE Expand*;  (*expand the viewer vertically as much as possible*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L173)


`  PROCEDURE Spread*;  (*redistribute viewers vertically*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L179)


`  PROCEDURE MakeDisplayName(prefix: ARRAY OF CHAR; id: INTEGER; VAR name: ARRAY OF CHAR);  (*0 <= id < 10^5*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L184)


`  PROCEDURE OpenViewers;  (*open log and system tool viewer in system track of current display*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L193)


`  PROCEDURE CreateDisplay(name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L213)


`  PROCEDURE OpenDisplay*;  (*display name is provided as parameter*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L218)


`  PROCEDURE Clone*;  (*create a copy of the viewer in a newly created display*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L227)


`  PROCEDURE ExtendDisplay*;  (*extend the current display to the right*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L243)


`  PROCEDURE CloseDisplay*;  (*display id and (optionally) a hint for the display to switch to are provided as parameters*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L261)


`  PROCEDURE SwitchDisplay(D: Viewers.DisplayArea);  (*switch to the specified display*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L282)


`  PROCEDURE SetDisplay*;  (*display id is provided as parameter*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L291)


`  PROCEDURE NextDisplay*;  (*switch to display on the "right"*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L297)


`  PROCEDURE PrevDisplay*;  (*switch to display on the "left"*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L302)


`  PROCEDURE SetDisplayName*;  (*display id and name are provided as parameters*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L307)


`  PROCEDURE ThisDisplay*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L323)


`  PROCEDURE ShowDisplays*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L329)


`  PROCEDURE Select(VAR S: Texts.Scanner; on, this, clients, imports: BOOLEAN; handle: Handler);  (*modules*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L341)


`  PROCEDURE WriteName(name: ARRAY OF CHAR);  (*write the name of a module*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L360)


`  PROCEDURE WriteSelection;  (*write the names of modules previously selected by Select*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L364)


`  PROCEDURE WriteRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;  (*write one reference*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L373)


`  PROCEDURE WriteReferences;  (*write references from each unselected module to any of the selected modules*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L398)


`  PROCEDURE ShowRefs(name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L409)


`  PROCEDURE ShowReferences*;  (*show references from all modules to any of the specified modules individually*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L414)


`  PROCEDURE ShowGroupReferences*;  (*show references from all modules outside the group to the specified module group*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L420)


`  PROCEDURE Show(this, clients, imports: BOOLEAN);` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L427)


`  PROCEDURE ShowLoaded*;  (*show the specified modules if they are loaded*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L433)


`  PROCEDURE ShowImports*;  (*show the specified modules and all their direct and indirect imports*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L437)


`  PROCEDURE ShowClients*;  (*show the specified modules and all their direct and indirect clients*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L441)


`  PROCEDURE WriteClient(mod, imp: Modules.Module; VAR continue: BOOLEAN): INTEGER;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L445)


`  PROCEDURE FreeModules(this, clients, imports: BOOLEAN);` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L453)


`  PROCEDURE Free*;  (*free the specified modules as a group; if refs exist and the /f option is specified, hide the modules*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L471)


`  PROCEDURE FreeImports*;  (*free the specified modules and all their direct and indirect imports as a group*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L475)


`  PROCEDURE FreeClients*;  (*free the specified modules and all their direct and indirect clients as a group*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L479)


`  PROCEDURE FreeFonts*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L483)


`  PROCEDURE List(name: FileDir.FileName; adr: LONGINT; VAR cont: BOOLEAN);` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L489)


`  PROCEDURE Directory*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L516)


`  PROCEDURE CopyFiles*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L549)


`  PROCEDURE RenameFiles*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L577)


`  PROCEDURE DeleteFiles*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L599)


`  PROCEDURE Watch*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L613)


`  PROCEDURE ShowModules*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L624)


`  PROCEDURE ShowCommands*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L646)


`  PROCEDURE ShowFonts*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L673)


`  PROCEDURE Run(name: ARRAY OF CHAR);  (*execute multiple commands separated by ~ in the specified batch file*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L682)


`  PROCEDURE Batch*;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L696)


`  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L705)


`  PROCEDURE Abort;` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L727)


`  PROCEDURE Deferred;  (*handle trap/abort as soon as the garbage collector has freed up enough heap space*)` [(source)](https://github.com/io-core/System/blob/main/System.Mod#L742)

