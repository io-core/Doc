
## [MODULE Stars](https://github.com/io-core/System/blob/main/Stars.Mod)

  ## Imports:
` SYSTEM Display Viewers Texts Oberon MenuViewers TextFrames`

## Constants:
```
 N = 6;  (*nof stars*)
    w = 16;   (*width of star*)
    interval = 200;  (*millisec*)

```
## Types:
```
 Frame = POINTER TO FrameDesc;
    Pos = RECORD x, y, dx, dy: INTEGER END ;
    FrameDesc = RECORD (Display.FrameDesc) s: ARRAY N OF Pos END ;
    RestoreMsg = RECORD (Display.FrameMsg) END ;
    StepMsg = RECORD (Display.FrameMsg) END ;

```
## Variables:
```
 T: Oberon.Task;
    W: Texts.Writer;

```
## Procedures:
---

`  PROCEDURE Draw(x, y: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L17)


`  PROCEDURE Restore(F: Frame);` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L21)


`  PROCEDURE Move(F: Frame; VAR p: Pos);` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L34)


`  PROCEDURE Steps(F: Frame);` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L43)


`  PROCEDURE Handle(F: Display.Frame; VAR M: Display.FrameMsg);` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L49)


`  PROCEDURE Step*;` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L67)


`  PROCEDURE Open*;` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L75)


`  PROCEDURE Run*;` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L84)


`  PROCEDURE Stop*;` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L88)


`  PROCEDURE Close*;` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L92)


`  PROCEDURE Step1;` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L97)


`  PROCEDURE SetPeriod*;` [(source)](https://github.com/io-core/System/blob/main/Stars.Mod#L102)

