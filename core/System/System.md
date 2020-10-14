
## [MODULE System](https://github.com/io-core/System/blob/main/System.Mod)

Procedures:


<pre>  PROCEDURE GetArg(VAR S: Texts.Scanner);</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L25)


<pre>  PROCEDURE EndLine;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L34)


<pre>  PROCEDURE SetUser*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L40)


<pre>  PROCEDURE SetFont*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L51)


<pre>  PROCEDURE SetColor*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L57)


<pre>  PROCEDURE SetOffset*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L63)


<pre>  PROCEDURE Date*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L69)


<pre>  PROCEDURE Collect*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L83)


<pre>  PROCEDURE Open*;  (*open viewer in system track*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L89)


<pre>  PROCEDURE OpenLog*;  (*open another viewer for Log*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L102)


<pre>  PROCEDURE Clear*;  (*clear Log*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L111)


<pre>  PROCEDURE Close*;  (*viewer*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L119)


<pre>  PROCEDURE CloseTrack*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L128)


<pre>  PROCEDURE Flush*;  (*clear the last closed viewer of the current display*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L133)


<pre>  PROCEDURE Recall*;  (*recover the last closed viewer of the current display*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L137)


<pre>  PROCEDURE RecallFocus*;  (*recover the focus viewer of the current display*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L145)


<pre>  PROCEDURE Copy*;  (*create a copy of the viewer in the current display*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L153)


<pre>  PROCEDURE Grow*;  (*create a copy of the viewer in a newly created overlaying track*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L160)


<pre>  PROCEDURE Expand*;  (*expand the viewer vertically as much as possible*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L173)


<pre>  PROCEDURE Spread*;  (*redistribute viewers vertically*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L179)


<pre>  PROCEDURE MakeDisplayName(prefix: ARRAY OF CHAR; id: INTEGER; VAR name: ARRAY OF CHAR);  (*0 <= id < 10^5*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L184)


<pre>  PROCEDURE OpenViewers;  (*open log and system tool viewer in system track of current display*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L193)


<pre>  PROCEDURE CreateDisplay(name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L213)


<pre>  PROCEDURE OpenDisplay*;  (*display name is provided as parameter*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L218)


<pre>  PROCEDURE Clone*;  (*create a copy of the viewer in a newly created display*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L227)


<pre>  PROCEDURE ExtendDisplay*;  (*extend the current display to the right*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L243)


<pre>  PROCEDURE CloseDisplay*;  (*display id and (optionally) a hint for the display to switch to are provided as parameters*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L261)


<pre>  PROCEDURE SwitchDisplay(D: Viewers.DisplayArea);  (*switch to the specified display*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L282)


<pre>  PROCEDURE SetDisplay*;  (*display id is provided as parameter*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L291)


<pre>  PROCEDURE NextDisplay*;  (*switch to display on the "right"*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L297)


<pre>  PROCEDURE PrevDisplay*;  (*switch to display on the "left"*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L302)


<pre>  PROCEDURE SetDisplayName*;  (*display id and name are provided as parameters*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L307)


<pre>  PROCEDURE ThisDisplay*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L323)


<pre>  PROCEDURE ShowDisplays*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L329)


<pre>  PROCEDURE Select(VAR S: Texts.Scanner; on, this, clients, imports: BOOLEAN; handle: Handler);  (*modules*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L341)


<pre>  PROCEDURE WriteName(name: ARRAY OF CHAR);  (*write the name of a module*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L360)


<pre>  PROCEDURE WriteSelection;  (*write the names of modules previously selected by Select*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L364)


<pre>  PROCEDURE WriteRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;  (*write one reference*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L373)


<pre>  PROCEDURE WriteReferences;  (*write references from each unselected module to any of the selected modules*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L398)


<pre>  PROCEDURE ShowRefs(name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L409)


<pre>  PROCEDURE ShowReferences*;  (*show references from all modules to any of the specified modules individually*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L414)


<pre>  PROCEDURE ShowGroupReferences*;  (*show references from all modules outside the group to the specified module group*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L420)


<pre>  PROCEDURE Show(this, clients, imports: BOOLEAN);</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L427)


<pre>  PROCEDURE ShowLoaded*;  (*show the specified modules if they are loaded*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L433)


<pre>  PROCEDURE ShowImports*;  (*show the specified modules and all their direct and indirect imports*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L437)


<pre>  PROCEDURE ShowClients*;  (*show the specified modules and all their direct and indirect clients*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L441)


<pre>  PROCEDURE WriteClient(mod, imp: Modules.Module; VAR continue: BOOLEAN): INTEGER;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L445)


<pre>  PROCEDURE FreeModules(this, clients, imports: BOOLEAN);</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L453)


<pre>  PROCEDURE Free*;  (*free the specified modules as a group; if refs exist and the /f option is specified, hide the modules*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L471)


<pre>  PROCEDURE FreeImports*;  (*free the specified modules and all their direct and indirect imports as a group*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L475)


<pre>  PROCEDURE FreeClients*;  (*free the specified modules and all their direct and indirect clients as a group*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L479)


<pre>  PROCEDURE FreeFonts*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L483)


<pre>  PROCEDURE List(name: FileDir.FileName; adr: LONGINT; VAR cont: BOOLEAN);</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L489)


<pre>  PROCEDURE Directory*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L516)


<pre>  PROCEDURE CopyFiles*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L549)


<pre>  PROCEDURE RenameFiles*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L577)


<pre>  PROCEDURE DeleteFiles*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L599)


<pre>  PROCEDURE Watch*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L613)


<pre>  PROCEDURE ShowModules*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L624)


<pre>  PROCEDURE ShowCommands*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L646)


<pre>  PROCEDURE ShowFonts*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L673)


<pre>  PROCEDURE Run(name: ARRAY OF CHAR);  (*execute multiple commands separated by ~ in the specified batch file*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L682)


<pre>  PROCEDURE Batch*;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L696)


<pre>  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L705)


<pre>  PROCEDURE Abort;</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L727)


<pre>  PROCEDURE Deferred;  (*handle trap/abort as soon as the garbage collector has freed up enough heap space*)</pre> [(source)](https://github.com/io-core/System/blob/main/System.Mod#L742)

