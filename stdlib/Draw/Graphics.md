
## [MODULE Graphics](https://github.com/io-core/Draw/blob/main/Graphics.Mod)

Procedures:

[96](https://github.com/io-core/Draw/blob/main/Graphics.Mod#96) `  PROCEDURE New*(obj: Object);`
[100](https://github.com/io-core/Draw/blob/main/Graphics.Mod#100) `  PROCEDURE Add*(G: Graph; obj: Object);`
[105](https://github.com/io-core/Draw/blob/main/Graphics.Mod#105) `  PROCEDURE ThisObj*(G: Graph; x, y: INTEGER): Object;`
[112](https://github.com/io-core/Draw/blob/main/Graphics.Mod#112) `  PROCEDURE SelectObj*(G: Graph; obj: Object);`
[117](https://github.com/io-core/Draw/blob/main/Graphics.Mod#117) `  PROCEDURE SelectArea*(G: Graph; x0, y0, x1, y1: INTEGER);`
[131](https://github.com/io-core/Draw/blob/main/Graphics.Mod#131) `  PROCEDURE Draw*(G: Graph; VAR M: Msg);`
[137](https://github.com/io-core/Draw/blob/main/Graphics.Mod#137) `  PROCEDURE List*(G: Graph);`
[151](https://github.com/io-core/Draw/blob/main/Graphics.Mod#151) `  PROCEDURE Deselect*(G: Graph);`
[157](https://github.com/io-core/Draw/blob/main/Graphics.Mod#157) `  PROCEDURE DrawSel*(G: Graph; VAR M: Msg);`
[166](https://github.com/io-core/Draw/blob/main/Graphics.Mod#166) `  PROCEDURE Change*(G: Graph; VAR M: Msg);`
[175](https://github.com/io-core/Draw/blob/main/Graphics.Mod#175) `  PROCEDURE Move*(G: Graph; dx, dy: INTEGER);`
[216](https://github.com/io-core/Draw/blob/main/Graphics.Mod#216) `  PROCEDURE Copy*(Gs, Gd: Graph; dx, dy: INTEGER);`
[229](https://github.com/io-core/Draw/blob/main/Graphics.Mod#229) `  PROCEDURE Delete*(G: Graph);`
[245](https://github.com/io-core/Draw/blob/main/Graphics.Mod#245) `  PROCEDURE WMsg(s0, s1: ARRAY OF CHAR);`
[250](https://github.com/io-core/Draw/blob/main/Graphics.Mod#250) `  PROCEDURE InitContext(VAR C: Context);`
[255](https://github.com/io-core/Draw/blob/main/Graphics.Mod#255) `  PROCEDURE FontNo*(VAR W: Files.Rider; VAR C: Context; fnt: Fonts.Font): INTEGER;`
[266](https://github.com/io-core/Draw/blob/main/Graphics.Mod#266) `  PROCEDURE StoreElems(VAR W: Files.Rider; VAR C: Context; obj: Object);`
[282](https://github.com/io-core/Draw/blob/main/Graphics.Mod#282) `  PROCEDURE Store*(G: Graph; VAR W: Files.Rider);`
[287](https://github.com/io-core/Draw/blob/main/Graphics.Mod#287) `  PROCEDURE WriteObj*(VAR W: Files.Rider; cno: INTEGER; obj: Object);`
[292](https://github.com/io-core/Draw/blob/main/Graphics.Mod#292) `  PROCEDURE WriteFile*(G: Graph; name: ARRAY OF CHAR);`
[298](https://github.com/io-core/Draw/blob/main/Graphics.Mod#298) `  PROCEDURE Print*(G: Graph; x0, y0: INTEGER);`
[306](https://github.com/io-core/Draw/blob/main/Graphics.Mod#306) `  PROCEDURE GetClass*(module, allocator: ARRAY OF CHAR; VAR com: Modules.Command);`
[316](https://github.com/io-core/Draw/blob/main/Graphics.Mod#316) `  PROCEDURE Font*(VAR R: Files.Rider; VAR C: Context): Fonts.Font;`
[321](https://github.com/io-core/Draw/blob/main/Graphics.Mod#321) `  PROCEDURE ReadObj(VAR R: Files.Rider; obj: Object);`
[328](https://github.com/io-core/Draw/blob/main/Graphics.Mod#328) `  PROCEDURE LoadElems(VAR R: Files.Rider; VAR C: Context; VAR fobj: Object);`
[353](https://github.com/io-core/Draw/blob/main/Graphics.Mod#353) `  PROCEDURE Load*(G: Graph; VAR R: Files.Rider);`
[358](https://github.com/io-core/Draw/blob/main/Graphics.Mod#358) `  PROCEDURE Open*(G: Graph; name: ARRAY OF CHAR);`
[369](https://github.com/io-core/Draw/blob/main/Graphics.Mod#369) `  PROCEDURE SetWidth*(w: INTEGER);`
[375](https://github.com/io-core/Draw/blob/main/Graphics.Mod#375) `  PROCEDURE GetLib*(name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library);`
[407](https://github.com/io-core/Draw/blob/main/Graphics.Mod#407) `  PROCEDURE NewLib*(Lname: ARRAY OF CHAR): Library;`
[413](https://github.com/io-core/Draw/blob/main/Graphics.Mod#413) `  PROCEDURE StoreLib*(L: Library; Fname: ARRAY OF CHAR);`
[436](https://github.com/io-core/Draw/blob/main/Graphics.Mod#436) `  PROCEDURE RemoveLibraries*;`
[440](https://github.com/io-core/Draw/blob/main/Graphics.Mod#440) `  PROCEDURE ThisMac*(L: Library; Mname: ARRAY OF CHAR): MacHead;`
[447](https://github.com/io-core/Draw/blob/main/Graphics.Mod#447) `  PROCEDURE DrawMac*(mh: MacHead; VAR M: Msg);`
[455](https://github.com/io-core/Draw/blob/main/Graphics.Mod#455) `  PROCEDURE OpenMac*(mh: MacHead; G: Graph; x, y: INTEGER);`
[465](https://github.com/io-core/Draw/blob/main/Graphics.Mod#465) `  PROCEDURE MakeMac*(G: Graph; VAR head: MacHead);`
[488](https://github.com/io-core/Draw/blob/main/Graphics.Mod#488) `  PROCEDURE InsertMac*(mh: MacHead; L: Library; VAR new: BOOLEAN);`
[501](https://github.com/io-core/Draw/blob/main/Graphics.Mod#501) `  PROCEDURE NewLine;`
[506](https://github.com/io-core/Draw/blob/main/Graphics.Mod#506) `  PROCEDURE CopyLine(src, dst: Object);`
[510](https://github.com/io-core/Draw/blob/main/Graphics.Mod#510) `  PROCEDURE ChangeLine(obj: Object; VAR M: Msg);`
[522](https://github.com/io-core/Draw/blob/main/Graphics.Mod#522) `  PROCEDURE LineSelectable(obj: Object; x, y: INTEGER): BOOLEAN;`
[527](https://github.com/io-core/Draw/blob/main/Graphics.Mod#527) `  PROCEDURE ReadLine(obj: Object; VAR R: Files.Rider; VAR C: Context);`
[531](https://github.com/io-core/Draw/blob/main/Graphics.Mod#531) `  PROCEDURE WriteLine(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);`
[544](https://github.com/io-core/Draw/blob/main/Graphics.Mod#544) `  PROCEDURE NewCaption;`
[549](https://github.com/io-core/Draw/blob/main/Graphics.Mod#549) `  PROCEDURE CopyCaption(src, dst: Object);`
[560](https://github.com/io-core/Draw/blob/main/Graphics.Mod#560) `  PROCEDURE ChangeCaption(obj: Object;  VAR M: Msg);`
[579](https://github.com/io-core/Draw/blob/main/Graphics.Mod#579) `  PROCEDURE CaptionSelectable(obj: Object; x, y: INTEGER): BOOLEAN;`
[584](https://github.com/io-core/Draw/blob/main/Graphics.Mod#584) `  PROCEDURE ReadCaption(obj: Object; VAR R: Files.Rider; VAR C: Context);`
[592](https://github.com/io-core/Draw/blob/main/Graphics.Mod#592) `  PROCEDURE WriteCaption(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);`
[622](https://github.com/io-core/Draw/blob/main/Graphics.Mod#622) `  PROCEDURE NewMacro;`
[627](https://github.com/io-core/Draw/blob/main/Graphics.Mod#627) `  PROCEDURE CopyMacro(src, dst: Object);`
[632](https://github.com/io-core/Draw/blob/main/Graphics.Mod#632) `  PROCEDURE ChangeMacro(obj: Object; VAR M: Msg);`
[637](https://github.com/io-core/Draw/blob/main/Graphics.Mod#637) `  PROCEDURE MacroSelectable(obj: Object; x, y: INTEGER): BOOLEAN;`
[642](https://github.com/io-core/Draw/blob/main/Graphics.Mod#642) `  PROCEDURE ReadMacro(obj: Object; VAR R: Files.Rider; VAR C: Context);`
[648](https://github.com/io-core/Draw/blob/main/Graphics.Mod#648) `  PROCEDURE WriteMacro(obj: Object; cno: INTEGER; VAR W1: Files.Rider; VAR C: Context);`
[667](https://github.com/io-core/Draw/blob/main/Graphics.Mod#667) `  PROCEDURE Notify(T: Texts.Text; op: INTEGER; beg, end: LONGINT);`
[671](https://github.com/io-core/Draw/blob/main/Graphics.Mod#671) `  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (obj: Object; VAR msg: Msg));`
