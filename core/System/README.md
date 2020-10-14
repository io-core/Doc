## System
This package prepares the user interface and manages viewers for the user.


The System package collects the expected set of modules and tools that allows the Oberon user to perform typical computing tasks.


#### [MODULE System](https://github.com/io-core/System/blob/main/System.Mod)
Module System presents the Oberon user with tools and commands for interacting Displays and Tracks and Files and other miscelaneous features.


Procedures:
```
  SetUser*

  SetFont*

  SetColor*

  SetOffset*

  Date*

  Collect*

  Open*  (*open viewer in system track*)

  OpenLog*  (*open another viewer for Log*)

  Clear*  (*clear Log*)

  Close*  (*viewer*)

  CloseTrack*

  Flush*  (*clear the last closed viewer of the current display*)

  Recall*  (*recover the last closed viewer of the current display*)

  RecallFocus*  (*recover the focus viewer of the current display*)

  Copy*  (*create a copy of the viewer in the current display*)

  Grow*  (*create a copy of the viewer in a newly created overlaying track*)

  Expand*  (*expand the viewer vertically as much as possible*)

  Spread*  (*redistribute viewers vertically*)

  OpenDisplay*  (*display name is provided as parameter*)

  Clone*  (*create a copy of the viewer in a newly created display*)

  ExtendDisplay*  (*extend the current display to the right*)

  CloseDisplay*  (*display id and (optionally) a hint for the display to switch to are provided as parameters*)

  SetDisplay*  (*display id is provided as parameter*)

  NextDisplay*  (*switch to display on the "right"*)

  PrevDisplay*  (*switch to display on the "left"*)

  SetDisplayName*  (*display id and name are provided as parameters*)

  ThisDisplay*

  ShowDisplays*

  ShowReferences*  (*show references from all modules to any of the specified modules individually*)

  ShowGroupReferences*  (*show references from all modules outside the group to the specified module group*)

  ShowLoaded*  (*show the specified modules if they are loaded*)

  ShowImports*  (*show the specified modules and all their direct and indirect imports*)

  ShowClients*  (*show the specified modules and all their direct and indirect clients*)

  Free*;  (*free the specified modules as a group if refs exist and the /f option is specified, hide the modules*)

  FreeImports*  (*free the specified modules and all their direct and indirect imports as a group*)

  FreeClients*  (*free the specified modules and all their direct and indirect clients as a group*)

  FreeFonts*

  Directory*

  CopyFiles*

  RenameFiles*

  DeleteFiles*

  Watch*

  ShowModules*

  ShowCommands*

  ShowFonts*

  Batch*

```


#### [MODULE Batch](https://github.com/io-core/System/blob/main/Batch.Mod)
Module Batch provides for automatic sequential execution of Oberon commands.


Procedures:
```
  ClearLog*

  WriteLog*

  VerifyLog*

  DeleteFiles*

  Collect*

  Run*

```


#### [MODULE Tools](https://github.com/io-core/System/blob/main/Tools.Mod)
Module Tools provides commands for inspecting memory, disk, etc.


Procedures:
```
  Clear*  (*used to clear output*)

  Close*

  Recall*

  Inspect*

  Sector*

  ShowFile*

  Convert*   (*convert selected text to txt-format*)

  Id*

```


#### [MODULE Blink](https://github.com/io-core/System/blob/main/Blink.Mod)

Procedures:
```
  Run*

  Stop*

```


#### [MODULE Math](https://github.com/io-core/System/blob/main/Math.Mod)
Module Math provides standard math functions in Oberon.


Procedures:
```
  sqrt*(x: REAL): REAL

  exp*(x: REAL): REAL

  ln*(x: REAL): REAL

  sin*(x: REAL): REAL

  cos*(x: REAL): REAL

```


#### [MODULE PCLink1](https://github.com/io-core/System/blob/main/PCLink1.Mod)
Module PCLink1 provides for serial connection between Oberon machines or Oberon and a host computer.


Procedures:
```
  Run*

  Stop*

```


#### [MODULE PIO](https://github.com/io-core/System/blob/main/PIO.Mod)
Module PIO implements PIC input/output for RISC Oberon.


Procedures:
```
  Send*(x: LONGINT)

  Receive*(VAR x: LONGINT)

  Reset*

```


#### [MODULE RS232](https://github.com/io-core/System/blob/main/RS232.Mod)
Module RS232 provides for serial communications in RISC Oberon.


Procedures:
```
  Send*(x: INTEGER)

  Rec*(VAR x: INTEGER)

  SendInt*(x: INTEGER)

  SendHex*(x: INTEGER)

  SendReal*(x: REAL)

  SendStr*(x: ARRAY OF CHAR)

  RecInt*(VAR x: INTEGER)

  RecReal*(VAR x: REAL)

  RecStr*(VAR x: ARRAY OF CHAR)

  Line*

  End*

```


#### [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)
Module Net provides for client-server communication in Oberon.


Procedures:
```
  SendFiles*

  ReceiveFiles*

  SendMsg*

  GetTime*

  StartServer*

  Unprotect*

  WProtect*

  Reset*

  StopServer*

  SCCStatus*

```


#### [MODULE SCC](https://github.com/io-core/System/blob/main/SCC.Mod)
Module SCC provides for wireless communication in RISC Oberon.


Procedures:
```
  Start*(filt: BOOLEAN)

  SendPacket*(VAR head: Header; dat: ARRAY OF CHAR)

  Available*(): INTEGER

  Receive*(VAR x: BYTE)

  ReceiveHead*(VAR head: Header)  (*actually, recv whole packet*)

  Skip*(m: INTEGER)

  Stop*

```


#### [MODULE BootLoad](https://github.com/io-core/System/blob/main/BootLoad.Mod)
Module BootLoad compiles to a binary to be placed in the firmware of a system that will boot to Oberon.


Procedures:
```
```
