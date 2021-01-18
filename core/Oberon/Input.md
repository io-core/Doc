
## [MODULE Input](https://github.com/io-core/Oberon/blob/main/Input.Mod)

(NW 5.10.86 / 15.11.90 Ceres-2; PDR 21.4.12 / NW 15.5.2013 Ceres-4 / PDW 19.4.2016)

**Input** is the interface to the keyboard and mouse in Oberon.


  ## Imports:
` SYSTEM`

## Constants:
```
 
    msAdr = -40; kbdAdr = -36;
   (*ascii codes   NUL* = 0X; BS* = 08X; TAB* = 09X; LF* = 0AX; CR* = 0DX; SUB* = 1AX; ESC* = 1BX; SPC* = 20X; DEL* = 7FX; *)
   (*text control   CtrlA* = 1X; CtrlC* = 03X; CtrlV* = 16X; CtrlX* = 18X;                                                 *)
   (*cursor keys   CursorLeft* = 11X; CursorRight* = 12X; CursorUp* = 13X; CursorDown* = 14X;                              *)

```
## Types:
```


```
## Variables:
```
 
    kbdCode, extCode: BYTE; (*last keyboard code read*)
    Recd, Up, Shift, Ctrl, Ext: BOOLEAN;
    KTabAdr: INTEGER;  (*keyboard code translation table*)
    MW, MH, MX, MY: INTEGER; (*mouse limits and coords*)
    MK: SET; (*mouse keys*)

```
## Procedures:
---
## ---------- Keyboard
---
**Peek** checks to see if a key has been pressed or released.

`  PROCEDURE Peek();` [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod#L43)

---
**Available** returns the available keypress.

`  PROCEDURE Available*(): INTEGER;` [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod#L65)

---  
**ReadUnicode** delivers unicode values of pressed keys.

`  PROCEDURE ReadUnicode*(VAR codepoint: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod#L74)

## ---------- Mouse
---  
**Mouse** provides the curent position and button state of the mouse.

`  PROCEDURE Mouse*(VAR keys: SET; VAR x, y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod#L112)

---  
**SetMouseLimits** restricts the mouse to the extent of the screen.

`  PROCEDURE SetMouseLimits*(w, h: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod#L125)

## ---------- Initialization
---
**Init** sets the keyboard initial state and populates the scancode to ascii table.

`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Oberon/blob/main/Input.Mod#L138)

