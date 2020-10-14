
## [MODULE System](https://github.com/io-core/System/blob/main/System.Mod)

Procedures:


<code>  PROCEDURE GetArg(VAR S: Texts.Scanner);</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L25)


<code>  PROCEDURE EndLine;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L34)


<code>  PROCEDURE SetUser*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L40)


<code>  PROCEDURE SetFont*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L51)


<code>  PROCEDURE SetColor*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L57)


<code>  PROCEDURE SetOffset*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L63)


<code>  PROCEDURE Date*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L69)


<code>  PROCEDURE Collect*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L83)


<code>  PROCEDURE Open*;  (*open viewer in system track*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L89)


<code>  PROCEDURE OpenLog*;  (*open another viewer for Log*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L102)


<code>  PROCEDURE Clear*;  (*clear Log*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L111)


<code>  PROCEDURE Close*;  (*viewer*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L119)


<code>  PROCEDURE CloseTrack*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L128)


<code>  PROCEDURE Flush*;  (*clear the last closed viewer of the current display*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L133)


<code>  PROCEDURE Recall*;  (*recover the last closed viewer of the current display*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L137)


<code>  PROCEDURE RecallFocus*;  (*recover the focus viewer of the current display*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L145)


<code>  PROCEDURE Copy*;  (*create a copy of the viewer in the current display*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L153)


<code>  PROCEDURE Grow*;  (*create a copy of the viewer in a newly created overlaying track*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L160)


<code>  PROCEDURE Expand*;  (*expand the viewer vertically as much as possible*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L173)


<code>  PROCEDURE Spread*;  (*redistribute viewers vertically*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L179)


<code>  PROCEDURE MakeDisplayName(prefix: ARRAY OF CHAR; id: INTEGER; VAR name: ARRAY OF CHAR);  (*0 <= id < 10^5*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L184)


<code>  PROCEDURE OpenViewers;  (*open log and system tool viewer in system track of current display*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L193)


<code>  PROCEDURE CreateDisplay(name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L213)


<code>  PROCEDURE OpenDisplay*;  (*display name is provided as parameter*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L218)


<code>  PROCEDURE Clone*;  (*create a copy of the viewer in a newly created display*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L227)


<code>  PROCEDURE ExtendDisplay*;  (*extend the current display to the right*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L243)


<code>  PROCEDURE CloseDisplay*;  (*display id and (optionally) a hint for the display to switch to are provided as parameters*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L261)


<code>  PROCEDURE SwitchDisplay(D: Viewers.DisplayArea);  (*switch to the specified display*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L282)


<code>  PROCEDURE SetDisplay*;  (*display id is provided as parameter*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L291)


<code>  PROCEDURE NextDisplay*;  (*switch to display on the "right"*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L297)


<code>  PROCEDURE PrevDisplay*;  (*switch to display on the "left"*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L302)


<code>  PROCEDURE SetDisplayName*;  (*display id and name are provided as parameters*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L307)


<code>  PROCEDURE ThisDisplay*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L323)


<code>  PROCEDURE ShowDisplays*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L329)


<code>  PROCEDURE Select(VAR S: Texts.Scanner; on, this, clients, imports: BOOLEAN; handle: Handler);  (*modules*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L341)


<code>  PROCEDURE WriteName(name: ARRAY OF CHAR);  (*write the name of a module*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L360)


<code>  PROCEDURE WriteSelection;  (*write the names of modules previously selected by Select*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L364)


<code>  PROCEDURE WriteRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;  (*write one reference*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L373)


<code>  PROCEDURE WriteReferences;  (*write references from each unselected module to any of the selected modules*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L398)


<code>  PROCEDURE ShowRefs(name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L409)


<code>  PROCEDURE ShowReferences*;  (*show references from all modules to any of the specified modules individually*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L414)


<code>  PROCEDURE ShowGroupReferences*;  (*show references from all modules outside the group to the specified module group*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L420)


<code>  PROCEDURE Show(this, clients, imports: BOOLEAN);</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L427)


<code>  PROCEDURE ShowLoaded*;  (*show the specified modules if they are loaded*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L433)


<code>  PROCEDURE ShowImports*;  (*show the specified modules and all their direct and indirect imports*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L437)


<code>  PROCEDURE ShowClients*;  (*show the specified modules and all their direct and indirect clients*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L441)


<code>  PROCEDURE WriteClient(mod, imp: Modules.Module; VAR continue: BOOLEAN): INTEGER;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L445)


<code>  PROCEDURE FreeModules(this, clients, imports: BOOLEAN);</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L453)


<code>  PROCEDURE Free*;  (*free the specified modules as a group; if refs exist and the /f option is specified, hide the modules*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L471)


<code>  PROCEDURE FreeImports*;  (*free the specified modules and all their direct and indirect imports as a group*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L475)


<code>  PROCEDURE FreeClients*;  (*free the specified modules and all their direct and indirect clients as a group*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L479)


<code>  PROCEDURE FreeFonts*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L483)


<code>  PROCEDURE List(name: FileDir.FileName; adr: LONGINT; VAR cont: BOOLEAN);</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L489)


<code>  PROCEDURE Directory*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L516)


<code>  PROCEDURE CopyFiles*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L549)


<code>  PROCEDURE RenameFiles*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L577)


<code>  PROCEDURE DeleteFiles*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L599)


<code>  PROCEDURE Watch*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L613)


<code>  PROCEDURE ShowModules*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L624)


<code>  PROCEDURE ShowCommands*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L646)


<code>  PROCEDURE ShowFonts*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L673)


<code>  PROCEDURE Run(name: ARRAY OF CHAR);  (*execute multiple commands separated by ~ in the specified batch file*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L682)


<code>  PROCEDURE Batch*;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L696)


<code>  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L705)


<code>  PROCEDURE Abort;</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L727)


<code>  PROCEDURE Deferred;  (*handle trap/abort as soon as the garbage collector has freed up enough heap space*)</code> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L742)

