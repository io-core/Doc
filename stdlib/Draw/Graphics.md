
## [MODULE Graphics](https://github.com/io-core/Draw/blob/main/Graphics.Mod)

Procedures:


<pre>  PROCEDURE New*(obj: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L96)


<pre>  PROCEDURE Add*(G: Graph; obj: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L100)


<pre>  PROCEDURE ThisObj*(G: Graph; x, y: INTEGER): Object;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L105)


<pre>  PROCEDURE SelectObj*(G: Graph; obj: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L112)


<pre>  PROCEDURE SelectArea*(G: Graph; x0, y0, x1, y1: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L117)


<pre>  PROCEDURE Draw*(G: Graph; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L131)


<pre>  PROCEDURE List*(G: Graph);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L137)


<pre>  PROCEDURE Deselect*(G: Graph);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L151)


<pre>  PROCEDURE DrawSel*(G: Graph; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L157)


<pre>  PROCEDURE Change*(G: Graph; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L166)


<pre>  PROCEDURE Move*(G: Graph; dx, dy: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L175)


<pre>  PROCEDURE Copy*(Gs, Gd: Graph; dx, dy: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L216)


<pre>  PROCEDURE Delete*(G: Graph);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L229)


<pre>  PROCEDURE WMsg(s0, s1: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L245)


<pre>  PROCEDURE InitContext(VAR C: Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L250)


<pre>  PROCEDURE FontNo*(VAR W: Files.Rider; VAR C: Context; fnt: Fonts.Font): INTEGER;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L255)


<pre>  PROCEDURE StoreElems(VAR W: Files.Rider; VAR C: Context; obj: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L266)


<pre>  PROCEDURE Store*(G: Graph; VAR W: Files.Rider);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L282)


<pre>  PROCEDURE WriteObj*(VAR W: Files.Rider; cno: INTEGER; obj: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L287)


<pre>  PROCEDURE WriteFile*(G: Graph; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L292)


<pre>  PROCEDURE Print*(G: Graph; x0, y0: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L298)


<pre>  PROCEDURE GetClass*(module, allocator: ARRAY OF CHAR; VAR com: Modules.Command);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L306)


<pre>  PROCEDURE Font*(VAR R: Files.Rider; VAR C: Context): Fonts.Font;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L316)


<pre>  PROCEDURE ReadObj(VAR R: Files.Rider; obj: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L321)


<pre>  PROCEDURE LoadElems(VAR R: Files.Rider; VAR C: Context; VAR fobj: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L328)


<pre>  PROCEDURE Load*(G: Graph; VAR R: Files.Rider);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L353)


<pre>  PROCEDURE Open*(G: Graph; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L358)


<pre>  PROCEDURE SetWidth*(w: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L369)


<pre>  PROCEDURE GetLib*(name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L375)


<pre>  PROCEDURE NewLib*(Lname: ARRAY OF CHAR): Library;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L407)


<pre>  PROCEDURE StoreLib*(L: Library; Fname: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L413)


<pre>  PROCEDURE RemoveLibraries*;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L436)


<pre>  PROCEDURE ThisMac*(L: Library; Mname: ARRAY OF CHAR): MacHead;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L440)


<pre>  PROCEDURE DrawMac*(mh: MacHead; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L447)


<pre>  PROCEDURE OpenMac*(mh: MacHead; G: Graph; x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L455)


<pre>  PROCEDURE MakeMac*(G: Graph; VAR head: MacHead);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L465)


<pre>  PROCEDURE InsertMac*(mh: MacHead; L: Library; VAR new: BOOLEAN);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L488)


<pre>  PROCEDURE NewLine;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L501)


<pre>  PROCEDURE CopyLine(src, dst: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L506)


<pre>  PROCEDURE ChangeLine(obj: Object; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L510)


<pre>  PROCEDURE LineSelectable(obj: Object; x, y: INTEGER): BOOLEAN;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L522)


<pre>  PROCEDURE ReadLine(obj: Object; VAR R: Files.Rider; VAR C: Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L527)


<pre>  PROCEDURE WriteLine(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L531)


<pre>  PROCEDURE NewCaption;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L544)


<pre>  PROCEDURE CopyCaption(src, dst: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L549)


<pre>  PROCEDURE ChangeCaption(obj: Object;  VAR M: Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L560)


<pre>  PROCEDURE CaptionSelectable(obj: Object; x, y: INTEGER): BOOLEAN;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L579)


<pre>  PROCEDURE ReadCaption(obj: Object; VAR R: Files.Rider; VAR C: Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L584)


<pre>  PROCEDURE WriteCaption(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L592)


<pre>  PROCEDURE NewMacro;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L622)


<pre>  PROCEDURE CopyMacro(src, dst: Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L627)


<pre>  PROCEDURE ChangeMacro(obj: Object; VAR M: Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L632)


<pre>  PROCEDURE MacroSelectable(obj: Object; x, y: INTEGER): BOOLEAN;</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L637)


<pre>  PROCEDURE ReadMacro(obj: Object; VAR R: Files.Rider; VAR C: Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L642)


<pre>  PROCEDURE WriteMacro(obj: Object; cno: INTEGER; VAR W1: Files.Rider; VAR C: Context);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L648)


<pre>  PROCEDURE Notify(T: Texts.Text; op: INTEGER; beg, end: LONGINT);</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L667)


<pre>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (obj: Object; VAR msg: Msg));</pre> [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L671)

