
#### [MODULE System](https://github.com/io-core/System/blob/main/System.Mod)

Procedures:

```
  PROCEDURE GetArg(VAR S: Texts.Scanner);
```
```
  PROCEDURE EndLine;
```
```
  PROCEDURE SetUser*;
```
```
  PROCEDURE SetFont*;
```
```
  PROCEDURE SetColor*;
```
```
  PROCEDURE SetOffset*;
```
```
  PROCEDURE Date*;
```
```
  PROCEDURE Collect*;
```
```
  PROCEDURE Open*;  (*open viewer in system track*)
```
```
  PROCEDURE OpenLog*;  (*open another viewer for Log*)
```
```
  PROCEDURE Clear*;  (*clear Log*)
```
```
  PROCEDURE Close*;  (*viewer*)
```
```
  PROCEDURE CloseTrack*;
```
```
  PROCEDURE Flush*;  (*clear the last closed viewer of the current display*)
```
```
  PROCEDURE Recall*;  (*recover the last closed viewer of the current display*)
```
```
  PROCEDURE RecallFocus*;  (*recover the focus viewer of the current display*)
```
```
  PROCEDURE Copy*;  (*create a copy of the viewer in the current display*)
```
```
  PROCEDURE Grow*;  (*create a copy of the viewer in a newly created overlaying track*)
```
```
  PROCEDURE Expand*;  (*expand the viewer vertically as much as possible*)
```
```
  PROCEDURE Spread*;  (*redistribute viewers vertically*)
```
```
  PROCEDURE MakeDisplayName(prefix: ARRAY OF CHAR; id: INTEGER; VAR name: ARRAY OF CHAR);  (*0 <= id < 10^5*)
```
```
  PROCEDURE OpenViewers;  (*open log and system tool viewer in system track of current display*)
```
```
  PROCEDURE CreateDisplay(name: ARRAY OF CHAR);
```
```
  PROCEDURE OpenDisplay*;  (*display name is provided as parameter*)
```
```
  PROCEDURE Clone*;  (*create a copy of the viewer in a newly created display*)
```
```
  PROCEDURE ExtendDisplay*;  (*extend the current display to the right*)
```
```
  PROCEDURE CloseDisplay*;  (*display id and (optionally) a hint for the display to switch to are provided as parameters*)
```
```
  PROCEDURE SwitchDisplay(D: Viewers.DisplayArea);  (*switch to the specified display*)
```
```
  PROCEDURE SetDisplay*;  (*display id is provided as parameter*)
```
```
  PROCEDURE NextDisplay*;  (*switch to display on the "right"*)
```
```
  PROCEDURE PrevDisplay*;  (*switch to display on the "left"*)
```
```
  PROCEDURE SetDisplayName*;  (*display id and name are provided as parameters*)
```
```
  PROCEDURE ThisDisplay*;
```
```
  PROCEDURE ShowDisplays*;
```
```
  PROCEDURE Select(VAR S: Texts.Scanner; on, this, clients, imports: BOOLEAN; handle: Handler);  (*modules*)
```
```
  PROCEDURE WriteName(name: ARRAY OF CHAR);  (*write the name of a module*)
```
```
  PROCEDURE WriteSelection;  (*write the names of modules previously selected by Select*)
```
```
  PROCEDURE WriteRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;  (*write one reference*)
```
```
  PROCEDURE WriteReferences;  (*write references from each unselected module to any of the selected modules*)
```
```
  PROCEDURE ShowRefs(name: ARRAY OF CHAR);
```
```
  PROCEDURE ShowReferences*;  (*show references from all modules to any of the specified modules individually*)
```
```
  PROCEDURE ShowGroupReferences*;  (*show references from all modules outside the group to the specified module group*)
```
```
  PROCEDURE Show(this, clients, imports: BOOLEAN);
```
```
  PROCEDURE ShowLoaded*;  (*show the specified modules if they are loaded*)
```
```
  PROCEDURE ShowImports*;  (*show the specified modules and all their direct and indirect imports*)
```
```
  PROCEDURE ShowClients*;  (*show the specified modules and all their direct and indirect clients*)
```
```
  PROCEDURE WriteClient(mod, imp: Modules.Module; VAR continue: BOOLEAN): INTEGER;
```
```
  PROCEDURE FreeModules(this, clients, imports: BOOLEAN);
```
```
  PROCEDURE Free*;  (*free the specified modules as a group; if refs exist and the /f option is specified, hide the modules*)
```
```
  PROCEDURE FreeImports*;  (*free the specified modules and all their direct and indirect imports as a group*)
```
```
  PROCEDURE FreeClients*;  (*free the specified modules and all their direct and indirect clients as a group*)
```
```
  PROCEDURE FreeFonts*;
```
```
  PROCEDURE List(name: FileDir.FileName; adr: LONGINT; VAR cont: BOOLEAN);
```
```
  PROCEDURE Directory*;
```
```
  PROCEDURE CopyFiles*;
```
```
  PROCEDURE RenameFiles*;
```
```
  PROCEDURE DeleteFiles*;
```
```
  PROCEDURE Watch*;
```
```
  PROCEDURE ShowModules*;
```
```
  PROCEDURE ShowCommands*;
```
```
  PROCEDURE ShowFonts*;
```
```
  PROCEDURE Run(name: ARRAY OF CHAR);  (*execute multiple commands separated by ~ in the specified batch file*)
```
```
  PROCEDURE Batch*;
```
```
  PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);
```
```
  PROCEDURE Abort;
```
```
  PROCEDURE Deferred;  (*handle trap/abort as soon as the garbage collector has freed up enough heap space*)
```
