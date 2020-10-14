
## [MODULE System](https://github.com/io-core/System/blob/main/System.Mod)

Procedures:

```
[25](https://github.com/io-core/System/blob/main/System.Mod#25)    PROCEDURE GetArg(VAR S: Texts.Scanner);
```
```
[34](https://github.com/io-core/System/blob/main/System.Mod#34)    PROCEDURE EndLine;
```
```
[40](https://github.com/io-core/System/blob/main/System.Mod#40)    PROCEDURE SetUser*;
```
```
[51](https://github.com/io-core/System/blob/main/System.Mod#51)    PROCEDURE SetFont*;
```
```
[57](https://github.com/io-core/System/blob/main/System.Mod#57)    PROCEDURE SetColor*;
```
```
[63](https://github.com/io-core/System/blob/main/System.Mod#63)    PROCEDURE SetOffset*;
```
```
[69](https://github.com/io-core/System/blob/main/System.Mod#69)    PROCEDURE Date*;
```
```
[83](https://github.com/io-core/System/blob/main/System.Mod#83)    PROCEDURE Collect*;
```
```
[89](https://github.com/io-core/System/blob/main/System.Mod#89)    PROCEDURE Open*;  (*open viewer in system track*)
```
```
[102](https://github.com/io-core/System/blob/main/System.Mod#102)    PROCEDURE OpenLog*;  (*open another viewer for Log*)
```
```
[111](https://github.com/io-core/System/blob/main/System.Mod#111)    PROCEDURE Clear*;  (*clear Log*)
```
```
[119](https://github.com/io-core/System/blob/main/System.Mod#119)    PROCEDURE Close*;  (*viewer*)
```
```
[128](https://github.com/io-core/System/blob/main/System.Mod#128)    PROCEDURE CloseTrack*;
```
```
[133](https://github.com/io-core/System/blob/main/System.Mod#133)    PROCEDURE Flush*;  (*clear the last closed viewer of the current display*)
```
```
[137](https://github.com/io-core/System/blob/main/System.Mod#137)    PROCEDURE Recall*;  (*recover the last closed viewer of the current display*)
```
```
[145](https://github.com/io-core/System/blob/main/System.Mod#145)    PROCEDURE RecallFocus*;  (*recover the focus viewer of the current display*)
```
```
[153](https://github.com/io-core/System/blob/main/System.Mod#153)    PROCEDURE Copy*;  (*create a copy of the viewer in the current display*)
```
```
[160](https://github.com/io-core/System/blob/main/System.Mod#160)    PROCEDURE Grow*;  (*create a copy of the viewer in a newly created overlaying track*)
```
```
[173](https://github.com/io-core/System/blob/main/System.Mod#173)    PROCEDURE Expand*;  (*expand the viewer vertically as much as possible*)
```
```
[179](https://github.com/io-core/System/blob/main/System.Mod#179)    PROCEDURE Spread*;  (*redistribute viewers vertically*)
```
```
[184](https://github.com/io-core/System/blob/main/System.Mod#184)    PROCEDURE MakeDisplayName(prefix: ARRAY OF CHAR; id: INTEGER; VAR name: ARRAY OF CHAR);  (*0 <= id < 10^5*)
```
```
[193](https://github.com/io-core/System/blob/main/System.Mod#193)    PROCEDURE OpenViewers;  (*open log and system tool viewer in system track of current display*)
```
```
[213](https://github.com/io-core/System/blob/main/System.Mod#213)    PROCEDURE CreateDisplay(name: ARRAY OF CHAR);
```
```
[218](https://github.com/io-core/System/blob/main/System.Mod#218)    PROCEDURE OpenDisplay*;  (*display name is provided as parameter*)
```
```
[227](https://github.com/io-core/System/blob/main/System.Mod#227)    PROCEDURE Clone*;  (*create a copy of the viewer in a newly created display*)
```
```
[243](https://github.com/io-core/System/blob/main/System.Mod#243)    PROCEDURE ExtendDisplay*;  (*extend the current display to the right*)
```
```
[261](https://github.com/io-core/System/blob/main/System.Mod#261)    PROCEDURE CloseDisplay*;  (*display id and (optionally) a hint for the display to switch to are provided as parameters*)
```
```
[282](https://github.com/io-core/System/blob/main/System.Mod#282)    PROCEDURE SwitchDisplay(D: Viewers.DisplayArea);  (*switch to the specified display*)
```
```
[291](https://github.com/io-core/System/blob/main/System.Mod#291)    PROCEDURE SetDisplay*;  (*display id is provided as parameter*)
```
```
[297](https://github.com/io-core/System/blob/main/System.Mod#297)    PROCEDURE NextDisplay*;  (*switch to display on the "right"*)
```
```
[302](https://github.com/io-core/System/blob/main/System.Mod#302)    PROCEDURE PrevDisplay*;  (*switch to display on the "left"*)
```
```
[307](https://github.com/io-core/System/blob/main/System.Mod#307)    PROCEDURE SetDisplayName*;  (*display id and name are provided as parameters*)
```
```
[323](https://github.com/io-core/System/blob/main/System.Mod#323)    PROCEDURE ThisDisplay*;
```
```
[329](https://github.com/io-core/System/blob/main/System.Mod#329)    PROCEDURE ShowDisplays*;
```
```
[341](https://github.com/io-core/System/blob/main/System.Mod#341)    PROCEDURE Select(VAR S: Texts.Scanner; on, this, clients, imports: BOOLEAN; handle: Handler);  (*modules*)
```
```
[360](https://github.com/io-core/System/blob/main/System.Mod#360)    PROCEDURE WriteName(name: ARRAY OF CHAR);  (*write the name of a module*)
```
```
[364](https://github.com/io-core/System/blob/main/System.Mod#364)    PROCEDURE WriteSelection;  (*write the names of modules previously selected by Select*)
```
```
[373](https://github.com/io-core/System/blob/main/System.Mod#373)    PROCEDURE WriteRef(src, dst: LONGINT; s: ARRAY OF CHAR; VAR continue: BOOLEAN): INTEGER;  (*write one reference*)
```
```
[398](https://github.com/io-core/System/blob/main/System.Mod#398)    PROCEDURE WriteReferences;  (*write references from each unselected module to any of the selected modules*)
```
```
[409](https://github.com/io-core/System/blob/main/System.Mod#409)    PROCEDURE ShowRefs(name: ARRAY OF CHAR);
```
```
[414](https://github.com/io-core/System/blob/main/System.Mod#414)    PROCEDURE ShowReferences*;  (*show references from all modules to any of the specified modules individually*)
```
```
[420](https://github.com/io-core/System/blob/main/System.Mod#420)    PROCEDURE ShowGroupReferences*;  (*show references from all modules outside the group to the specified module group*)
```
```
[427](https://github.com/io-core/System/blob/main/System.Mod#427)    PROCEDURE Show(this, clients, imports: BOOLEAN);
```
```
[433](https://github.com/io-core/System/blob/main/System.Mod#433)    PROCEDURE ShowLoaded*;  (*show the specified modules if they are loaded*)
```
```
[437](https://github.com/io-core/System/blob/main/System.Mod#437)    PROCEDURE ShowImports*;  (*show the specified modules and all their direct and indirect imports*)
```
```
[441](https://github.com/io-core/System/blob/main/System.Mod#441)    PROCEDURE ShowClients*;  (*show the specified modules and all their direct and indirect clients*)
```
```
[445](https://github.com/io-core/System/blob/main/System.Mod#445)    PROCEDURE WriteClient(mod, imp: Modules.Module; VAR continue: BOOLEAN): INTEGER;
```
```
[453](https://github.com/io-core/System/blob/main/System.Mod#453)    PROCEDURE FreeModules(this, clients, imports: BOOLEAN);
```
```
[471](https://github.com/io-core/System/blob/main/System.Mod#471)    PROCEDURE Free*;  (*free the specified modules as a group; if refs exist and the /f option is specified, hide the modules*)
```
```
[475](https://github.com/io-core/System/blob/main/System.Mod#475)    PROCEDURE FreeImports*;  (*free the specified modules and all their direct and indirect imports as a group*)
```
```
[479](https://github.com/io-core/System/blob/main/System.Mod#479)    PROCEDURE FreeClients*;  (*free the specified modules and all their direct and indirect clients as a group*)
```
```
[483](https://github.com/io-core/System/blob/main/System.Mod#483)    PROCEDURE FreeFonts*;
```
```
[489](https://github.com/io-core/System/blob/main/System.Mod#489)    PROCEDURE List(name: FileDir.FileName; adr: LONGINT; VAR cont: BOOLEAN);
```
```
[516](https://github.com/io-core/System/blob/main/System.Mod#516)    PROCEDURE Directory*;
```
```
[549](https://github.com/io-core/System/blob/main/System.Mod#549)    PROCEDURE CopyFiles*;
```
```
[577](https://github.com/io-core/System/blob/main/System.Mod#577)    PROCEDURE RenameFiles*;
```
```
[599](https://github.com/io-core/System/blob/main/System.Mod#599)    PROCEDURE DeleteFiles*;
```
```
[613](https://github.com/io-core/System/blob/main/System.Mod#613)    PROCEDURE Watch*;
```
```
[624](https://github.com/io-core/System/blob/main/System.Mod#624)    PROCEDURE ShowModules*;
```
```
[646](https://github.com/io-core/System/blob/main/System.Mod#646)    PROCEDURE ShowCommands*;
```
```
[673](https://github.com/io-core/System/blob/main/System.Mod#673)    PROCEDURE ShowFonts*;
```
```
[682](https://github.com/io-core/System/blob/main/System.Mod#682)    PROCEDURE Run(name: ARRAY OF CHAR);  (*execute multiple commands separated by ~ in the specified batch file*)
```
```
[696](https://github.com/io-core/System/blob/main/System.Mod#696)    PROCEDURE Batch*;
```
```
[705](https://github.com/io-core/System/blob/main/System.Mod#705)    PROCEDURE Trap(VAR a: INTEGER; b, c, d: INTEGER);
```
```
[727](https://github.com/io-core/System/blob/main/System.Mod#727)    PROCEDURE Abort;
```
```
[742](https://github.com/io-core/System/blob/main/System.Mod#742)    PROCEDURE Deferred;  (*handle trap/abort as soon as the garbage collector has freed up enough heap space*)
```
