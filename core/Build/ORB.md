
## [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)

  ## Imports:
` Files ORS`

  ## Constants:
```
 versionkey* = 1; maxTypTab = 64; C20 = 100000H;
    (* class values*) Head* = 0;
      Const* = 1; Var* = 2; Par* = 3; Fld* = 4; Typ* = 5;
      SProc* = 6; SFunc* = 7; Mod* = 8;

    (* form values*)
      Byte* = 1; Bool* = 2; Char* = 3; Int* = 4; Real* = 5; Set* = 6;
      Pointer* = 7; Interface* = 8; NilTyp* = 9; NoTyp* = 10; Proc* = 11;
      String* = 12; Array* = 13; Record* = 14; TProc* = 15;
      Ptrs* = {Pointer, Interface, NilTyp}; Procs* = {Proc, NoTyp};

```
  ## Types:
```
 Object* = POINTER TO ObjDesc;
    Module* = POINTER TO ModDesc;
    Type* = POINTER TO TypeDesc;

    ObjDesc*= RECORD
      class*, exno*: BYTE;
      expo*, rdo*: BOOLEAN;  (*exported / read-only*)
      lev*: INTEGER;
      next*, dsc*: Object;
      type*: Type;
      name*: ORS.Ident;
      val*: LONGINT
    END ;

    ModDesc* = RECORD (ObjDesc) orgname*: ORS.Ident END ;

    TypeDesc* = RECORD
      form*, ref*, mno*: INTEGER;  (*ref is only used for import/export*)
      nofpar*: INTEGER;  (*for procedures, extension level for records*)
      len*: LONGINT;  (*for arrays, len < 0 => open array; for records: adr of descriptor*)
      dsc*, typobj*: Object;
      base*: Type;  (*for arrays, records, pointers*)
      size*: LONGINT;  (*in bytes; always multiple of 4, except for Byte, Bool and Char*)
    END ;

  (* Object classes and the meaning of "val":
    class    val
    ----------
    Var      address
    Par      address
    Const    value
    Fld      offset
    Typ      type descriptor (TD) address
    SProc    inline code number
    SFunc    inline code number
    Mod      key

  Type forms and the meaning of "dsc" and "base":
    form     dsc      base
    ------------------------
    Pointer  -        type of dereferenced object
    Proc     params   result type
    Array    -        type of elements
    Record   fields   extension *)

```
  ## Variables:
```
 topScope*, universe, system*: Object;
    byteType*, boolType*, charType*: Type;
    intType*, realType*, setType*, nilType*, noType*, strType*: Type;
    nofmod, Ref: INTEGER;
    typtab: ARRAY maxTypTab OF Type;
  PROCEDURE NewObj*(## Variables:
```
 obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)
    ## Variables:
```
 new, x: Object;
    ## Variables:
```
 new, x: Object;
  BEGIN x := topScope;
    WHILE (x.next # NIL) & (x.next.name # id) DO x := x.next END ;
    IF x.next = NIL THEN
      NEW(new); new.name := id; new.class := class; new.next := NIL; new.rdo := FALSE; new.dsc := NIL;
      x.next := new; obj := new
    ELSE obj := x.next; ORS.Mark("mult def")
    END
  END NewObj;
    ## Variables:
```
 s, x: Object;
  BEGIN s := topScope;
    REPEAT x := s.next;
      WHILE (x # NIL) & (x.name # ORS.id) DO x := x.next END ;
      s := s.dsc
    UNTIL (x # NIL) OR (s = NIL);
    RETURN x
  END thisObj;
    ## Variables:
```
 obj: Object;
  BEGIN
    IF mod.rdo THEN
      IF mod.name[0] # 0X THEN
        obj := mod.dsc;
        WHILE (obj # NIL) & (obj.name # ORS.id) DO obj := obj.next END
      ELSE obj := NIL
      END
    ELSE obj := NIL
    END ;
    RETURN obj
  END thisimport;
    ## Variables:
```
 fld: Object;
  BEGIN fld := rec.dsc;
    WHILE (fld # NIL) & (fld.name # ORS.id) DO fld := fld.next END ;
    RETURN fld
  END thisfield;
    ## Variables:
```
 fld, bot: Object;
  BEGIN fld := rec.dsc;
    IF rec.base # NIL THEN bot := rec.base.dsc ELSE bot := NIL END ;
    WHILE (fld # bot) & (fld.name # id) DO fld := fld.next END ;
    IF fld = bot THEN fld := NIL END ;
    RETURN fld
  END FindFld;
    ## Variables:
```
 fld: Object; max: INTEGER;
  BEGIN fld := rec.dsc; max := -1;
    WHILE fld # NIL DO
      IF (fld.class = Const) & (fld.lev > max) THEN max := fld.lev END ;
      fld := fld.next
    END ;
    RETURN max + 1
  END NofMethods;
  PROCEDURE NewMethod*(rec: Type; ## Variables:
```
 mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)
    ## Variables:
```
 fld, fld0, new, bot: Object;
    ## Variables:
```
 fld, fld0, new, bot: Object;
      ## Variables:
```
 obj, fld: Object;
    BEGIN
     IF rec.typobj # NIL THEN
      obj := rec.typobj.next;
      WHILE obj # NIL DO
        IF (obj.class = Typ) & (obj.type.form = Record) & (obj.type.base = rec) THEN
          IF obj.type.dsc = bot THEN obj.type.dsc := new; UpdateLinks(obj.type, new, bot)
          ELSE fld := obj.type.dsc;
            WHILE fld.next # bot DO fld := fld.next END ;
            fld.next := new
          END
        END ;
        obj := obj.next
      END
     END
    END UpdateLinks;
    ## Variables:
```
 s: Object;
  BEGIN NEW(s); s.class := Head; s.dsc := topScope; s.next := NIL; topScope := s
  END OpenScope;
  PROCEDURE MakeFileName*(## Variables:
```
 FName: ORS.Ident; name, ext: ARRAY OF CHAR);
    ## Variables:
```
 i, j: INTEGER;
    ## Variables:
```
 i, j: INTEGER;
  BEGIN i := 0; j := 0;  (*assume name suffix less than 4 characters*)
    WHILE (i < ORS.IdLen-5) & (name[i] > 0X) DO FName[i] := name[i]; INC(i) END ;
    REPEAT FName[i]:= ext[j]; INC(i); INC(j) UNTIL ext[j] = 0X;
    FName[i] := 0X
  END MakeFileName;
    ## Variables:
```
 mod: Module; obj, obj1: Object;
  BEGIN obj1 := topScope; obj := obj1.next;  (*search for module*)
    WHILE (obj # NIL) & (obj(Module).orgname # orgname) DO obj1 := obj; obj := obj1.next END ;
    IF obj = NIL THEN  (*new module, search for alias*)
      obj := topScope.next;
      WHILE (obj # NIL) & (obj.name # name) DO obj := obj.next END ;
      IF obj = NIL THEN (*insert new module*)
        NEW(mod); mod.class := Mod; mod.rdo := FALSE;
        mod.name := name; mod.orgname := orgname; mod.val := key;
        mod.lev := nofmod; INC(nofmod); mod.type := noType; mod.dsc := NIL; mod.next := NIL;
        obj1.next := mod; obj := mod
      ELSIF decl THEN
        IF obj.rdo THEN ORS.Mark("mult def") ELSE ORS.Mark("conflict with re-import") END
      ELSE ORS.Mark("conflict with alias")
      END
    ELSIF decl THEN (*module already present, explicit import by declaration*)
      IF obj.rdo THEN ORS.Mark("mult def") ELSE ORS.Mark("invalid import order") END
    END ;
    RETURN obj
  END ThisModule;
  PROCEDURE Read(## Variables:
```
 R: Files.Rider; ## Variables:
```
 x: INTEGER);
    ## Variables:
```
 b: BYTE;
    ## Variables:
```
 b: BYTE;
  BEGIN Files.ReadByte(R, b);
    IF b < 80H THEN x := b ELSE x := b - 100H END
  END Read;
  
  PROCEDURE InType(## Variables:
```
 R: Files.Rider; thismod: Object; ## Variables:
```
 T: Type);
  PROCEDURE InType(## Variables:
```
 R: Files.Rider; thismod: Object; ## Variables:
```
 T: Type);
    ## Variables:
```
 key: LONGINT;
    ## Variables:
```
 key: LONGINT;
      ref, class, form, np, readonly: INTEGER;
      fld, par, obj, mod, last: Object;
      t: Type;
      name, modname: ORS.Ident;
  BEGIN Read(R, ref);
    IF ref < 0 THEN T := typtab[-ref]  (*already read*)
    ELSE NEW(t); T := t; typtab[ref] := t; t.mno := thismod.lev;
      Read(R, form); t.form := form;
      IF form = Pointer THEN InType(R, thismod, t.base); t.size := 4
      ELSIF form = Array THEN
        InType(R, thismod, t.base); Files.ReadNum(R, t.len); Files.ReadNum(R, t.size)
      ELSIF form = Record THEN
        InType(R, thismod, t.base);
        IF t.base.form = NoTyp THEN t.base := NIL; obj := NIL ELSE obj := t.base.dsc END ;
        Files.ReadNum(R, t.len);  (*TD adr/exno*)
        Files.ReadNum(R, t.nofpar);  (*ext level*)
        Files.ReadNum(R, t.size);
        Read(R, class); last := NIL;
        WHILE class # 0 DO  (*fields*)
          NEW(fld); fld.class := class; Files.ReadString(R, fld.name);
          IF last = NIL THEN t.dsc := fld ELSE last.next := fld END ;
          last := fld;
          IF fld.name[0] # 0X THEN fld.expo := TRUE; InType(R, thismod, fld.type); Files.ReadNum(R, fld.val)
          ELSE (*hidden*) fld.expo := FALSE;
            IF class = Const THEN (*type-bound procedure*) fld.type := byteType  (*method*)
            ELSE Files.ReadNum(R, fld.val);
              IF fld.val < 0 THEN fld.val := -fld.val-1; fld.type := noType  (*procedure*)
              ELSE fld.type := nilType  (*pointer*)
              END
            END
          END ;
          IF class = Const THEN Files.ReadNum(R, fld.lev) END ;  (*mthno*)
          Read(R, class)
        END ;
        IF last = NIL THEN t.dsc := obj ELSE last.next := obj END
      ELSIF form IN {Proc, TProc} THEN
        InType(R, thismod, t.base);
        obj := NIL; np := 0; Read(R, class);
        WHILE class # 0 DO  (*parameters*)
          NEW(par); par.class := class; Read(R, readonly); par.rdo := readonly = 1;
          InType(R, thismod, par.type); par.next := obj; obj := par; INC(np); Read(R, class)
        END ;
        t.dsc := obj; t.nofpar := np; t.size := 4
      END ;
      Files.ReadString(R, modname);
      IF modname[0] #  0X THEN  (*re-import*)
        Files.ReadInt(R, key); Files.ReadString(R, name);
        mod := ThisModule(modname, modname, FALSE, key);
        obj := mod.dsc;  (*search type*)
        WHILE (obj # NIL) & (obj.name # name) DO obj := obj.next END ;
        IF obj # NIL THEN T := obj.type   (*type object found in object list of mod*)
        ELSE (*insert new type object in object list of mod*)
          NEW(obj); obj.name := name; obj.class := Typ; obj.next := mod.dsc; mod.dsc := obj; obj.type := t;
          t.mno := mod.lev; t.typobj := obj; T := t
        END ;
        typtab[ref] := T
      END
    END
  END InType;
  PROCEDURE Import*(## Variables:
```
 modid, modid1: ORS.Ident);
    ## Variables:
```
 key: LONGINT; class, k: INTEGER;
    ## Variables:
```
 key: LONGINT; class, k: INTEGER;
      obj, thismod: Object;
      modname, fname: ORS.Ident;
      F: Files.File; R: Files.Rider;
  BEGIN
    IF modid1 = "SYSTEM" THEN
      thismod := ThisModule(modid, modid1, TRUE, key); DEC(nofmod);
      thismod.lev := 0; thismod.dsc := system; thismod.rdo := TRUE
    ELSE MakeFileName(fname, modid1, ".smb"); F := Files.Old(fname);
      IF F # NIL THEN
        Files.Set(R, F, 0); Files.ReadInt(R, key); Files.ReadInt(R, key); Files.ReadString(R, modname);
        thismod := ThisModule(modid, modid1, TRUE, key); thismod.rdo := TRUE;
        Read(R, class); (*version key*)
        IF class # versionkey THEN ORS.Mark("wrong version") END ;
        Read(R, class);
        WHILE class # 0 DO
          NEW(obj); obj.class := class; Files.ReadString(R, obj.name);
          InType(R, thismod, obj.type); obj.lev := -thismod.lev;
          IF class = Typ THEN obj.type.typobj := obj; Read(R, k)
          ELSIF class = Const THEN
            IF obj.type.form = Real THEN Files.ReadInt(R, obj.val) ELSE Files.ReadNum(R, obj.val) END
          ELSIF class = Var THEN Files.ReadNum(R, obj.val); obj.rdo := TRUE
          END ;
          obj.next := thismod.dsc; thismod.dsc := obj; Read(R, class)
        END
      ELSE ORS.Mark("import not available")
      END
    END
  END Import;
  
  (*-------------------------------- Export ---------------------------------*)
  PROCEDURE Write(## Variables:
```
 R: Files.Rider; x: INTEGER);
  BEGIN Files.WriteByte(R, x)  (* -128 <= x < 128 *)
  END Write;
  PROCEDURE OutType(## Variables:
```
 R: Files.Rider; t: Type);
    ## Variables:
```
 obj, mod, fld, bot: Object;
    ## Variables:
```
 obj, mod, fld, bot: Object;
    PROCEDURE OutPar(## Variables:
```
 R: Files.Rider; par: Object; n: INTEGER);
      ## Variables:
```
 cl: INTEGER;
      ## Variables:
```
 cl: INTEGER;
    BEGIN
      IF n > 0 THEN
        OutPar(R, par.next, n-1); cl := par.class;
        Write(R, cl);
        IF par.rdo THEN Write(R, 1) ELSE Write(R, 0) END ;
        OutType(R, par.type)
      END
    END OutPar;
    PROCEDURE FindHiddenFields(## Variables:
```
 R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)
      ## Variables:
```
 fld: Object; i, s: LONGINT;
      ## Variables:
```
 fld: Object; i, s: LONGINT;
    BEGIN
      IF typ.form IN Ptrs THEN Write(R, Fld); Write(R, 0); Files.WriteNum(R, off)  (*pointer*)
      ELSIF typ.form IN Procs THEN Write(R, Fld); Write(R, 0); Files.WriteNum(R, -off-1)  (*procedure*)
      ELSIF typ.form = Record THEN fld := typ.dsc;
        WHILE fld # NIL DO FindHiddenFields(R, fld.type, fld.val + off); fld := fld.next END
      ELSIF typ.form = Array THEN s := typ.base.size;
        FOR i := 0 TO typ.len-1 DO FindHiddenFields(R, typ.base, i*s + off) END
      END
    END FindHiddenFields;
  PROCEDURE Export*(## Variables:
```
 modid: ORS.Ident; ## Variables:
```
 newSF: BOOLEAN; ## Variables:
```
 key: LONGINT);
    ## Variables:
```
 x, sum, oldkey: LONGINT;
    ## Variables:
```
 x, sum, oldkey: LONGINT;
      obj: Object;
      filename: ORS.Ident;
      F, F1: Files.File; R, R1: Files.Rider;
  BEGIN Ref := TProc + 1; MakeFileName(filename, modid, ".smb");
    F := Files.New(filename); Files.Set(R, F, 0);
    Files.WriteInt(R, 0); (*placeholder*)
    Files.WriteInt(R, 0); (*placeholder for key to be inserted at the end*)
    Files.WriteString(R, modid); Write(R, versionkey);
    obj := topScope.next;
    WHILE obj # NIL DO
      IF obj.expo THEN
        Write(R, obj.class); Files.WriteString(R, obj.name);
        OutType(R, obj.type);
        IF obj.class = Typ THEN Write(R, 0)
        ELSIF obj.class = Const THEN
          IF obj.type.form = Proc THEN Files.WriteNum(R, obj.exno)
          ELSIF obj.type.form = Real THEN Files.WriteInt(R, obj.val)
          ELSIF obj.type.form = String THEN Files.WriteNum(R, obj.exno + obj.val DIV C20 (*len*) * C20)
          ELSE Files.WriteNum(R, obj.val)
          END
        ELSIF obj.class = Var THEN Files.WriteNum(R, obj.exno)
        END
      END ;
      obj := obj.next
    END ;
    REPEAT Write(R, 0) UNTIL Files.Length(F) MOD 4 = 0;
    FOR Ref := TProc+1 TO maxTypTab-1 DO typtab[Ref] := NIL END ;
    Files.Set(R, F, 0); sum := 0; Files.ReadInt(R, x);  (* compute key (checksum) *)
    WHILE ~R.eof DO sum := sum + x; Files.ReadInt(R, x) END ;
    F1 := Files.Old(filename); (*sum is new key*)
    IF F1 # NIL THEN Files.Set(R1, F1, 4); Files.ReadInt(R1, oldkey) ELSE oldkey := sum+1 END ;
    IF sum # oldkey THEN
      IF newSF OR (F1 = NIL) THEN
        key := sum; newSF := TRUE; Files.Set(R, F, 4); Files.WriteInt(R, sum); Files.Register(F)  (*insert checksum*)
      ELSE ORS.Mark("new symbol file inhibited")
      END
    ELSE newSF := FALSE; key := sum
    END
  END Export;
    ## Variables:
```
 tp: Type;
  BEGIN NEW(tp); tp.form := form; tp.size := size; tp.ref := ref; tp.base := NIL;
    typtab[ref] := tp; RETURN tp
  END type;
    ## Variables:
```
 obj: Object;
  BEGIN NEW(obj); obj.name := name; obj.class := cl; obj.type := type; obj.val := n; obj.dsc := NIL;
    IF cl = Typ THEN type.typobj := obj END ;
    obj.next := system; system := obj
  END enter;
  
BEGIN
  byteType := type(Byte, Int, 1);
  boolType := type(Bool, Bool, 1);
  charType := type(Char, Char,1);
  intType := type(Int, Int, 4);
  realType := type(Real, Real, 4);
  setType := type(Set, Set,4);
  nilType := type(NilTyp, NilTyp, 4);
  noType := type(NoTyp, NoTyp, 4);
  strType := type(String, String, 8);
```
## Procedures:
---

`  PROCEDURE NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER);  (*insert new Object with name id*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L79)


`  PROCEDURE thisObj*(): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L90)


`  PROCEDURE thisimport*(mod: Object): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L100)


`  PROCEDURE thisfield*(rec: Type): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L114)


`  PROCEDURE FindFld*(id: ORS.Ident; rec: Type): Object;  (*search id in fields of rec proper, but not its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L121)


`  PROCEDURE NofMethods*(rec: Type): INTEGER;  (*number of methods bound to rec and its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L130)


`  PROCEDURE NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident);  (*insert new method with name id*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L140)


`    PROCEDURE UpdateLinks(rec: Type; new, bot: Object);  (*between field lists of extensions*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L143)


`  PROCEDURE OpenScope*;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L177)


`  PROCEDURE CloseScope*;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L182)


`  PROCEDURE MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L188)


`  PROCEDURE ThisModule(name, orgname: ORS.Ident; decl: BOOLEAN; key: LONGINT): Object;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L196)


`  PROCEDURE Read(VAR R: Files.Rider; VAR x: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L218)


`  PROCEDURE InType(VAR R: Files.Rider; thismod: Object; VAR T: Type);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L224)


`  PROCEDURE Import*(VAR modid, modid1: ORS.Ident);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L286)


`  PROCEDURE Write(VAR R: Files.Rider; x: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L319)


`  PROCEDURE OutType(VAR R: Files.Rider; t: Type);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L323)


`    PROCEDURE OutPar(VAR R: Files.Rider; par: Object; n: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L326)


`    PROCEDURE FindHiddenFields(VAR R: Files.Rider; typ: Type; off: LONGINT);  (*pointers or procedures*)` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L337)


`  PROCEDURE Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L391)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L433)


`  PROCEDURE type(ref, form: INTEGER; size: LONGINT): Type;` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L437)


`  PROCEDURE enter(name: ARRAY OF CHAR; cl: INTEGER; type: Type; n: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORB.Mod#L443)

