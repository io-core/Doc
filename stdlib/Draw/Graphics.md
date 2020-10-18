
## [MODULE Graphics](https://github.com/io-core/Draw/blob/main/Graphics.Mod)

  ## Imports:
` SYSTEM Files Modules Input Fonts (*Printer*) Texts Oberon`

## Constants:
```
 NameLen* = 32; GraphFileId = 0FAX; LibFileId = 0FBX;
    TAB = Input.TAB; CR = Input.CR;

```
## Types:
```

    Graph* = POINTER TO GraphDesc;
    Object* = POINTER TO ObjectDesc;
    Method* = POINTER TO MethodDesc;

    Line* = POINTER TO LineDesc;
    Caption* = POINTER TO CaptionDesc;
    Macro* = POINTER TO MacroDesc;

    ObjectDesc* = RECORD
        x*, y*, w*, h*: INTEGER;
        col*: BYTE;
        selected*, marked*: BOOLEAN;
        do*: Method;
        next: Object
      END ;

    Msg* = RECORD END ;
    WidMsg* = RECORD (Msg) w*: INTEGER END ;
    ColorMsg* = RECORD (Msg) col*: INTEGER END ;
    FontMsg* = RECORD (Msg) fnt*: Fonts.Font END ;
    Name* = ARRAY NameLen OF CHAR;

    GraphDesc* = RECORD
        time*: LONGINT;
        sel*, first: Object;
        changed*: BOOLEAN
      END ;

    MacHead* = POINTER TO MacHeadDesc;
    MacExt* = POINTER TO MacExtDesc;
    Library* = POINTER TO LibraryDesc;

    MacHeadDesc* = RECORD
        name*: Name;
        w*, h*: INTEGER;
        ext*: MacExt;
        lib*: Library;
        first: Object;
        next: MacHead
      END ;

    LibraryDesc* = RECORD
        name*: Name;
        first: MacHead;
        next: Library
      END ;

    MacExtDesc* = RECORD END ;

    Context* = RECORD
        nofonts, noflibs, nofclasses: INTEGER;
        font: ARRAY 10 OF Fonts.Font;
        lib: ARRAY 4 OF Library;
        class: ARRAY 6 OF Modules.Command
      END;

    MethodDesc* = RECORD
        module*, allocator*: Name;
        new*: Modules.Command;
        copy*: PROCEDURE (from, to: Object);
        draw*, change*: PROCEDURE (obj: Object; VAR msg: Msg);
        selectable*: PROCEDURE (obj: Object; x, y: INTEGER): BOOLEAN;
        read*: PROCEDURE (obj: Object; VAR R: Files.Rider; VAR C: Context);
        write*: PROCEDURE (obj: Object; cno: INTEGER; VAR R: Files.Rider; VAR C: Context);
        print*: PROCEDURE (obj: Object; x, y: INTEGER)
      END ;

    LineDesc* = RECORD (ObjectDesc)
        unused*: INTEGER
      END ;

    CaptionDesc* = RECORD (ObjectDesc)
        pos*, len*: INTEGER
      END ;

    MacroDesc* = RECORD (ObjectDesc)
        mac*: MacHead
      END ;

```
## Variables:
```
 width*, res*: INTEGER;
    new: Object;
    T*: Texts.Text;  (*captions*)
    LineMethod*, CapMethod*, MacMethod* : Method;
    GetLib0: PROCEDURE (name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library);

```
## Procedures:
---

`  PROCEDURE New*(obj: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L96)


`  PROCEDURE Add*(G: Graph; obj: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L100)


`  PROCEDURE ThisObj*(G: Graph; x, y: INTEGER): Object;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L105)


`  PROCEDURE SelectObj*(G: Graph; obj: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L112)


`  PROCEDURE SelectArea*(G: Graph; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L117)


`  PROCEDURE Draw*(G: Graph; VAR M: Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L131)


`  PROCEDURE List*(G: Graph);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L137)


`  PROCEDURE Deselect*(G: Graph);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L151)


`  PROCEDURE DrawSel*(G: Graph; VAR M: Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L157)


`  PROCEDURE Change*(G: Graph; VAR M: Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L166)


`  PROCEDURE Move*(G: Graph; dx, dy: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L175)


`  PROCEDURE Copy*(Gs, Gd: Graph; dx, dy: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L216)


`  PROCEDURE Delete*(G: Graph);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L229)


`  PROCEDURE WMsg(s0, s1: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L245)


`  PROCEDURE InitContext(VAR C: Context);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L250)


`  PROCEDURE FontNo*(VAR W: Files.Rider; VAR C: Context; fnt: Fonts.Font): INTEGER;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L255)


`  PROCEDURE StoreElems(VAR W: Files.Rider; VAR C: Context; obj: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L266)


`  PROCEDURE Store*(G: Graph; VAR W: Files.Rider);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L282)


`  PROCEDURE WriteObj*(VAR W: Files.Rider; cno: INTEGER; obj: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L287)


`  PROCEDURE WriteFile*(G: Graph; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L292)


`  PROCEDURE Print*(G: Graph; x0, y0: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L298)


`  PROCEDURE GetClass*(module, allocator: ARRAY OF CHAR; VAR com: Modules.Command);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L306)


`  PROCEDURE Font*(VAR R: Files.Rider; VAR C: Context): Fonts.Font;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L316)


`  PROCEDURE ReadObj(VAR R: Files.Rider; obj: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L321)


`  PROCEDURE LoadElems(VAR R: Files.Rider; VAR C: Context; VAR fobj: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L328)


`  PROCEDURE Load*(G: Graph; VAR R: Files.Rider);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L353)


`  PROCEDURE Open*(G: Graph; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L358)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L369)


`  PROCEDURE GetLib*(name: ARRAY OF CHAR; replace: BOOLEAN; VAR Lib: Library);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L375)


`  PROCEDURE NewLib*(Lname: ARRAY OF CHAR): Library;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L407)


`  PROCEDURE StoreLib*(L: Library; Fname: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L413)


`  PROCEDURE RemoveLibraries*;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L436)


`  PROCEDURE ThisMac*(L: Library; Mname: ARRAY OF CHAR): MacHead;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L440)


`  PROCEDURE DrawMac*(mh: MacHead; VAR M: Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L447)


`  PROCEDURE OpenMac*(mh: MacHead; G: Graph; x, y: INTEGER);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L455)


`  PROCEDURE MakeMac*(G: Graph; VAR head: MacHead);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L465)


`  PROCEDURE InsertMac*(mh: MacHead; L: Library; VAR new: BOOLEAN);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L488)


`  PROCEDURE NewLine;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L501)


`  PROCEDURE CopyLine(src, dst: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L506)


`  PROCEDURE ChangeLine(obj: Object; VAR M: Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L510)


`  PROCEDURE LineSelectable(obj: Object; x, y: INTEGER): BOOLEAN;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L522)


`  PROCEDURE ReadLine(obj: Object; VAR R: Files.Rider; VAR C: Context);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L527)


`  PROCEDURE WriteLine(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L531)


`  PROCEDURE NewCaption;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L544)


`  PROCEDURE CopyCaption(src, dst: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L549)


`  PROCEDURE ChangeCaption(obj: Object;  VAR M: Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L560)


`  PROCEDURE CaptionSelectable(obj: Object; x, y: INTEGER): BOOLEAN;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L579)


`  PROCEDURE ReadCaption(obj: Object; VAR R: Files.Rider; VAR C: Context);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L584)


`  PROCEDURE WriteCaption(obj: Object; cno: INTEGER; VAR W: Files.Rider; VAR C: Context);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L592)


`  PROCEDURE NewMacro;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L622)


`  PROCEDURE CopyMacro(src, dst: Object);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L627)


`  PROCEDURE ChangeMacro(obj: Object; VAR M: Msg);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L632)


`  PROCEDURE MacroSelectable(obj: Object; x, y: INTEGER): BOOLEAN;` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L637)


`  PROCEDURE ReadMacro(obj: Object; VAR R: Files.Rider; VAR C: Context);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L642)


`  PROCEDURE WriteMacro(obj: Object; cno: INTEGER; VAR W1: Files.Rider; VAR C: Context);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L648)


`  PROCEDURE Notify(T: Texts.Text; op: INTEGER; beg, end: LONGINT);` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L667)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (obj: Object; VAR msg: Msg));` [(source)](https://github.com/io-core/Draw/blob/main/Graphics.Mod#L671)

