
## [MODULE Graphics](https://github.com/io-core/Draw/blob/main/Graphics.Mod)

Procedures:


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L96) `  PROCEDURE New*(obj: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L100) `  PROCEDURE Add*(G: Graph; obj: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L105) `  PROCEDURE ThisObj*(G: Graph; x, y: INTEGER): Object;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L112) `  PROCEDURE SelectObj*(G: Graph; obj: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L117) `  PROCEDURE SelectArea*(G: Graph; x0, y0, x1, y1: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L131) `  PROCEDURE Draw*(G: Graph; VAR M: Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L137) `  PROCEDURE List*(G: Graph);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L151) `  PROCEDURE Deselect*(G: Graph);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L157) `  PROCEDURE DrawSel*(G: Graph; VAR M: Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L166) `  PROCEDURE Change*(G: Graph; VAR M: Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L175) `  PROCEDURE Move*(G: Graph; dx, dy: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L216) `  PROCEDURE Copy*(Gs, Gd: Graph; dx, dy: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L229) `  PROCEDURE Delete*(G: Graph);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L245) `  PROCEDURE WMsg(s0, s1: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L250) `  PROCEDURE InitContext(VAR C: Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L255) `  PROCEDURE FontNo*(VAR W: Files.Rider; VAR C: Context; fnt: Fonts.Font): INTEGER;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L266) `  PROCEDURE StoreElems(VAR W: Files.Rider; VAR C: Context; obj: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L282) `  PROCEDURE Store*(G: Graph; VAR W: Files.Rider);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L287) `  PROCEDURE WriteObj*(VAR W: Files.Rider; cno: INTEGER; obj: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L292) `  PROCEDURE WriteFile*(G: Graph; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L298) `  PROCEDURE Print*(G: Graph; x0, y0: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L306) `  PROCEDURE GetClass*(module, allocator: ARRAY OF CHAR; VAR com: Modules.Command);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L316) `  PROCEDURE Font*(VAR R: Files.Rider; VAR C: Context): Fonts.Font;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L321) `  PROCEDURE ReadObj(VAR R: Files.Rider; obj: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L328) `  PROCEDURE LoadElems(VAR R: Files.Rider; VAR C: Context; VAR fobj: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L353) `  PROCEDURE Load*(G: Graph; VAR R: Files.Rider);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L358) `  PROCEDURE Open*(G: Graph; name: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L369) `  PROCEDURE SetWidth*(w: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L375) `  PROCEDURE GetLib*(name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L407) `  PROCEDURE NewLib*(Lname: ARRAY OF CHAR): Library;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L413) `  PROCEDURE StoreLib*(L: Library; Fname: ARRAY OF CHAR);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L436) `  PROCEDURE RemoveLibraries*;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L440) `  PROCEDURE ThisMac*(L: Library; Mname: ARRAY OF CHAR): MacHead;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L447) `  PROCEDURE DrawMac*(mh: MacHead; VAR M: Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L455) `  PROCEDURE OpenMac*(mh: MacHead; G: Graph; x, y: INTEGER);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L465) `  PROCEDURE MakeMac*(G: Graph; VAR head: MacHead);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L488) `  PROCEDURE InsertMac*(mh: MacHead; L: Library; VAR new: BOOLEAN);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L501) `  PROCEDURE NewLine;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L506) `  PROCEDURE CopyLine(src, dst: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L510) `  PROCEDURE ChangeLine(obj: Object; VAR M: Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L522) `  PROCEDURE LineSelectable(obj: Object; x, y: INTEGER): BOOLEAN;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L527) `  PROCEDURE ReadLine(obj: Object; VAR R: Files.Rider; VAR C: Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L531) `  PROCEDURE WriteLine(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L544) `  PROCEDURE NewCaption;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L549) `  PROCEDURE CopyCaption(src, dst: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L560) `  PROCEDURE ChangeCaption(obj: Object;  VAR M: Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L579) `  PROCEDURE CaptionSelectable(obj: Object; x, y: INTEGER): BOOLEAN;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L584) `  PROCEDURE ReadCaption(obj: Object; VAR R: Files.Rider; VAR C: Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L592) `  PROCEDURE WriteCaption(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L622) `  PROCEDURE NewMacro;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L627) `  PROCEDURE CopyMacro(src, dst: Object);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L632) `  PROCEDURE ChangeMacro(obj: Object; VAR M: Msg);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L637) `  PROCEDURE MacroSelectable(obj: Object; x, y: INTEGER): BOOLEAN;`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L642) `  PROCEDURE ReadMacro(obj: Object; VAR R: Files.Rider; VAR C: Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L648) `  PROCEDURE WriteMacro(obj: Object; cno: INTEGER; VAR W1: Files.Rider; VAR C: Context);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L667) `  PROCEDURE Notify(T: Texts.Text; op: INTEGER; beg, end: LONGINT);`


[(src)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L671) `  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (obj: Object; VAR msg: Msg));`

