
## [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)

(JG 14.9.90 / NW 15.9.13 / AP 13.2.20 Extended Oberon)

**Viewers** introduces the core functionality for graphical interaction in Oberon.

Viewers operate on Frames, which are the arrangeable components of User interaction in Oberon.

Viewers coordinate via messages. Extensions of `Viewer` will extend `ViewerMsg` for corresponding functionaltiy.

Extensions of `Viewer` inherit the basic UI functionaltiy declared in this module, including the creation, expansion, closure, focus tracking, etc. of viewers.


  ## Imports:
` Display`

## Constants:
```
 
    restore* = 0; modify* = 1; suspend* = 2; (*message ids*)
    inf = 65535; DnLength* = 32;

```
## Types:
```
 
    Viewer* = POINTER TO ViewerDesc;
    ViewerDesc* = RECORD (Display.FrameDesc) prev, parent: Viewer;
      minH*, state*: INTEGER
    END;

    (*state > 1: displayed; state = 1: filler; state = 0: closed; state = -1: track or suspended filler; state < -1: suspended*)

    ViewerMsg* = RECORD (Display.FrameMsg)
      id*: INTEGER;                      (*restore, modify, suspend*)
      X*, Y*, W*, H*: INTEGER;
      state*: INTEGER
    END;

    Track = POINTER TO TrackDesc;
    TrackDesc = RECORD (ViewerDesc) under: Display.Frame END;

    DisplayArea* = POINTER TO DisplayDesc;  (*logical display area*)
    DisplayDesc* = RECORD (ViewerDesc)
      curW*, id*: INTEGER;
      name*: ARRAY DnLength OF CHAR;
      focus, (*focus viewer*)
      backup: Viewer (*last closed viewer*)
    END;

```
## Variables:
```
 
    CurDisplay*, root*: DisplayArea;
    FocusViewer*: Viewer;
    nextId: INTEGER;

```
## Procedures:
---
## ---------- Oberon Message Handling
---
**ThisViewer** finds the viewer containing the point represented by D, X, and Y.

`  PROCEDURE ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L63)

---
**This** passes the current display to ThisViewer to locate the viewer that contains a point.

`  PROCEDURE This* (X, Y: INTEGER): Viewer;  (*for backward compatibility*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L80)

---
**ThisDisplay** finds the DisplayArea of a Viewer.

`  PROCEDURE ThisDisplay* (V: Viewer): DisplayArea;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L91)

---
**Next** cycles through the defined DisplayAreas 

`  PROCEDURE Next* (V: Viewer): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L101)

---
**Prev** cycles (backwards) through the defined DisplayAreas.

`  PROCEDURE Prev* (V: Viewer): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L111)

---
**SetFocus** assigns the focus (`FocusViewer` global variable) to the `Viewer` parameter. 

`  PROCEDURE SetFocus* (D: DisplayArea; V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L119)

---
**GetFocus** returns the Viewer in a DisplayArea that has the focus. 

`  PROCEDURE GetFocus* (D: DisplayArea): Viewer;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L128)

---
**Adjust** sends a message to the Frame to handle the adjustment of its vertical position and extent.

`  PROCEDURE Adjust* (F: Display.Frame; id, Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L136)

---
**Open** prepares a new frame, adjusting other affected viewers via messages.

`  PROCEDURE Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L145)

---
**Validate** ensures correct viewer state. 

`  PROCEDURE Validate* (V: Viewer; VAR Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L172)

---
**Change** adjusts a viewer. 

`  PROCEDURE Change* (V: Viewer; Y, H: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L192)

---
**Spread** redistributes viewers vertically. 

`  PROCEDURE Spread* (D: DisplayArea; X, W: INTEGER); (*redistribute viewers vertically*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L235)

---
**RestoreTrack** returns a track to its previous arrangement. 

`  PROCEDURE RestoreTrack (S: Display.Frame);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L261)

---
**Close** removes a viewer from a track.

`  PROCEDURE Close* (V: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L277)

---
**Recall** brings back the last closed viewer.

`  PROCEDURE Recall* (D: DisplayArea; VAR V: Viewer); (*last closed viewer*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L301)

---
**Flush** permanently removes the last closed viewer. 

`  PROCEDURE Flush* (D: DisplayArea); (*last closed viewer*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L309)

---
**Locate** determines the context of a viewer

`  PROCEDURE Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L317)

---
**Install** places frame F as a subframe into parent frame

`  PROCEDURE Install* (parent, F: Display.Frame); (*frame F as a subframe into parent frame*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L344)

---
**Remove** takes subframe F from its parent frame

`  PROCEDURE Remove* (parent, F: Display.Frame); (*subframe F from its parent frame*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L358)

---
**InitFiller** initializes filler values.

`  PROCEDURE InitFiller (X, Y, W, H, minH: INTEGER; Filler: Viewer); (*except fields handle, parent, dsc*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L372)

---
**InitTrack** initializes a track.

`  PROCEDURE InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L381)

---
**OpenTrack** opens a track. 

`  PROCEDURE OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L397)

---
**CloseTrack** closes a track. 

`  PROCEDURE CloseTrack* (D: DisplayArea; X: INTEGER);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L422)

---
**Broadcast** sends a message to all viewers in the current display

`  PROCEDURE Broadcast* (VAR M: Display.FrameMsg); (*to current display*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L443)

---
**InitDisplay** prepares a display for use. 

`  PROCEDURE InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L460)

---
**SetDisplay** suspends the current display via a broadcast message and activates the chosen display via another broadcast message.

`  PROCEDURE SetDisplay* (D: DisplayArea);` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L476)

---
**GetDisplay** determines the current display.

`  PROCEDURE GetDisplay* (id: INTEGER): DisplayArea;` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L487)

---
**CloseDisplay** closes a display if it is not the last display.

`  PROCEDURE CloseDisplay* (D: DisplayArea; hint: INTEGER); (*except last display*)` [(source)](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#L498)

---
**The initialzation code for this module** merely sets the `root`, `CurDisplay` and `FocusViewer` module variables to `NIL` and the `nextID` module variable to `0`.

