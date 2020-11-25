## System
This package prepares the user interface and manages viewers for the user.


### _Package Overview:_
The System package collects the expected set of modules and tools that allows the Oberon user to perform typical computing tasks.

### _Package Use:_

### _Modules in this package:_

#### [MODULE System](https://github.com/io-core/doc/blob/main/core/System/System.md) [(source)](https://github.com/io-core/System/blob/main/System.Mod)
Module System presents the Oberon user with tools and commands for interacting Displays and Tracks and Files and other miscelaneous features.


  **imports:** ` SYSTEM Kernel FileDir Files Modules Input Display Viewers Fonts Texts Oberon MenuViewers TextFrames`

**Procedures:**
```
  SetUser*

  SetFont*

  SetColor*

  SetOffset*

  Date*

  Collect*

  Open*  (*open viewer in system track*)

  Clear*  (*clear Log*)

  Close*

  CloseTrack*

  Recall*

  Copy*

  Grow*

  Free*

  FreeFonts*

  Directory*

  CopyFiles*

  RenameFiles*

  DeleteFiles*

  Watch*

  ShowModules*

  ShowCommands*

  ShowFonts*

  ExtendDisplay*

```


#### [MODULE MenuViewers](https://github.com/io-core/doc/blob/main/core/System/MenuViewers.md) [(source)](https://github.com/io-core/System/blob/main/MenuViewers.Mod)
Module MenuViewers implements the top-of-pane 'menu' functionality of the Oberon user interface. 

MenuViewers uses Input, Display, Viewers, Oberon



  **imports:** ` Input Display Viewers Oberon`

**Procedures:**
```
  Handle* (V: Display.Frame; VAR M: Display.FrameMsg)

  New* (Menu, Main: Display.Frame; menuH, X, Y: INTEGER): Viewer 

```


#### [MODULE PIO](https://github.com/io-core/doc/blob/main/core/System/PIO.md) [(source)](https://github.com/io-core/System/blob/main/PIO.Mod)
Module PIO implements PIC input/output for RISC Oberon.


  **imports:** ` SYSTEM`

**Procedures:**
```
  Send*(x: LONGINT)

  Receive*(VAR x: LONGINT)

  Reset*

```


#### [MODULE Tools](https://github.com/io-core/doc/blob/main/core/System/Tools.md) [(source)](https://github.com/io-core/System/blob/main/Tools.Mod)
Module Tools provides commands for inspecting memory, disk, etc.


  **imports:** ` SYSTEM Kernel Files Modules Input Texts Viewers MenuViewers TextFrames Oberon`

**Procedures:**
```
  Clear*  (*used to clear output*)

  Recall*

  Inspect*

  Sector*

  ShowFile*

  Convert*   (*convert selected text to txt-format*)

  Id*

```


#### [MODULE PCLink1](https://github.com/io-core/doc/blob/main/core/System/PCLink1.md) [(source)](https://github.com/io-core/System/blob/main/PCLink1.Mod)
Module PCLink1 provides for serial connection between Oberon machines or Oberon and a host computer.


  **imports:** ` SYSTEM Files Texts Oberon`

**Procedures:**
```
  Run*

  Stop*

```


#### [MODULE RS232](https://github.com/io-core/doc/blob/main/core/System/RS232.md) [(source)](https://github.com/io-core/System/blob/main/RS232.Mod)
Module RS232 provides for serial communications in RISC Oberon.


  **imports:** ` SYSTEM`

**Procedures:**
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


#### [MODULE Net](https://github.com/io-core/doc/blob/main/core/System/Net.md) [(source)](https://github.com/io-core/System/blob/main/Net.Mod)
Module Net provides for client-server communication in Oberon.


  **imports:** ` SYSTEM SCC Files Viewers Texts TextFrames MenuViewers Oberon`

**Procedures:**
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


#### [MODULE SCC](https://github.com/io-core/doc/blob/main/core/System/SCC.md) [(source)](https://github.com/io-core/System/blob/main/SCC.Mod)
Module SCC provides for wireless communication in RISC Oberon.


  **imports:** ` SYSTEM Kernel`

**Procedures:**
```
  Start*(filt: BOOLEAN)

  SendPacket*(VAR head: Header; dat: ARRAY OF BYTE)

  Available*(): INTEGER

  Receive*(VAR x: BYTE)

  ReceiveHead*(VAR head: Header)  (*actually, recv whole packet*)

  Skip*(m: INTEGER)

  Stop*

```


#### [MODULE Batch](https://github.com/io-core/doc/blob/main/core/System/Batch.md) [(source)](https://github.com/io-core/System/blob/main/Batch.Mod)
Module Batch provides for automatic sequential execution of Oberon commands.

Module Batch provides for automatic sequential execution of Oberon commands.


  **imports:** ` Kernel FileDir Files Display Texts TextFrames Viewers Oberon`

**Procedures:**
```
  ClearLog*

  WriteLog*

  VerifyLog*

  DeleteFiles*

  Collect*

  Run*

```


#### [MODULE Halt](https://github.com/io-core/doc/blob/main/core/System/Halt.md) [(source)](https://github.com/io-core/System/blob/main/Halt.Mod)
Module Halt halts the processor in some emulators of RISC Oberon.


  **imports:** ` SYSTEM`

**Procedures:**
```
  Halt*(x: INTEGER)

  Now*

```
