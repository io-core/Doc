
## [MODULE Graphics](https://github.com/io-core/Draw/blob/main/Graphics.Mod)

Procedures:


<code>  PROCEDURE New*(obj: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L96)


<code>  PROCEDURE Add*(G: Graph; obj: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L100)


<code>  PROCEDURE ThisObj*(G: Graph; x, y: INTEGER): Object;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L105)


<code>  PROCEDURE SelectObj*(G: Graph; obj: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L112)


<code>  PROCEDURE SelectArea*(G: Graph; x0, y0, x1, y1: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L117)


<code>  PROCEDURE Draw*(G: Graph; VAR M: Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L131)


<code>  PROCEDURE List*(G: Graph);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L137)


<code>  PROCEDURE Deselect*(G: Graph);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L151)


<code>  PROCEDURE DrawSel*(G: Graph; VAR M: Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L157)


<code>  PROCEDURE Change*(G: Graph; VAR M: Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L166)


<code>  PROCEDURE Move*(G: Graph; dx, dy: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L175)


<code>  PROCEDURE Copy*(Gs, Gd: Graph; dx, dy: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L216)


<code>  PROCEDURE Delete*(G: Graph);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L229)


<code>  PROCEDURE WMsg(s0, s1: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L245)


<code>  PROCEDURE InitContext(VAR C: Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L250)


<code>  PROCEDURE FontNo*(VAR W: Files.Rider; VAR C: Context; fnt: Fonts.Font): INTEGER;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L255)


<code>  PROCEDURE StoreElems(VAR W: Files.Rider; VAR C: Context; obj: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L266)


<code>  PROCEDURE Store*(G: Graph; VAR W: Files.Rider);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L282)


<code>  PROCEDURE WriteObj*(VAR W: Files.Rider; cno: INTEGER; obj: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L287)


<code>  PROCEDURE WriteFile*(G: Graph; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L292)


<code>  PROCEDURE Print*(G: Graph; x0, y0: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L298)


<code>  PROCEDURE GetClass*(module, allocator: ARRAY OF CHAR; VAR com: Modules.Command);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L306)


<code>  PROCEDURE Font*(VAR R: Files.Rider; VAR C: Context): Fonts.Font;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L316)


<code>  PROCEDURE ReadObj(VAR R: Files.Rider; obj: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L321)


<code>  PROCEDURE LoadElems(VAR R: Files.Rider; VAR C: Context; VAR fobj: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L328)


<code>  PROCEDURE Load*(G: Graph; VAR R: Files.Rider);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L353)


<code>  PROCEDURE Open*(G: Graph; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L358)


<code>  PROCEDURE SetWidth*(w: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L369)


<code>  PROCEDURE GetLib*(name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L375)


<code>  PROCEDURE NewLib*(Lname: ARRAY OF CHAR): Library;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L407)


<code>  PROCEDURE StoreLib*(L: Library; Fname: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L413)


<code>  PROCEDURE RemoveLibraries*;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L436)


<code>  PROCEDURE ThisMac*(L: Library; Mname: ARRAY OF CHAR): MacHead;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L440)


<code>  PROCEDURE DrawMac*(mh: MacHead; VAR M: Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L447)


<code>  PROCEDURE OpenMac*(mh: MacHead; G: Graph; x, y: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L455)


<code>  PROCEDURE MakeMac*(G: Graph; VAR head: MacHead);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L465)


<code>  PROCEDURE InsertMac*(mh: MacHead; L: Library; VAR new: BOOLEAN);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L488)


<code>  PROCEDURE NewLine;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L501)


<code>  PROCEDURE CopyLine(src, dst: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L506)


<code>  PROCEDURE ChangeLine(obj: Object; VAR M: Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L510)


<code>  PROCEDURE LineSelectable(obj: Object; x, y: INTEGER): BOOLEAN;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L522)


<code>  PROCEDURE ReadLine(obj: Object; VAR R: Files.Rider; VAR C: Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L527)


<code>  PROCEDURE WriteLine(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L531)


<code>  PROCEDURE NewCaption;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L544)


<code>  PROCEDURE CopyCaption(src, dst: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L549)


<code>  PROCEDURE ChangeCaption(obj: Object;  VAR M: Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L560)


<code>  PROCEDURE CaptionSelectable(obj: Object; x, y: INTEGER): BOOLEAN;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L579)


<code>  PROCEDURE ReadCaption(obj: Object; VAR R: Files.Rider; VAR C: Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L584)


<code>  PROCEDURE WriteCaption(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L592)


<code>  PROCEDURE NewMacro;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L622)


<code>  PROCEDURE CopyMacro(src, dst: Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L627)


<code>  PROCEDURE ChangeMacro(obj: Object; VAR M: Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L632)


<code>  PROCEDURE MacroSelectable(obj: Object; x, y: INTEGER): BOOLEAN;</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L637)


<code>  PROCEDURE ReadMacro(obj: Object; VAR R: Files.Rider; VAR C: Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L642)


<code>  PROCEDURE WriteMacro(obj: Object; cno: INTEGER; VAR W1: Files.Rider; VAR C: Context);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L648)


<code>  PROCEDURE Notify(T: Texts.Text; op: INTEGER; beg, end: LONGINT);</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L667)


<code>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (obj: Object; VAR msg: Msg));</code> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L671)

