
## [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)

(N. Wirth 1.7.97 / 8.3.2020  Oberon compiler for RISC in Oberon-07 / AP 6.8.20 Extended Oberon / CP 10.20 Integrated Oberon)

**ORP** implements a one-pass recursive descent parser for the language Oberon-2i.

The structure of the parser is derived from the structure of the language, with constituent parts of the language 
(e.g. Module, Procedure, Type, Expression, Term, Parameter) represented by a procedure of that name, invoked from the 
encompassing construct. Each procedure consumes and validates a part of the program source text while populating the 
symbol table and execution context and also generating machine code faithfully representing that language construct.

This module (ORP) relies on module ORG for code generation, ORB for the symbol table, execution context tracking and reserved words, and ORS
for lexical parsing and built-in type identification.

Oberon-2i is an extension of Oberon-2, adding interfaces (a.k.a dynamic traits) to the language. Oberon-2 is an extension of Oberon, adding type-bound
procedures and open arrays to the language. Oberon is both an extension and a refinement of Modula-2, which added seperate compilation
among other features to Pascal, which was developed as a reaction to and refinement of Algol-68.


  ## Imports:
` Texts Oberon ORS ORB ORG`

  ## Constants:
```
 NofCases = 256; C20 = 100000H;

```
  ## Types:
```
 PtrBase = POINTER TO PtrBaseDesc;
    PtrBaseDesc = RECORD  (*list of names of pointer base types*)
      name: ORS.Ident; type: ORB.Type; next: PtrBase
    END ;
  
```
  ## Variables:
```
 sym: INTEGER;   (*last symbol read*)
    dc: LONGINT;    (*data counter*)
    level, exno, version: INTEGER;
    newSF: BOOLEAN;  (*option flag*)
    expression: PROCEDURE (## Variables:
```
 x: ORG.Item);  (*to avoid forward reference*)
    expression: PROCEDURE (## Variables:
```
 x: ORG.Item);  (*to avoid forward reference*)
    Type: PROCEDURE (## Variables:
```
 type: ORB.Type; expo: BOOLEAN);
    Type: PROCEDURE (## Variables:
```
 type: ORB.Type; expo: BOOLEAN);
    FormalType: PROCEDURE (## Variables:
```
 typ: ORB.Type; dim: INTEGER);
    FormalType: PROCEDURE (## Variables:
```
 typ: ORB.Type; dim: INTEGER);
    modid: ORS.Ident;
    pbsList: PtrBase;   (*list of names of pointer base types*)
    dummy: ORB.Object;
    W: Texts.Writer;
  PROCEDURE qualident(## Variables:
```
 obj: ORB.Object);
  BEGIN obj := ORB.thisObj(); ORS.Get(sym);
    IF obj = NIL THEN ORS.Mark("undef"); obj := dummy END ;
    IF (sym = ORS.period) & (obj.class = ORB.Mod) THEN
      ORS.Get(sym);
      IF sym = ORS.ident THEN obj := ORB.thisimport(obj); ORS.Get(sym);
        IF obj = NIL THEN ORS.Mark("undef"); obj := dummy END
      ELSE ORS.Mark("identifier expected"); obj := dummy
      END
    ELSIF (obj.lev > 0) & (obj.lev # level) &
      ((obj.class # ORB.Const) OR (obj.type.form # ORB.Proc)) THEN ORS.Mark("not accessible")
    END
  END qualident;
  PROCEDURE CheckBool(## Variables:
```
 x: ORG.Item);
  BEGIN
    IF x.type.form # ORB.Bool THEN ORS.Mark("not Boolean"); x.type := ORB.boolType END
  END CheckBool;
  PROCEDURE CheckInt(## Variables:
```
 x: ORG.Item);
  BEGIN
    IF x.type.form # ORB.Int THEN ORS.Mark("not Integer"); x.type := ORB.intType END
  END CheckInt;
  PROCEDURE CheckReal(## Variables:
```
 x: ORG.Item);
  BEGIN
    IF x.type.form # ORB.Real THEN ORS.Mark("not Real"); x.type := ORB.realType END
  END CheckReal;
  PROCEDURE CheckSet(## Variables:
```
 x: ORG.Item);
  BEGIN
    IF x.type.form # ORB.Set THEN ORS.Mark("not Set"); x.type := ORB.setType END 
  END CheckSet;
  PROCEDURE CheckSetVal(## Variables:
```
 x: ORG.Item);
  BEGIN
    IF x.type.form # ORB.Int THEN ORS.Mark("not Int"); x.type := ORB.setType
    ELSIF x.mode = ORB.Const THEN
      IF (x.a < 0) OR (x.a >= 32) THEN ORS.Mark("invalid set") END
    END 
  END CheckSetVal;
  PROCEDURE CheckConst(## Variables:
```
 x: ORG.Item);
  BEGIN
    IF x.mode # ORB.Const THEN ORS.Mark("not a constant"); x.mode := ORB.Const END
  END CheckConst;
  PROCEDURE CheckReadOnly(## Variables:
```
 x: ORG.Item);
  BEGIN
    IF x.rdo THEN ORS.Mark("read-only") END
  END CheckReadOnly;
  PROCEDURE CheckExport(## Variables:
```
 expo: BOOLEAN);
  BEGIN
    IF sym = ORS.times THEN
      expo := TRUE; ORS.Get(sym);
      IF level # 0 THEN ORS.Mark("remove asterisk") END
    ELSE expo := FALSE
    END
  END CheckExport;
  PROCEDURE TypeTest(## Variables:
```
 x: ORG.Item; T: ORB.Type; guard: BOOLEAN);
    ## Variables:
```
 xt: ORB.Type;
    ## Variables:
```
 xt: ORB.Type;
  BEGIN xt := x.type;
    IF (T.form = xt.form ) & ((T.form = ORB.Pointer) OR (T.form = ORB.Record) & (x.mode = ORB.Par)) THEN
      WHILE (xt # T) & (xt # NIL) DO xt := xt.base END ;
      IF xt # T THEN xt := x.type;
        IF xt.form = ORB.Pointer THEN
          IF IsExtension(xt.base, T.base) THEN ORG.TypeTest(x, T.base, FALSE, guard); x.type := T
          ELSE ORS.Mark("not an extension")
          END
        ELSIF (xt.form = ORB.Record) & (x.mode = ORB.Par) THEN
          IF IsExtension(xt, T) THEN  ORG.TypeTest(x, T, TRUE, guard); x.type := T
          ELSE ORS.Mark("not an extension")
          END
        ELSE ORS.Mark("incompatible types")
        END
      ELSIF ~guard THEN ORG.TypeTest(x, NIL, FALSE, FALSE)
      END
    ELSE ORS.Mark("type mismatch")
    END ;
    IF ~guard THEN x.type := ORB.boolType END
  END TypeTest;
  PROCEDURE selector(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 y: ORG.Item; obj, fld: ORB.Object; xt: ORB.Type; deref: BOOLEAN;
    ## Variables:
```
 y: ORG.Item; obj, fld: ORB.Object; xt: ORB.Type; deref: BOOLEAN;
  BEGIN deref := FALSE;
    WHILE (sym = ORS.lbrak) OR (sym = ORS.period) OR (sym = ORS.arrow)
        OR (sym = ORS.lparen) & (x.type.form IN {ORB.Record, ORB.Pointer}) DO
      IF sym = ORS.lbrak THEN
        IF x.type.form = ORB.Pointer THEN ORG.DeRef(x); x.type := x.type.base END ;
        REPEAT ORS.Get(sym); expression(y);
          IF x.type.form = ORB.Array THEN
            CheckInt(y); ORG.Index(x, y); x.type := x.type.base
          ELSE ORS.Mark("not an array")
          END
        UNTIL sym # ORS.comma;
        Check(ORS.rbrak, "no ]"); deref := FALSE
      ELSIF sym = ORS.period THEN ORS.Get(sym);
        IF sym = ORS.ident THEN
          IF x.type.form = ORB.Pointer THEN ORG.DeRef(x); x.type := x.type.base; deref := TRUE END ;
          IF x.type.form = ORB.Interface THEN
            obj := ORB.thisfield(x.type); ORS.Get(sym);
            IF obj # NIL THEN
              IF obj.type.form = ORB.TProc THEN  
                IF sym # ORS.arrow THEN (*no super call*)
                  (* CheckReceiver(obj, deref); *)  ORG.Method(x, obj, deref, FALSE) 
                ELSE ORS.Mark("no super")
                END
              ELSE ORS.Mark("not tproc")
              END
            ELSE ORS.Mark("undef")
            END
          ELSIF x.type.form = ORB.Record THEN
            obj := ORB.thisfield(x.type); ORS.Get(sym);
            IF obj # NIL THEN
              IF obj.type.form = ORB.TProc THEN  (*type-bound procedure*)
                IF sym = ORS.arrow THEN (*super call*)
                  ORS.Get(sym); xt := x.type; fld := ORB.FindFld(obj.name, xt);
                  IF fld # NIL THEN xt := xt.base; fld := NIL;
                    WHILE (xt # NIL) & (fld = NIL) DO fld := ORB.FindFld(obj.name, xt); xt := xt.base END ;
                    IF (fld # NIL) & (fld.type.form = ORB.TProc) THEN obj := fld;
                      CheckReceiver(obj, deref); ORG.Method(x, obj, deref, TRUE); DisallowMethods(x.type.base)
                    ELSE ORS.Mark("method undefined in base types")
                    END
                  ELSE ORS.Mark("method undefined at this extension level")
                  END
                ELSE (*method call*) CheckReceiver(obj, deref); ORG.Method(x, obj, deref, FALSE)
                END
              ELSE ORG.Field(x, obj); deref := FALSE
              END ;
              x.type := obj.type
            ELSE ORS.Mark("undef")
            END
          ELSE ORS.Mark("not a record or interface")
          END
        ELSE ORS.Mark("ident?")
        END
      ELSIF sym = ORS.arrow THEN
        ORS.Get(sym);
        IF x.type.form = ORB.Pointer THEN ORG.DeRef(x); x.type := x.type.base; deref := TRUE
        ELSE ORS.Mark("not a pointer")
        END
      ELSIF (sym = ORS.lparen) & (x.type.form IN {ORB.Record, ORB.Pointer}) THEN (*type guard*)
        ORS.Get(sym);
        IF sym = ORS.ident THEN
          qualident(obj);
          IF obj.class = ORB.Typ THEN TypeTest(x, obj.type, TRUE)
          ELSE ORS.Mark("guard type expected")
          END
        ELSE ORS.Mark("not an identifier")
        END ;
        Check(ORS.rparen, " ) missing")
      END
    END
  END selector;
    ## Variables:
```
 p0, p1: ORB.Object; com, ext: BOOLEAN;
  BEGIN com := TRUE; ext := FALSE;
    IF (t0.base = t1.base) & (t0.nofpar = t1.nofpar) THEN
      p0 := t0.dsc; p1 := t1.dsc;
      IF t1.form = ORB.TProc THEN  (*type-bound procedure*)
        IF t0.form = ORB.TProc THEN  (*check whether its receiver is an extension of p0*)
          IF p1.type.form = ORB.Pointer THEN ext := IsExtension(p0.type.base, p1.type.base)
          ELSE ext := IsExtension(p0.type, p1.type)
          END
        END ;
        IF ext THEN p0 := p0.next; p1 := p1.next ELSE p0 := NIL; com := FALSE END
      END ;
      WHILE (p0 # NIL) & (p1 # NIL) DO
        IF (p0.class = p1.class) &  (p0.rdo = p1.rdo) &
          ((p0.type = p1.type) OR
          (p0.type.form = ORB.Array) & (p1.type.form = ORB.Array) & (p0.type.len = p1.type.len) & (p0.type.base = p1.type.base) OR
          (p0.type.form = ORB.Proc) & (p1.type.form = ORB.Proc) & EqualSignatures(p0.type, p1.type))
        THEN p0 := p0.next; p1 := p1.next
        ELSE p0 := NIL; com := FALSE
        END
      END
    ELSE com := FALSE
    END ;
    RETURN com
  END EqualSignatures;
    ## Variables:
```
 x: ORG.Item; varpar: BOOLEAN;
  BEGIN expression(x);
    IF par # NIL THEN
      varpar := par.class = ORB.Par;
      IF CompTypes(par.type, x.type, varpar) THEN
        IF ~varpar THEN ORG.ValueParam(x)
        ELSE (*par.class = Par*)
          IF ~par.rdo THEN CheckReadOnly(x) END ;
          ORG.VarParam(x, par.type)
        END
      ELSIF (x.type.form = ORB.Array) & (par.type.form = ORB.Array) &
          (x.type.base = par.type.base) & (par.type.len < 0) THEN
        IF ~par.rdo THEN CheckReadOnly(x) END ;
        ORG.OpenArrayParam(x)
      ELSIF (x.type.form = ORB.String) & varpar & par.rdo & (par.type.form = ORB.Array) & 
          (par.type.base.form = ORB.Char) & (par.type.len < 0) THEN ORG.StringParam(x)
      ELSIF ~varpar & (par.type.form = ORB.Int) & (x.type.form = ORB.Int) THEN ORG.ValueParam(x)  (*BYTE*)
      ELSIF (x.type.form = ORB.String) & (x.b = 2) & (par.class = ORB.Var) & (par.type.form = ORB.Char) THEN
        ORG.StrToChar(x); ORG.ValueParam(x)
      ELSIF (par.type.form = ORB.Array) & (par.type.base = ORB.byteType) & 
          (par.type.len >= 0) & (par.type.size = x.type.size) THEN
        ORG.VarParam(x, par.type)
      ELSE ORS.Mark("bad par")
      END
    END
  END Parameter;
    ## Variables:
```
 x: ORG.Item; varpar: BOOLEAN;
  BEGIN expression(x);
    IF par # NIL THEN
      varpar := par.class = ORB.Par;
      IF CompTypes(par.type, x.type, varpar) THEN
        IF ~varpar THEN ORG.ValueParam(x)
        ELSE (*par.class = Par*)
          IF ~par.rdo THEN CheckReadOnly(x) END ;
          ORG.VarParam(x, par.type)
        END
      ELSIF (x.type.form = ORB.Array) & (par.type.form = ORB.Array) &
          (x.type.base = par.type.base) & (par.type.len < 0) THEN
        IF ~par.rdo THEN CheckReadOnly(x) END ;
        ORG.OpenArrayParam(x)
      ELSIF (x.type.form = ORB.String) & varpar & par.rdo & (par.type.form = ORB.Array) & 
          (par.type.base.form = ORB.Char) & (par.type.len < 0) THEN ORG.StringParam(x)
      ELSIF ~varpar & (par.type.form = ORB.Int) & (x.type.form = ORB.Int) THEN ORG.ValueParam(x)  (*BYTE*)
      ELSIF (x.type.form = ORB.String) & (x.b = 2) & (par.class = ORB.Var) & (par.type.form = ORB.Char) THEN
        ORG.StrToChar(x); ORG.ValueParam(x)
      ELSIF (par.type.form = ORB.Array) & (par.type.base = ORB.byteType) & 
          (par.type.len >= 0) & (par.type.size = x.type.size) THEN
        ORG.VarParam(x, par.type)
      ELSE ORS.Mark("bad ipar")
      END
    END
  END IParameter;
  PROCEDURE ParamList(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 n: INTEGER; par: ORB.Object;
    ## Variables:
```
 n: INTEGER; par: ORB.Object;
  BEGIN par := x.type.dsc; n := 0;
    IF x.type.form = ORB.TProc THEN  (*type-bound procedure*)
      IF (par.class = ORB.Par) & ~par.rdo THEN CheckReadOnly(x) END ;
      ORG.ReceiverParam(x, par); INC(n); par := par.next
    END ;
    IF sym # ORS.rparen THEN
      Parameter(par); INC(n);
      WHILE sym <= ORS.comma DO
        Check(ORS.comma, "comma?");
        IF par # NIL THEN par := par.next END ;
        Parameter(par); INC(n)
      END ;
      Check(ORS.rparen, ") missing")
    ELSE ORS.Get(sym);
    END ;
    IF n < x.type.nofpar THEN ORS.Mark("too few params")
    ELSIF n > x.type.nofpar THEN ORS.Mark("too many params")
    END
  END ParamList;
  PROCEDURE IParamList(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 n: INTEGER; par: ORB.Object;
    ## Variables:
```
 n: INTEGER; par: ORB.Object;
  BEGIN par := x.type.dsc; n := 0;
    IF x.type.form = ORB.TProc THEN  (*type-bound procedure*)
      IF (par.class = ORB.Par) & ~par.rdo THEN CheckReadOnly(x) END ;
      ORG.ReceiverParam(x, par); INC(n); par := par.next 
    END ;
    IF sym # ORS.rparen THEN
      IParameter(par); INC(n);
      WHILE sym <= ORS.comma DO
        Check(ORS.comma, "comma?");
        IF par # NIL THEN par := par.next END ;
        IParameter(par); INC(n)
      END ;
      Check(ORS.rparen, ") missing")
    ELSE ORS.Get(sym);
    END ;
    IF n < x.type.nofpar THEN ORS.Mark("too few params")
    ELSIF n > x.type.nofpar THEN ORS.Mark("too many params")
    END
  END IParamList;
  PROCEDURE StandFunc(## Variables:
```
 x: ORG.Item; fct: LONGINT; restyp: ORB.Type);
    ## Variables:
```
 y: ORG.Item; n, npar: LONGINT;
    ## Variables:
```
 y: ORG.Item; n, npar: LONGINT;
  BEGIN Check(ORS.lparen, "no (");
    npar := fct MOD 10; fct := fct DIV 10; expression(x); n := 1;
    WHILE sym = ORS.comma DO ORS.Get(sym); expression(y); INC(n) END ;
    Check(ORS.rparen, "no )");
    IF n = npar THEN
      IF fct = 0 THEN (*ABS*)
        IF x.type.form IN {ORB.Int, ORB.Real} THEN ORG.Abs(x); restyp := x.type ELSE ORS.Mark("bad type") END
      ELSIF fct = 1 THEN (*ODD*) CheckInt(x); ORG.Odd(x)
      ELSIF fct = 2 THEN (*FLOOR*) CheckReal(x); ORG.Floor(x)
      ELSIF fct = 3 THEN (*FLT*) CheckInt(x); ORG.Float(x)
      ELSIF fct = 4 THEN (*ORD*)
        IF x.type.form <= ORB.Proc THEN ORG.Ord(x)
        ELSIF (x.type.form = ORB.String) & (x.b = 2) THEN ORG.StrToChar(x)
        ELSE ORS.Mark("bad type")
        END
      ELSIF fct = 5 THEN (*CHR*) CheckInt(x); ORG.Ord(x)
      ELSIF fct = 6 THEN (*LEN*)
          IF x.type.form = ORB.Array THEN ORG.Len(x) ELSE ORS.Mark("not an array") END
      ELSIF fct IN {7, 8, 9} THEN (*LSL, ASR, ROR*) CheckInt(y);
        IF x.type.form IN {ORB.Int, ORB.Set} THEN ORG.Shift(fct-7, x, y); restyp := x.type ELSE ORS.Mark("bad type") END
      ELSIF fct = 11 THEN (*ADC*) ORG.ADC(x, y)
      ELSIF fct = 12 THEN (*SBC*) ORG.SBC(x, y)
      ELSIF fct = 13 THEN (*UML*) ORG.UML(x, y)
      ELSIF fct = 14 THEN (*BIT*) CheckInt(x); CheckInt(y); ORG.Bit(x, y)
      ELSIF fct = 15 THEN (*REG*) CheckConst(x); CheckInt(x); ORG.Register(x)
      ELSIF fct = 16 THEN (*VAL*)
        IF (x.mode= ORB.Typ) & (x.type.size <= y.type.size) THEN restyp := x.type; x := y
        ELSE ORS.Mark("casting not allowed")
        END
      ELSIF fct = 17 THEN (*ADR*) ORG.Adr(x)
      ELSIF fct = 18 THEN (*SIZE*)
        IF x.mode = ORB.Typ THEN ORG.MakeConstItem(x, ORB.intType, x.type.size)
        ELSE ORS.Mark("must be a type")
        END
      ELSIF fct = 19 THEN (*COND*) CheckConst(x); CheckInt(x); ORG.Condition(x)
      ELSIF fct = 20 THEN (*H*) CheckConst(x); CheckInt(x); ORG.H(x)
      END ;
      x.type := restyp
    ELSE ORS.Mark("wrong nof params")
    END
  END StandFunc;
  PROCEDURE element(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 y: ORG.Item;
    ## Variables:
```
 y: ORG.Item;
  BEGIN expression(x); CheckSetVal(x);
    IF sym = ORS.upto THEN ORS.Get(sym); expression(y); CheckSetVal(y); ORG.Set(x, y)
    ELSE ORG.Singleton(x)
    END ;
    x.type := ORB.setType
  END element;
  
  (* begin-procedure-description
---
**set** produces a set from elements.
  end-procedure-description *)
  PROCEDURE set(## Variables:
```
 x: ORG.Item);
  PROCEDURE set(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 y: ORG.Item;
    ## Variables:
```
 y: ORG.Item;
  BEGIN
    IF sym >= ORS.if THEN
      IF sym # ORS.rbrace THEN ORS.Mark(" } missing") END ;
      ORG.MakeConstItem(x, ORB.setType, 0) (*empty set*)
    ELSE element(x);
      WHILE (sym <= ORS.comma) OR (sym = ORS.semicolon) DO
        IF sym = ORS.comma THEN ORS.Get(sym) ELSE ORS.Mark("comma?") END ;
        element(y); ORG.SetOp(ORS.plus, x, y)
      END
    END
  END set; 
  PROCEDURE factor(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 obj: ORB.Object; rx: LONGINT;
    ## Variables:
```
 obj: ORB.Object; rx: LONGINT;
  BEGIN (*sync*)
    IF (sym < ORS.char) OR (sym > ORS.ident) THEN ORS.Mark("expression expected");
      REPEAT ORS.Get(sym) UNTIL (sym >= ORS.char) & (sym <= ORS.for) OR (sym >= ORS.then)
    END ;
    IF sym = ORS.ident THEN
      qualident(obj);
      IF obj.class = ORB.SFunc THEN StandFunc(x, obj.val, obj.type)
      ELSE ORG.MakeItem(x, obj, level); selector(x);
        IF sym = ORS.lparen THEN
          ORS.Get(sym);
          IF (x.type.form IN {ORB.Proc, ORB.TProc}) & (x.type.base.form # ORB.NoTyp) THEN
            ORG.PrepCall(x, rx); ParamList(x); ORG.Call(x, rx); x.type := x.type.base
          ELSE ORS.Mark("not a function"); ParamList(x)
          END
        END
      END
    ELSIF sym = ORS.int THEN ORG.MakeConstItem(x, ORB.intType, ORS.ival); ORS.Get(sym)
    ELSIF sym = ORS.real THEN ORG.MakeRealItem(x, ORS.rval); ORS.Get(sym)
    ELSIF sym = ORS.char THEN ORG.MakeConstItem(x, ORB.charType, ORS.ival); ORS.Get(sym)
    ELSIF sym = ORS.nil THEN ORS.Get(sym); ORG.MakeConstItem(x, ORB.nilType, 0)
    ELSIF sym = ORS.string THEN ORG.MakeStringItem(x, ORS.slen); ORS.Get(sym)
    ELSIF sym = ORS.lparen THEN ORS.Get(sym); expression(x); Check(ORS.rparen, "no )")
    ELSIF sym = ORS.lbrace THEN ORS.Get(sym); set(x); Check(ORS.rbrace, "no }")
    ELSIF sym = ORS.not THEN ORS.Get(sym); factor(x); CheckBool(x); ORG.Not(x)
    ELSIF sym = ORS.false THEN ORS.Get(sym); ORG.MakeConstItem(x, ORB.boolType, 0)
    ELSIF sym = ORS.true THEN ORS.Get(sym); ORG.MakeConstItem(x, ORB.boolType, 1)
    ELSE ORS.Mark("not a factor"); ORG.MakeConstItem(x, ORB.intType, 0)
    END
  END factor;
  PROCEDURE term(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 y: ORG.Item; op, f: INTEGER;
    ## Variables:
```
 y: ORG.Item; op, f: INTEGER;
  BEGIN factor(x); f := x.type.form;
    WHILE (sym >= ORS.times) & (sym <= ORS.and) DO
      op := sym; ORS.Get(sym);
      IF op = ORS.times THEN
        IF f = ORB.Int THEN factor(y); CheckInt(y); ORG.MulOp(x, y)
        ELSIF f = ORB.Real THEN factor(y); CheckReal(y); ORG.RealOp(op, x, y)
        ELSIF f = ORB.Set THEN factor(y); CheckSet(y); ORG.SetOp(op, x, y)
        ELSE ORS.Mark("bad type")
        END
      ELSIF (op = ORS.div) OR (op = ORS.mod) THEN
        CheckInt(x); factor(y); CheckInt(y); ORG.DivOp(op, x, y)
      ELSIF op = ORS.rdiv THEN
        IF f = ORB.Real THEN factor(y); CheckReal(y); ORG.RealOp(op, x, y)
        ELSIF f = ORB.Set THEN factor(y); CheckSet(y); ORG.SetOp(op, x, y)
        ELSE ORS.Mark("bad type")
        END
      ELSE (*op = and*) CheckBool(x); ORG.And1(x); factor(y); CheckBool(y); ORG.And2(x, y)
      END
    END
  END term;
  PROCEDURE SimpleExpression(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 y: ORG.Item; op: INTEGER;
    ## Variables:
```
 y: ORG.Item; op: INTEGER;
  BEGIN
    IF sym = ORS.minus THEN ORS.Get(sym); term(x);
      IF x.type.form IN {ORB.Int, ORB.Real, ORB.Set} THEN ORG.Neg(x) ELSE CheckInt(x) END
    ELSIF sym = ORS.plus THEN ORS.Get(sym); term(x);
    ELSE term(x)
    END ;
    WHILE (sym >= ORS.plus) & (sym <= ORS.or) DO
      op := sym; ORS.Get(sym);
      IF op = ORS.or THEN ORG.Or1(x); CheckBool(x); term(y); CheckBool(y); ORG.Or2(x, y)
      ELSIF x.type.form = ORB.Int THEN term(y); CheckInt(y); ORG.AddOp(op, x, y)
      ELSIF x.type.form = ORB.Real THEN term(y); CheckReal(y); ORG.RealOp(op, x, y)
      ELSE CheckSet(x); term(y); CheckSet(y); ORG.SetOp(op, x, y)
      END
    END
  END SimpleExpression;
  PROCEDURE expression0(## Variables:
```
 x: ORG.Item);
    ## Variables:
```
 y: ORG.Item; obj: ORB.Object; rel, xf, yf: INTEGER;
    ## Variables:
```
 y: ORG.Item; obj: ORB.Object; rel, xf, yf: INTEGER;
  BEGIN SimpleExpression(x);
    IF (sym >= ORS.eql) & (sym <= ORS.geq) THEN
      rel := sym; ORS.Get(sym); SimpleExpression(y); xf := x.type.form; yf := y.type.form;
      IF x.type = y.type THEN
        IF (xf IN {ORB.Char, ORB.Int}) THEN ORG.IntRelation(rel, x, y)
        ELSIF xf = ORB.Real THEN ORG.RealRelation(rel, x, y)
        ELSIF (xf IN {ORB.Set, ORB.Pointer, ORB.Proc, ORB.NilTyp, ORB.Bool}) THEN
          IF rel <= ORS.neq THEN ORG.IntRelation(rel, x, y) ELSE ORS.Mark("only = or #") END
        ELSIF (xf = ORB.Array) & (x.type.base.form = ORB.Char) OR (xf = ORB.String) THEN
          ORG.StringRelation(rel, x, y)
        ELSE ORS.Mark("illegal comparison")
        END
      ELSIF (xf IN {ORB.Pointer, ORB.Proc}) & (yf = ORB.NilTyp)
          OR (yf IN {ORB.Pointer, ORB.Proc}) & (xf = ORB.NilTyp) THEN
        IF rel <= ORS.neq THEN ORG.IntRelation(rel, x,  y) ELSE ORS.Mark("only = or #") END
      ELSIF (xf = ORB.Pointer) & (yf = ORB.Pointer) &
          (IsExtension(x.type.base, y.type.base) OR IsExtension(y.type.base, x.type.base))
          OR (xf = ORB.Proc) & (yf = ORB.Proc) & EqualSignatures(x.type, y.type) THEN
        IF rel <= ORS.neq THEN ORG.IntRelation(rel,  x, y) ELSE ORS.Mark("only = or #") END
      ELSIF (xf = ORB.Array) & (x.type.base.form = ORB.Char) &
            ((yf = ORB.String) OR (yf = ORB.Array) & (y.type.base.form = ORB.Char))
          OR (yf = ORB.Array) & (y.type.base.form = ORB.Char) & (xf = ORB.String) THEN
        ORG.StringRelation(rel, x, y)
      ELSIF (xf = ORB.Char) & (yf = ORB.String) & (y.b = 2) THEN
        ORG.StrToChar(y); ORG.IntRelation(rel, x, y)
      ELSIF (yf = ORB.Char) & (xf = ORB.String) & (x.b = 2) THEN
        ORG.StrToChar(x); ORG.IntRelation(rel, x, y)
      ELSIF (xf = ORB.Int) & (yf = ORB.Int) THEN ORG.IntRelation(rel,  x, y)  (*BYTE*)
      ELSE ORS.Mark("illegal comparison")
      END ;
      x.type := ORB.boolType
    ELSIF sym = ORS.in THEN
      ORS.Get(sym); CheckInt(x); SimpleExpression(y); CheckSet(y); ORG.In(x, y) ;
      x.type := ORB.boolType
    ELSIF sym = ORS.is THEN
      ORS.Get(sym); qualident(obj); TypeTest(x, obj.type, FALSE) ;
      x.type := ORB.boolType
    END
  END expression0;
    ## Variables:
```
 nap, npar: LONGINT; (*nof actual/formal parameters*)
      x, y, z: ORG.Item;
  BEGIN Check(ORS.lparen, "no (");
    npar := pno MOD 10; pno := pno DIV 10; expression(x); nap := 1;
    IF sym = ORS.comma THEN
      ORS.Get(sym); expression(y); nap := 2; z.type := ORB.noType;
      WHILE sym = ORS.comma DO ORS.Get(sym); expression(z); INC(nap) END
    ELSE y.type := ORB.noType
    END ;
    Check(ORS.rparen, "no )");
    IF (npar = nap) OR (pno IN {0, 1, 5}) THEN
      IF pno IN {0, 1} THEN (*INC, DEC*)
        CheckInt(x); CheckReadOnly(x);
        IF y.type # ORB.noType THEN CheckInt(y) END ;
        ORG.Increment(pno, x, y)
      ELSIF pno IN {2, 3} THEN (*INCL, EXCL*)
        CheckSet(x); CheckReadOnly(x); CheckInt(y); ORG.Include(pno-2, x, y)
      ELSIF pno = 4 THEN CheckBool(x); ORG.Assert(x)
      ELSIF pno = 5 THEN(*NEW*) CheckReadOnly(x);
        IF (x.type.form = ORB.Pointer) & (x.type.base.form IN {ORB.Record, ORB.Array}) THEN
          IF nap = 1 THEN
            IF x.type.base.form = ORB.Array THEN
              IF x.type.base.len >= 0 THEN ORG.MakeConstItem(y, ORB.intType, x.type.base.len)
              ELSE ORS.Mark("wrong nof params")
              END
            END
          ELSIF (nap = 2) & (x.type.base.form = ORB.Array) & (x.type.base.len < 0) THEN CheckInt(y) (*open array*)
          ELSE ORS.Mark("wrong nof params")
          END ;
          ORG.New(x, y)
        ELSE ORS.Mark("not a pointer to record or open array")
        END
      ELSIF pno = 6 THEN CheckReal(x); CheckInt(y); CheckReadOnly(x); ORG.Pack(x, y)
      ELSIF pno = 7 THEN CheckReal(x); CheckInt(y); CheckReadOnly(x); ORG.Unpk(x, y)
      ELSIF pno = 8 THEN
        IF x.type.form <= ORB.Set THEN ORG.Led(x) ELSE ORS.Mark("bad type") END
      ELSIF pno = 10 THEN CheckInt(x); ORG.Get(x, y)
      ELSIF pno = 11 THEN CheckInt(x); ORG.Put(x, y)
      ELSIF pno = 12 THEN CheckInt(x); CheckInt(y); CheckInt(z); ORG.Copy(x, y, z)
      ELSIF pno = 13 THEN CheckConst(x); CheckInt(x); ORG.LDPSR(x)
      ELSIF pno = 14 THEN CheckInt(x); ORG.LDREG(x, y)
      END
    ELSE ORS.Mark("wrong nof parameters")
    END
  END StandProc;
    ## Variables:
```
 obj: ORB.Object;
      x, y, z, w: ORG.Item;
      L0, L1, rx: LONGINT;
    PROCEDURE TypeCase(obj: ORB.Object; ## Variables:
```
 L0: LONGINT);
      ## Variables:
```
 typobj: ORB.Object; x: ORG.Item;
      ## Variables:
```
 typobj: ORB.Object; x: ORG.Item;
        orgtype: ORB.Type;  (*original type of case var*)
    BEGIN
      IF sym = ORS.ident THEN
        qualident(typobj); ORG.MakeItem(x, obj, level); orgtype := obj.type;
        IF typobj.class # ORB.Typ THEN ORS.Mark("not a type") END ;
        TypeTest(x, typobj.type, FALSE); obj.type := typobj.type;
        ORG.CFJump(x); Check(ORS.colon, ": expected"); StatSequence;
        ORG.FJump(L0); ORG.Fixup(x); obj.type := orgtype
      ELSE ORS.Mark("type id expected"); Check(ORS.colon, ": expected"); StatSequence
      END
    END TypeCase;
      ## Variables:
```
 obj: ORB.Object; L0: LONGINT;
    BEGIN qualident(obj); Check(ORS.of, "OF expected"); L0 := 0;
      WHILE (sym < ORS.end) OR (sym = ORS.bar) DO
        IF sym = ORS.bar THEN ORS.Get(sym) ELSE TypeCase(obj, L0) END
      END ;
      IF sym = ORS.else THEN ORS.Get(sym); StatSequence END ;
      ORG.FixLink(L0)
    END TypeCasePart;
    PROCEDURE CaseLabel(## Variables:
```
 x: ORG.Item);
    BEGIN expression(x); CheckConst(x);
      IF (x.type.form = ORB.String) & (x.b = 2) THEN ORG.StrToChar(x)
      ELSIF ~(x.type.form IN {ORB.Int, ORB.Char}) OR (x.a < 0) OR (x.a > 255) THEN
        ORS.Mark("invalid case label"); x.type := ORB.intType
      END
    END CaseLabel;
    PROCEDURE NumericCase(LabelForm: INTEGER; ## Variables:
```
 n: INTEGER; ## Variables:
```
 tab: ARRAY OF ORG.LabelRange);
      ## Variables:
```
 x, y: ORG.Item; i: INTEGER; continue: BOOLEAN;
      ## Variables:
```
 x, y: ORG.Item; i: INTEGER; continue: BOOLEAN;
    BEGIN
      REPEAT CaseLabel(x);
        IF x.type.form # LabelForm THEN ORS.Mark("invalid label form") END ;
        IF sym = ORS.upto THEN ORS.Get(sym); CaseLabel(y);
          IF (x.type.form # y.type.form) OR (x.a >= y.a) THEN ORS.Mark("invalid label range"); y := x END
        ELSE y := x
        END ;
        IF n < NofCases THEN  (*enter label range into ordered table*)
          i := n; continue := TRUE;
          WHILE continue & (i > 0) DO
            IF tab[i-1].low > y.a THEN tab[i] := tab[i-1]; DEC(i)
            ELSE continue := FALSE;
              IF tab[i-1].high >= x.a THEN ORS.Mark("overlapping case labels") END
            END
          END ;
          tab[i].low := x.a; tab[i].high := y.a; tab[i].label := ORG.Here(); INC(n)
        ELSE ORS.Mark("too many case labels")
        END ;
        IF sym = ORS.comma THEN ORS.Get(sym)
        ELSIF (sym < ORS.comma) OR (sym = ORS.semicolon) THEN ORS.Mark("comma?")
        END
      UNTIL (sym > ORS.comma) & (sym # ORS.semicolon);
      Check(ORS.colon, ": expected"); StatSequence
    END NumericCase;
    PROCEDURE CaseExpression(## Variables:
```
 x: ORG.Item);
    BEGIN expression(x);
      IF ~(x.type.form IN {ORB.Int, ORB.Byte, ORB.Char}) THEN ORS.Mark("invalid type"); x.type := ORB.intType END
    END CaseExpression;
      ## Variables:
```
 x: ORG.Item; L0, L1, L2: LONGINT; n, labelform: INTEGER;
        tab: ARRAY NofCases OF ORG.LabelRange;  (*ordered table of label ranges*)
    BEGIN CaseExpression(x); ORG.CaseHead(x, L0);
      Check(ORS.of, "OF expected"); n := 0; L2 := 0; labelform := x.type.form;
      WHILE (sym < ORS.end) OR (sym = ORS.bar) DO
        IF sym = ORS.bar THEN ORS.Get(sym) ELSE NumericCase(labelform, n, tab); ORG.FJump(L2) END
      END ;
      IF sym = ORS.else THEN ORS.Get(sym); L1 := ORG.Here(); StatSequence; ORG.FJump(L2) ELSE L1 := 0 END ;
      ORG.CaseTail(L0, L1, n, tab); ORG.FixLink(L2)
    END NumericCasePart;
  PROCEDURE IdentList(class: INTEGER; ## Variables:
```
 first: ORB.Object);
    ## Variables:
```
 obj: ORB.Object;
    ## Variables:
```
 obj: ORB.Object;
  BEGIN
    IF sym = ORS.ident THEN
      ORB.NewObj(first, ORS.id, class); ORS.Get(sym); CheckExport(first.expo);
      WHILE sym = ORS.comma DO
        ORS.Get(sym);
        IF sym = ORS.ident THEN ORB.NewObj(obj, ORS.id, class); ORS.Get(sym); CheckExport(obj.expo)
        ELSE ORS.Mark("ident?")
        END
      END ;
      IF sym = ORS.colon THEN ORS.Get(sym) ELSE ORS.Mark(":?") END
    ELSE first := NIL
    END
  END IdentList;
  PROCEDURE ArrayType(## Variables:
```
 type: ORB.Type; expo: BOOLEAN);
    ## Variables:
```
 x: ORG.Item; typ: ORB.Type; len: LONGINT;
    ## Variables:
```
 x: ORG.Item; typ: ORB.Type; len: LONGINT;
  BEGIN NEW(typ); typ.form := ORB.NoTyp;
    IF sym = ORS.of THEN (*open array type*)
      ORS.Get(sym); Type(typ.base, expo); typ.len := -1; typ.size := 0;
      IF typ.base.form = ORB.Array THEN ORS.Mark("multi-dimensional open arrays not allowed") END
    ELSE expression(x);
      IF (x.mode = ORB.Const) & (x.type.form = ORB.Int) & (x.a >= 0) THEN len := x.a
      ELSE len := 1; ORS.Mark("not a valid length")
      END ;
      IF sym = ORS.of THEN ORS.Get(sym); Type(typ.base, expo);
        IF (typ.base.form = ORB.Array) & (typ.base.len < 0) THEN ORS.Mark("dyn array not allowed") END
      ELSIF sym = ORS.comma THEN ORS.Get(sym); ArrayType(typ.base, expo)
      ELSE ORS.Mark("missing OF"); typ.base := ORB.intType
      END ;
      typ.size := (len * typ.base.size + 3) DIV 4 * 4; typ.len := len
    END ;
    typ.form := ORB.Array; type := typ
  END ArrayType;
  PROCEDURE RecordType(## Variables:
```
 type: ORB.Type; expo: BOOLEAN);
    ## Variables:
```
 obj, obj0, new, bot, base: ORB.Object;
    ## Variables:
```
 obj, obj0, new, bot, base: ORB.Object;
      typ, tp: ORB.Type;
      offset, off, n: LONGINT; expo0: BOOLEAN;
  BEGIN NEW(typ); typ.form := ORB.NoTyp; typ.base := NIL; typ.mno := -level; typ.nofpar := 0; typ.len := 0; offset := 0; bot := NIL;
    IF sym = ORS.lparen THEN
      ORS.Get(sym); (*record extension*)
      IF level # 0 THEN ORS.Mark("extension of local types not implemented") END ;
      IF sym = ORS.ident THEN
        qualident(base);
        IF base.class = ORB.Typ THEN
          IF base.type.form = ORB.Record THEN typ.base := base.type
          ELSE typ.base := ORB.intType; ORS.Mark("invalid extension")
          END ;
          typ.nofpar := typ.base.nofpar + 1; (*"nofpar" here abused for extension level*)
          bot := typ.base.dsc; offset := typ.base.size
        ELSE ORS.Mark("type expected")
        END
      ELSE ORS.Mark("ident expected")
      END ;
      Check(ORS.rparen, "no )")
    END ;
    WHILE sym = ORS.ident DO  (*fields*)
      n := 0; obj := bot; expo0 := TRUE;
      WHILE sym = ORS.ident DO
        obj0 := obj;
        WHILE (obj0 # NIL) & (obj0.name # ORS.id) DO obj0 := obj0.next END ;
        IF obj0 # NIL THEN ORS.Mark("mult def") END ;
        NEW(new); ORS.CopyId(new.name); new.class := ORB.Fld; new.next := obj; obj := new; INC(n);
        ORS.Get(sym); CheckExport(new.expo);
        IF ~new.expo THEN expo0 := FALSE ELSIF ~expo THEN ORS.Mark("invalid field export") END ;
        IF (sym # ORS.comma) & (sym # ORS.colon) THEN ORS.Mark("comma expected")
        ELSIF sym = ORS.comma THEN ORS.Get(sym)
        END
      END ;
      Check(ORS.colon, "colon expected"); Type(tp, expo & expo0);
      IF (tp.form = ORB.Array) & (tp.len < 0) THEN ORS.Mark("dyn array not allowed") END ;
      IF tp.size > 1 THEN offset := (offset+3) DIV 4 * 4 END ;
      offset := offset + n * tp.size; off := offset; obj0 := obj;
      WHILE obj0 # bot DO obj0.type := tp; obj0.lev := 0; off := off - tp.size; obj0.val := off; obj0 := obj0.next END ;
      bot := obj;
      IF sym = ORS.semicolon THEN ORS.Get(sym) ELSIF sym # ORS.end THEN ORS.Mark(" ; or END") END
    END ;
    typ.form := ORB.Record; typ.dsc := bot; typ.size := (offset + 3) DIV 4 * 4; type := typ
  END RecordType;
  PROCEDURE FPSection(## Variables:
```
 adr: LONGINT; ## Variables:
```
 nofpar: INTEGER);
    ## Variables:
```
 obj, first: ORB.Object; tp: ORB.Type;
    ## Variables:
```
 obj, first: ORB.Object; tp: ORB.Type;
      parsize: LONGINT; cl: INTEGER; rdo: BOOLEAN;
  BEGIN
    IF sym = ORS.var THEN ORS.Get(sym); cl := ORB.Par ELSE cl := ORB.Var END ;
    IdentList(cl, first); FormalType(tp, 0); rdo := FALSE;
    IF (cl = ORB.Var) & (tp.form >= ORB.Array) THEN cl := ORB.Par; rdo := TRUE END ;
    IF (tp.form = ORB.Array) & (tp.len < 0) OR (tp.form = ORB.Record) THEN
      parsize := 2*ORG.WordSize  (*open array or record, needs second word for length or type tag*)
    ELSE parsize := ORG.WordSize
    END ;
    obj := first;
    WHILE obj # NIL DO
      INC(nofpar); obj.class := cl; obj.type := tp; obj.rdo := rdo; obj.lev := level; obj.val := adr;
      adr := adr + parsize; obj := obj.next
    END ;
    IF adr >= 52 THEN ORS.Mark("too many parameters") END
  END FPSection;
  PROCEDURE ProcedureType(ptype: ORB.Type; ## Variables:
```
 parblksize: LONGINT);
    ## Variables:
```
 obj: ORB.Object; size: LONGINT; nofpar: INTEGER;
    ## Variables:
```
 obj: ORB.Object; size: LONGINT; nofpar: INTEGER;
  BEGIN ptype.base := ORB.noType; size := parblksize; nofpar := 0; ptype.dsc := NIL;
    IF sym = ORS.lparen THEN
      ORS.Get(sym);
      IF sym = ORS.rparen THEN ORS.Get(sym)
      ELSE FPSection(size, nofpar);
        WHILE sym = ORS.semicolon DO ORS.Get(sym); FPSection(size, nofpar) END ;
        Check(ORS.rparen, "no )")
      END ;
      IF sym = ORS.colon THEN  (*function*)
        ORS.Get(sym);
        IF sym = ORS.ident THEN
          qualident(obj); ptype.base := obj.type;
          IF ~((obj.class = ORB.Typ) & (obj.type.form IN {ORB.Byte .. ORB.Pointer, ORB.Proc})) THEN
            ORS.Mark("illegal function type")
          END
        ELSE ORS.Mark("type identifier expected")
        END
      END
    END ;
    ptype.nofpar := nofpar; parblksize := size
  END ProcedureType;
  PROCEDURE FormalType0(## Variables:
```
 typ: ORB.Type; dim: INTEGER);
    ## Variables:
```
 obj: ORB.Object; dmy: LONGINT;
    ## Variables:
```
 obj: ORB.Object; dmy: LONGINT;
  BEGIN
    IF sym = ORS.ident THEN
      qualident(obj);
      IF obj.class = ORB.Typ THEN typ := obj.type ELSE ORS.Mark("not a type"); typ := ORB.intType END
    ELSIF sym = ORS.array THEN
      ORS.Get(sym); Check(ORS.of, "OF ?");
      IF dim >= 1 THEN ORS.Mark("multi-dimensional open arrays not implemented") END ;
      NEW(typ); typ.form := ORB.Array; typ.len := -1; typ.size := 2*ORG.WordSize; 
      FormalType(typ.base, dim+1)
    ELSIF sym = ORS.procedure THEN
      ORS.Get(sym); ORB.OpenScope;
      NEW(typ); typ.form := ORB.Proc; typ.size := ORG.WordSize; dmy := 0; ProcedureType(typ, dmy);
      typ.dsc := ORB.topScope.next; ORB.CloseScope
    ELSE ORS.Mark("identifier expected"); typ := ORB.noType
    END
  END FormalType0;
  PROCEDURE InterfaceType(## Variables:
```
 type: ORB.Type; expo: BOOLEAN);
    ## Variables:
```
 obj, objr, obj0, new, bot, base, proc, redef: ORB.Object;
    ## Variables:
```
 obj, objr, obj0, new, bot, base, proc, redef: ORB.Object;
      typ, tp, ftype: ORB.Type; id, procid, recid: ORS.Ident;
      offset, off, n, parblksize: LONGINT; expo0: BOOLEAN; size: LONGINT; nofpar: INTEGER;
  BEGIN
    Check(ORS.of, "no OF");
    NEW(type); type.base := NIL; type.mno := -level; type.nofpar := 0; type.len := 0; offset := 0; bot := NIL;
    type.form := ORB.Interface; type.dsc := bot; type.size := ORG.WordSize*2; type.typobj := NIL;
  PROCEDURE Type0(## Variables:
```
 type: ORB.Type; expo: BOOLEAN);
    ## Variables:
```
 dmy: LONGINT; obj: ORB.Object; ptbase: PtrBase;
    ## Variables:
```
 dmy: LONGINT; obj: ORB.Object; ptbase: PtrBase;
  BEGIN type := ORB.intType; (*sync*)
    IF (sym # ORS.ident) & (sym < ORS.array) THEN ORS.Mark("not a type");
      REPEAT ORS.Get(sym) UNTIL (sym = ORS.ident) OR (sym >= ORS.array)
    END ;
    IF sym = ORS.ident THEN
      qualident(obj);
      IF obj.class = ORB.Typ THEN
        IF (obj.type # NIL) & (obj.type.form # ORB.NoTyp) THEN type := obj.type END
      ELSE ORS.Mark("not a type or undefined")
      END
    ELSIF sym = ORS.array THEN ORS.Get(sym); ArrayType(type, expo)
    ELSIF sym = ORS.record THEN
      ORS.Get(sym); RecordType(type, expo); Check(ORS.end, "no END")
    ELSIF sym = ORS.interface THEN ORS.Get(sym); InterfaceType(type, expo); Check(ORS.end, "no END");
    ELSIF sym = ORS.pointer THEN
      ORS.Get(sym); Check(ORS.to, "no TO");
      NEW(type);  type.form := ORB.Pointer; type.size := ORG.WordSize; type.base := ORB.intType;
      IF sym = ORS.ident THEN
        obj := ORB.thisObj();
        IF obj # NIL THEN
          IF (obj.class = ORB.Typ) & (obj.type.form IN {ORB.Record, ORB.NoTyp, ORB.Array}) THEN
            CheckRecLevel(obj.lev); type.base := obj.type
          ELSIF obj.class = ORB.Mod THEN ORS.Mark("external base type not implemented")
          ELSE ORS.Mark("no valid base type")
          END
        ELSE CheckRecLevel(level); (*enter into list of forward references to be fixed in Declarations*)
          NEW(ptbase); ORS.CopyId(ptbase.name); ptbase.type := type; ptbase.next := pbsList; pbsList := ptbase
        END ;
        ORS.Get(sym)
      ELSE Type(type.base, expo);
        IF ~(type.base.form IN {ORB.Record, ORB.Array}) OR (type.base.typobj = NIL) THEN
          ORS.Mark("must point to named record or array")
        END ;
        CheckRecLevel(level)
      END
    ELSIF sym = ORS.procedure THEN
      ORS.Get(sym); ORB.OpenScope;
      NEW(type); type.form := ORB.Proc; type.size := ORG.WordSize; dmy := 0;
      ProcedureType(type, dmy); type.dsc := ORB.topScope.next; ORB.CloseScope
    ELSE ORS.Mark("illegal type")
    END
  END Type0;
  PROCEDURE Declarations(## Variables:
```
 varsize: LONGINT);
    ## Variables:
```
 obj, first: ORB.Object;
    ## Variables:
```
 obj, first: ORB.Object;
      x: ORG.Item; tp: ORB.Type; ptbase: PtrBase;
      expo: BOOLEAN; id: ORS.Ident;
  BEGIN (*sync*) pbsList := NIL;
    IF (sym < ORS.const) & (sym # ORS.end) & (sym # ORS.return) THEN ORS.Mark("declaration?");
      REPEAT ORS.Get(sym) UNTIL (sym >= ORS.const) OR (sym = ORS.end) OR (sym = ORS.return)
    END ;
    IF sym = ORS.const THEN
      ORS.Get(sym);
      WHILE sym = ORS.ident DO
        ORS.CopyId(id); ORS.Get(sym); CheckExport(expo);
        IF sym = ORS.eql THEN ORS.Get(sym) ELSE ORS.Mark("= ?") END;
        expression(x);
        IF (x.type.form = ORB.String) & (x.b = 2) THEN ORG.StrToChar(x) END ;
        ORB.NewObj(obj, id, ORB.Const); obj.expo := expo; obj.lev := level;
        IF x.mode = ORB.Const THEN obj.type := x.type;
          IF expo & (obj.type.form = ORB.String) THEN obj.exno := exno; INC(exno) ELSE obj.exno := 0 END ;
          IF obj.type.form = ORB.String THEN obj.val := x.a (*strx*) + x.b (*len*) * C20 ELSE obj.val := x.a END
        ELSE ORS.Mark("expression not constant"); obj.type := ORB.intType
        END;
        Check(ORS.semicolon, "; missing")
      END
    END ;
    IF sym = ORS.type THEN
      ORS.Get(sym);
      WHILE sym = ORS.ident DO
        ORS.CopyId(id); ORS.Get(sym); CheckExport(expo);
        IF sym = ORS.eql THEN ORS.Get(sym) ELSE ORS.Mark("=?") END ;
        Type(tp, expo);
        ORB.NewObj(obj, id, ORB.Typ); obj.type := tp; obj.expo := expo; obj.lev := level;
        IF tp.typobj = NIL THEN tp.typobj := obj END ;
        IF expo & (obj.type.form = ORB.Record) THEN obj.exno := exno; INC(exno) ELSE obj.exno := 0 END ;
        IF tp.form IN {ORB.Record, ORB.Array} THEN
          ptbase := pbsList;  (*check whether this is base of a pointer type; search and fixup*)
          WHILE ptbase # NIL DO
            IF obj.name = ptbase.name THEN ptbase.type.base := obj.type END ;
            ptbase := ptbase.next
          END
        END ;
        Check(ORS.semicolon, "; missing")
      END
    END ;
    IF sym = ORS.var THEN
      ORS.Get(sym);
      WHILE sym = ORS.ident DO
        IdentList(ORB.Var, first); obj := first; expo := TRUE;
        WHILE (obj # NIL) & expo DO expo := obj.expo; obj := obj.next END ;
        Type(tp, expo);
        IF (tp.form = ORB.Array) & (tp.len < 0) THEN ORS.Mark("open array not allowed") END ;
        obj := first;
        WHILE obj # NIL DO
          obj.type := tp; obj.lev := level;
          IF tp.size > 1 THEN varsize := (varsize + 3) DIV 4 * 4 (*align*) END ;
          obj.val := varsize; varsize := varsize + obj.type.size;
          IF obj.expo THEN obj.exno := exno; INC(exno) END ;
          obj := obj.next
        END ;
        Check(ORS.semicolon, "; missing")
      END
    END ;
    varsize := (varsize + 3) DIV 4 * 4;
    ptbase := pbsList;
    WHILE ptbase # NIL DO
      IF ptbase.type.base.form = ORB.Int THEN ORS.Mark("undefined pointer base of") END ;
      ptbase := ptbase.next
    END ;
    IF (sym >= ORS.const) & (sym <= ORS.var) THEN ORS.Mark("declaration in bad order") END
  END Declarations;
  PROCEDURE Receiver(## Variables:
```
 class: INTEGER; ## Variables:
```
 name: ORS.Ident; ## Variables:
```
 typ, rec: ORB.Type);
    ## Variables:
```
 obj: ORB.Object;
    ## Variables:
```
 obj: ORB.Object;
  BEGIN rec := NIL;
    IF sym = ORS.var THEN ORS.Get(sym); class := ORB.Par ELSE class := ORB.Var END ;
    IF sym = ORS.ident THEN ORS.CopyId(name); ORS.Get(sym) ELSE ORS.Mark("ident?") END ;
    Check(ORS.colon, ": expected");
    IF sym = ORS.ident THEN
      qualident(obj);
      IF obj.class = ORB.Typ THEN typ := obj.type;
        IF (class = ORB.Par) & (typ.form = ORB.Record) OR
          (class = ORB.Var) & (typ.form = ORB.Pointer) & (typ.base.form = ORB.Record) THEN
          IF typ.form = ORB.Pointer THEN rec := typ.base ELSE rec := typ END ;
          IF rec.mno # -level THEN ORS.Mark("must be bound to record of same scope"); rec := NIL END
        ELSE ORS.Mark("invalid receiver type")
        END
      ELSE ORS.Mark("receiver type expected")
      END
    ELSE ORS.Mark("type identifier expected")
    END ;
    Check(ORS.rparen, "no )")
  END Receiver;
    ## Variables:
```
 proc, redef, obj: ORB.Object;
      type, typ, rec: ORB.Type;
      procid, recid: ORS.Ident;
      parblksize: LONGINT; class: INTEGER;
      int, expo: BOOLEAN;
      ## Variables:
```
 x: ORG.Item; locblksize: LONGINT;
    BEGIN Check(ORS.semicolon, "no ;"); locblksize := parblksize;
      Declarations(locblksize); proc.type.dsc := ORB.topScope.next;
      WHILE sym = ORS.procedure DO ProcedureDecl; Check(ORS.semicolon, "no ;") END ;
      ORG.FixLink(proc.type.len);  (*fix forward references generated in ORG*)
      proc.val := ORG.Here() * 4; proc.type.dsc := ORB.topScope.next;
      ORG.Enter(parblksize, locblksize, int);
      IF sym = ORS.begin THEN ORS.Get(sym); StatSequence END ;
      IF sym = ORS.return THEN
        ORS.Get(sym); expression(x);
        IF proc.type.base = ORB.noType THEN ORS.Mark("this is not a function")
        ELSIF ~CompTypes(proc.type.base, x.type, FALSE) THEN ORS.Mark("wrong result type")
        END
      ELSIF proc.type.base.form # ORB.NoTyp THEN
        ORS.Mark("function without result"); proc.type.base := ORB.noType
      END ;
      ORG.Return(proc.type.base.form, x, locblksize, int); Check(ORS.end, "no END");
      IF sym = ORS.ident THEN
        IF ORS.id # proc.name THEN ORS.Mark("no match") END ;
        ORS.Get(sym)
      ELSE ORS.Mark("no proc id")
      END
    END Body;
    ## Variables:
```
 impid, impid1: ORS.Ident;
  BEGIN
    REPEAT ORS.Get(sym);
      IF sym = ORS.ident THEN
        ORS.CopyId(impid); ORS.Get(sym);
        IF sym = ORS.becomes THEN
          ORS.Get(sym);
          IF sym = ORS.ident THEN ORS.CopyId(impid1); ORS.Get(sym)
          ELSE ORS.Mark("id expected"); impid1 := impid
          END
        ELSE impid1 := impid
        END ;
        ORB.Import(impid, impid1)
      ELSE ORS.Mark("id expected")
      END
    UNTIL sym # ORS.comma
  END ImportList;
    ## Variables:
```
 key: LONGINT;
  BEGIN Texts.WriteString(W, "  compiling "); ORS.Get(sym);
    IF sym = ORS.module THEN
      ORS.Get(sym);
      IF sym = ORS.times THEN version := 0; dc := 8; Texts.Write(W, "*"); ORS.Get(sym) ELSE dc := 0; version := 1 END ;
      ORB.Init; ORB.OpenScope;
      IF sym = ORS.ident THEN
        ORS.CopyId(modid); ORS.Get(sym);
        Texts.WriteString(W, modid); Texts.Append(Oberon.Log, W.buf)
      ELSE ORS.Mark("identifier expected")
      END ;
      Check(ORS.semicolon, "no ;"); level := 0; exno := 1; key := 0;
      IF sym = ORS.import THEN ImportList; Check(ORS.semicolon, "; missing") END ;
      ORG.Open(version); Declarations(dc); ORG.SetDataSize((dc + 3) DIV 4 * 4);
      WHILE sym = ORS.procedure DO ProcedureDecl; Check(ORS.semicolon, "no ;") END ;
      ORG.Header;
      IF sym = ORS.begin THEN ORS.Get(sym); StatSequence END ;
      Check(ORS.end, "no END");
      IF sym = ORS.ident THEN
        IF ORS.id # modid THEN ORS.Mark("no match") END ;
        ORS.Get(sym)
      ELSE ORS.Mark("identifier missing")
      END ;
      IF sym # ORS.period THEN ORS.Mark("period missing") END ;
      IF (ORS.errcnt = 0) & (version # 0) THEN
        ORB.Export(modid, newSF, key);
        IF newSF THEN Texts.WriteString(W, " new symbol file") END
      END ;
      IF ORS.errcnt = 0 THEN
        ORG.Close(modid, key, exno);
        Texts.WriteInt(W, ORG.pc, 6); Texts.WriteInt(W, dc, 6); Texts.WriteHex(W, key)
      ELSE Texts.WriteLn(W); Texts.WriteString(W, "compilation FAILED")
      END ;
      Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf);
      ORB.CloseScope; pbsList := NIL
    ELSE ORS.Mark("must start with MODULE")
    END
  END Module;
  PROCEDURE Option(## Variables:
```
 S: Texts.Scanner);
  BEGIN newSF := FALSE;
    IF S.nextCh = "/" THEN
      Texts.Scan(S); Texts.Scan(S);
      IF (S.class = Texts.Name) & (S.s[0] = "s") THEN newSF := TRUE END
    END
  END Option;
    ## Variables:
```
 beg, end, time: LONGINT; res: INTEGER;
      T: Texts.Text;
      S: Texts.Scanner;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S); res := 0;
    IF S.class = Texts.Char THEN
      IF S.c = "@" THEN
        Option(S); Oberon.GetSelection(T, beg, end, time);
        IF time >= 0 THEN ORS.Init(T, beg); Module; res := ORS.errcnt END
      ELSIF S.c = "^" THEN
        Option(S); Oberon.GetSelection(T, beg, end, time);
        IF time >= 0 THEN
          Texts.OpenScanner(S, T, beg); Texts.Scan(S);
          IF S.class = Texts.Name THEN
            Texts.WriteString(W, S.s); NEW(T); Texts.Open(T, S.s);
            IF T.len > 0 THEN ORS.Init(T, 0); Module; res := ORS.errcnt END
          END
        END
      END
    ELSE 
      WHILE S.class = Texts.Name DO
        NEW(T); Texts.Open(T, S.s);
        IF T.len > 0 THEN Option(S); ORS.Init(T, 0); Module; res := ORS.errcnt
        ELSE Texts.WriteString(W, S.s); Texts.WriteString(W, " not found");
          Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf)
        END ;
        IF (T.len # 0) & (ORS.errcnt = 0) THEN Texts.Scan(S) ELSE S.class := 0 END
      END
    END ;
    Oberon.Collect(0); Oberon.Return(res)
  END Compile;
```
## Procedures:
---
## Checking Symbols and Types
---
**Check** consumes the current token if it matches the expected symbol, otherwise an error is marked.

`  PROCEDURE Check(s: INTEGER; msg: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L105)

---
**Qualident** generates a reference to a previously defined item if possible otherwise an error is marked.

`  PROCEDURE qualident(VAR obj: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L114)

---
**CheckBool** marks an error if the item is not a boolean.

`  PROCEDURE CheckBool(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L132)

---
**CheckInt** marks an error if the item is not an Int.

`  PROCEDURE CheckInt(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L141)

---
**CheckReal** marks an error if the item is not a Real.

`  PROCEDURE CheckReal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L150)

---
**CheckSet** marks an error if the item is not a Set.

`  PROCEDURE CheckSet(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L159)

---
**CheckSetVal** marks an error if the item is not a Set Value.

`  PROCEDURE CheckSetVal(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L168)

---
**CheckConst** marks an error if the value is not a Constant.

`  PROCEDURE CheckConst(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L180)

---
**CheckReadOnly** marks an error if the value is not read-only.

`  PROCEDURE CheckReadOnly(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L189)

---
**CheckExport** checks for an export symbol and marks an error if export not at top level.

`  PROCEDURE CheckExport(VAR expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L198)

---
**IsExtension** determines if type t1 is an extension of t0.

`  PROCEDURE IsExtension(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L211)

---
**CheckReceiver** ensures that an object is compatible with its receiver or marks an error.

`  PROCEDURE CheckReceiver(proc: ORB.Object; deref: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L220)

---
**DisallowedMethods** blocks methods from binding to rec and its base types.

`  PROCEDURE DisallowMethods(rec: ORB.Type);  (*disallow binding methods to rec and its base types*)` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L229)

## Expressions
---
**TypeTest** marks an error if the form of x is incompatible with T. If compatible, x.type is set to T.

`  PROCEDURE TypeTest(VAR x: ORG.Item; T: ORB.Type; guard: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L244)

---
**selector** generates the array item, procedure, or method dereference on an array or record.

`  PROCEDURE selector(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L271)

---
**EqualSignatures** verifies that a procedure may be assigned to a procedure variable.

`  PROCEDURE EqualSignatures(t0, t1: ORB.Type): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L348)

---
**CompTypes** verifies assigment compatibility by type.

`  PROCEDURE CompTypes(t0, t1: ORB.Type; varpar: BOOLEAN): BOOLEAN;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L379)

---
**Parameter** consumes a function call parameter and produces function call proloogue code for the parameter.

`  PROCEDURE Parameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L394)

---
**IParameter** consumes an Interface call parameter and produces Interface call prologue code for the parameter.

`  PROCEDURE IParameter(par: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L426)

---
**ParamList** consumes the function call parameters, resulting in a function call prologue.

`  PROCEDURE ParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L458)

---
**IParamList** consumes the Interface call parameters, resulting in a Interface call prologue.

`  PROCEDURE IParamList(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L484)

---
**StandFunc** consumes standard language functions and produces inline code for those functions.

Standard functions include: `ABS` `ODD` `FLOOR` `FLT` `ORD` `CHR` `LEN` `ADC` `SBC` `UML` `BIT` `REG` `VAL` `ADR` `SIZE` `COND` `H`

`  PROCEDURE StandFunc(VAR x: ORG.Item; fct: LONGINT; restyp: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L512)

---
**element** produces a reference to an element in a set.

`  PROCEDURE element(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L560)

---
**set** produces a set from elements.

`  PROCEDURE set(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L573)

---
**factor** generates code that produces a value from identifiers, applications of functions and procedures, etc. for use in a calculation or assignment.

`  PROCEDURE factor(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L591)

---
**term** combines factors via multiplication and division, resulting in a value.

`  PROCEDURE term(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L627)

---
**SimpleExpression** combines terms via addition, subtraction, boolean, and set operations, resulting in a value.

`  PROCEDURE SimpleExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L654)

---
**expression0** produces code handling arbitrary arithmetic and logical operations, resulting in a value.

expression0 is assigned to the procedure variable `expression` to allow the forward reference.


`  PROCEDURE expression0(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L679)

## Statements
---
**StandProc** prepares a standard procedure for later reference in code.

`  PROCEDURE StandProc(pno: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L731)



`  PROCEDURE StatSequence;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L781)


`    PROCEDURE TypeCase(obj: ORB.Object; VAR L0: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L786)



`    PROCEDURE TypeCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L803)



`    PROCEDURE CaseLabel(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L816)



`    PROCEDURE NumericCase(LabelForm: INTEGER; VAR n: INTEGER; VAR tab: ARRAY OF ORG.LabelRange);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L827)



`    PROCEDURE CaseExpression(VAR x: ORG.Item);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L857)


`    PROCEDURE NumericCasePart;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L862)


## Types and Declarations


`  PROCEDURE IdentList(class: INTEGER; VAR first: ORB.Object);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L988)



`  PROCEDURE ArrayType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1007)



`  PROCEDURE RecordType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1030)



`  PROCEDURE FPSection(VAR adr: LONGINT; VAR nofpar: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1079)



`  PROCEDURE ProcedureType(ptype: ORB.Type; VAR parblksize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1101)



`  PROCEDURE FormalType0(VAR typ: ORB.Type; dim: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1128)



`  PROCEDURE CheckRecLevel(lev: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1150)



`  PROCEDURE InterfaceType(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1158)



`  PROCEDURE Type0(VAR type: ORB.Type; expo: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1191)



`  PROCEDURE Declarations(VAR varsize: LONGINT);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1239)



`  PROCEDURE Receiver(VAR class: INTEGER; VAR name: ORS.Ident; VAR typ, rec: ORB.Type);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1312)



`  PROCEDURE ProcedureDecl;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1337)



`    PROCEDURE Body(proc: ORB.Object; parblksize: LONGINT; int: BOOLEAN);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1347)



`  PROCEDURE ImportList;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1416)



`  PROCEDURE Module;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1438)



`  PROCEDURE Option(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1481)



`  PROCEDURE Compile*;` [(source)](https://github.com/io-core/Build/blob/main/ORP.Mod#L1492)

