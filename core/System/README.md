## System
This package prepares the user interface and manages viewers for the user.


### _Package Overview:_
The System package collects the expected set of modules and tools that allows the Oberon user to perform typical computing tasks.

### _Package Use:_

### _Modules in this package:_

#### [MODULE System](https://github.com/io-core/doc/blob/main/core/System/System.md) [(source)](https://github.com/io-core/System/blob/main/System.Mod)
Module System presents the Oberon user with tools and commands for interacting Displays and Tracks and Files and other miscelaneous features.


  **imports:** ` SYSTEM Kernel FileDir Files Modules
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


#### [MODULE Hilbert](https://github.com/io-core/doc/blob/main/core/System/Hilbert.md) [(source)](https://github.com/io-core/System/blob/main/Hilbert.Mod)

  **imports:** ` Display Viewers Texts Oberon MenuViewers TextFrames`

**Procedures:**
```
  Draw*

```


#### [MODULE Sierpinski](https://github.com/io-core/doc/blob/main/core/System/Sierpinski.md) [(source)](https://github.com/io-core/System/blob/main/Sierpinski.Mod)

  **imports:** ` Display Viewers Oberon MenuViewers TextFrames`

**Procedures:**
```
  Draw*

```


#### [MODULE Stars](https://github.com/io-core/doc/blob/main/core/System/Stars.md) [(source)](https://github.com/io-core/System/blob/main/Stars.Mod)

  **imports:** ` SYSTEM Display Viewers Texts Oberon MenuViewers TextFrames`

**Procedures:**
```
  Step*

  Open*

  Run*

  Stop*

  Close*

  SetPeriod*

```


#### [MODULE Checkers](https://github.com/io-core/doc/blob/main/core/System/Checkers.md) [(source)](https://github.com/io-core/System/blob/main/Checkers.Mod)

**Procedures:**
```
  MODULE Checkers;  (*NW 4.10.90 / 10.3.2013*)  IMPORT SYSTEM, Display, Viewers, Oberon, MenuViewers, TextFrames;  TYPE Frame = POINTER TO FrameDesc;    FrameDesc = RECORD (Display.FrameDesc)        col: INTEGER      END ;  VAR i: INTEGER;    checks: INTEGER;    pat: ARRAY 17 OF INTEGER;Restore(F: Frame);  BEGIN Oberon.RemoveMarks(F.X, F.Y, F.W, F.H);    Display.ReplConst(Display.black, F.X, F.Y, F.W, F.H, Display.replace); (*clear*)    Display.ReplPattern(F.col, checks, F.X+1, F.Y, F.W-1, F.H-1, Display.paint)  END Restore;  PROCEDURE Handle(G: Display.Frame; VAR M: Display.FrameMsg);    VAR G1: Frame;  BEGIN    CASE G OF Frame:      CASE M OF      Oberon.InputMsg:        IF M.id = Oberon.track THEN Oberon.DrawMouseArrow(M.X, M.Y) END |      Oberon.CopyMsg:        Oberon.RemoveMarks(G.X, G.Y, G.W, G.H); NEW(G1); G1^ := G^; M.F := G1 |      MenuViewers.ModifyMsg:        IF (M.Y # G.Y) OR (M.H # G.H) THEN G.Y := M.Y; G.H := M.H; Restore(G) END      END    END  END Handle;  PROCEDURE Open*;    VAR F: Frame; V: Viewers.Viewer; X, Y: INTEGER;  BEGIN NEW(F); F.col := 14; F.handle := Handle;    Oberon.AllocateUserViewer(Oberon.Par.vwr.X, X, Y);    V := MenuViewers.New(      TextFrames.NewMenu("CheckerViewer", "System.Close System.Copy System.Grow"),      F, TextFrames.menuH, X, Y)  END Open;BEGIN checks := SYSTEM.ADR(pat); pat[0] := 1010H; i := 1;  REPEAT pat[i] := 0FF00FFH; INC(i) UNTIL i = 9;  REPEAT pat[i] := 0FF00FF00H INC(i) UNTIL i = 17END Checkers.

```


#### [MODULE Clipboard](https://github.com/io-core/doc/blob/main/core/System/Clipboard.md) [(source)](https://github.com/io-core/System/blob/main/Clipboard.Mod)

**Procedures:**
```
  MODULE Clipboard;  IMPORT SYSTEM, Texts, Viewers, TextFrames, Oberon;  CONST control = -24; data = -20;Copy(T: Texts.Text; beg, end: INTEGER);    VAR R: Texts.Reader;      ch: CHAR;  BEGIN    Texts.OpenReader(R, T, beg);    SYSTEM.PUT(control, end - beg);    WHILE beg < end DO      Texts.Read(R, ch);      SYSTEM.PUT(data, ch);      beg := beg + 1    END  END Copy;  PROCEDURE CopySelection*;    VAR T: Texts.Text;      beg, end, time: INTEGER;  BEGIN    Oberon.GetSelection(T, beg, end, time);    IF time >= 0 THEN Copy(T, beg, end) END  END CopySelection;  PROCEDURE CopyViewer*;    VAR V: Viewers.Viewer;      F: TextFrames.Frame;  BEGIN    V := Oberon.MarkedViewer();    IF (V # NIL) & (V.dsc # NIL) & (V.dsc.next IS TextFrames.Frame) THEN      F := V.dsc.next(TextFrames.Frame);      Copy(F.text, 0, F.text.len)    END  END CopyViewer;  PROCEDURE Paste*;    VAR W: Texts.Writer;      V: Viewers.Viewer;      F: TextFrames.Frame;      len, i: INTEGER;      ch: CHAR;  BEGIN    V := Oberon.FocusViewer;    IF (V # NIL) & (V.dsc # NIL) & (V.dsc.next IS TextFrames.Frame) THEN      SYSTEM.GET(control, len);      IF len > 0 THEN        Texts.OpenWriter(W);        FOR i := 1 TO len DO          SYSTEM.GET(data, ch);          Texts.Write(W, ch)        END;        F := V.dsc.next(TextFrames.Frame);        Texts.Insert(F.text, F.carloc.pos, W.buf);        TextFrames.SetCaret(F, F.carloc.pos + len)      END    END  END PasteEND Clipboard.

```
