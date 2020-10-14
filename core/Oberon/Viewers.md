
## [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)

Procedures:

```
[42](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#42)    PROCEDURE ThisViewer* (D: DisplayArea; X, Y: INTEGER): Viewer;
```
```
[55](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#55)    PROCEDURE This* (X, Y: INTEGER): Viewer;  (*for backward compatibility*)
```
```
[62](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#62)    PROCEDURE ThisDisplay* (V: Viewer): DisplayArea;
```
```
[68](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#68)    PROCEDURE Next* (V: Viewer): Viewer;
```
```
[74](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#74)    PROCEDURE Prev* (V: Viewer): Viewer;
```
```
[78](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#78)    PROCEDURE SetFocus* (D: DisplayArea; V: Viewer);
```
```
[83](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#83)    PROCEDURE GetFocus* (D: DisplayArea): Viewer;
```
```
[87](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#87)    PROCEDURE Adjust* (F: Display.Frame; id, Y, H: INTEGER);
```
```
[92](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#92)    PROCEDURE Open* (D: DisplayArea; V: Viewer; X, Y: INTEGER);
```
```
[115](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#115)    PROCEDURE Validate* (V: Viewer; VAR Y, H: INTEGER);
```
```
[131](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#131)    PROCEDURE Change* (V: Viewer; Y, H: INTEGER);
```
```
[170](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#170)    PROCEDURE Spread* (D: DisplayArea; X, W: INTEGER); (*redistribute viewers vertically*)
```
```
[192](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#192)    PROCEDURE RestoreTrack (S: Display.Frame);
```
```
[204](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#204)    PROCEDURE Close* (V: Viewer);
```
```
[224](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#224)    PROCEDURE Recall* (D: DisplayArea; VAR V: Viewer); (*last closed viewer*)
```
```
[228](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#228)    PROCEDURE Flush* (D: DisplayArea); (*last closed viewer*)
```
```
[232](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#232)    PROCEDURE Locate* (D: DisplayArea; X, H: INTEGER; VAR fil, top, bot, alt, max: Display.Frame);
```
```
[255](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#255)    PROCEDURE Install* (parent, F: Display.Frame); (*frame F as a subframe into parent frame*)
```
```
[265](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#265)    PROCEDURE Remove* (parent, F: Display.Frame); (*subframe F from its parent frame*)
```
```
[275](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#275)    PROCEDURE InitFiller (X, Y, W, H, minH: INTEGER; Filler: Viewer); (*except fields handle, parent, dsc*)
```
```
[280](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#280)    PROCEDURE InitTrack* (D: DisplayArea; W, H: INTEGER; Filler: Viewer);
```
```
[292](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#292)    PROCEDURE OpenTrack* (D: DisplayArea; X, W: INTEGER; Filler: Viewer);
```
```
[313](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#313)    PROCEDURE CloseTrack* (D: DisplayArea; X: INTEGER);
```
```
[330](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#330)    PROCEDURE Broadcast* (VAR M: Display.FrameMsg); (*to current display*)
```
```
[343](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#343)    PROCEDURE InitDisplay* (D: DisplayArea; W, H: INTEGER; name: ARRAY OF CHAR);
```
```
[355](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#355)    PROCEDURE SetDisplay* (D: DisplayArea);
```
```
[362](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#362)    PROCEDURE GetDisplay* (id: INTEGER): DisplayArea;
```
```
[369](https://github.com/io-core/Oberon/blob/main/Viewers.Mod#369)    PROCEDURE CloseDisplay* (D: DisplayArea; hint: INTEGER); (*except last display*)
```
