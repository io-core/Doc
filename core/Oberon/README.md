The [Oberon](./Oberon/README.md) package implements the user-interface and task loop of the system.


#### [MODULE Display](https://github.com/io-core/Oberon/blob/main/Display.Mod)
##### Procedures:
* Handle*(F: Frame; VAR M: FrameMsg)
* Dot*(col, x, y, mode: INTEGER)
* ReplConst*(col, x, y, w, h, mode: INTEGER)
* CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER)  (*only for modes = paint, invert*)
* CopyPatternClipped*(col, patadr, x, y, left, right, top, bot, mode: INTEGER)  (*only for modes = paint, invert*)
* CopyPattern*(col, patadr, x, y, mode: INTEGER)  (*only for modes = paint, invert*)
* CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER) (*only for mode = replace*)
* CopyImage*(sx, sy, sw, sh, sdepth, sspan, dx, dy, ddepth, dspan, mode: INTEGER) (*only for mode = replace*)
* CopyBlock*(sx, sy, w, h, dx, dy, mode: INTEGER)
* ReplPattern*(col, patadr, x, y, w, h, mode: INTEGER)

#### [MODULE Viewers](https://github.com/io-core/Oberon/blob/main/Viewers.Mod)
##### Procedures:

#### [MODULE MenuViewers](https://github.com/io-core/Oberon/blob/main/MenuViewers.Mod)
##### Procedures:

#### [MODULE Oberon](https://github.com/io-core/Oberon/blob/main/Oberon.Mod)
##### Procedures:
* Clock*(): LONGINT
* Time*(): LONGINT
* DrawMouse*(m: Marker; x, y: INTEGER)
* DrawMouseArrow*(x, y: INTEGER)
* FadeMouse*
* MouseOn*(): BOOLEAN
* DrawPointer*(m: Marker; x, y: INTEGER)
* DrawPointerArrow*(x, y: INTEGER)
* DrawPointerStar*(x, y: INTEGER)
* FadePointer*
* PointerOn*(): BOOLEAN
* SetPar*(F: Display.Frame; T: Texts.Text; pos: LONGINT; res: INTEGER)
* ClearPar*
* Return*(n: INTEGER)
* Call*(F: Display.Frame; T: Texts.Text; pos: LONGINT; new: BOOLEAN)
* Run*(F: Display.Frame; T: Texts.Text; pos: LONGINT)  (*execute multiple commands separated by  *)
* Batch*
* NewTask*(h: Handler; period: INTEGER): Task
* Loop*
* Reset*

#### [MODULE Input](https://github.com/io-core/Oberon/blob/main/Input.Mod)
##### Procedures:
* Available*(): INTEGER
* Read*(VAR ch: CHAR)
* Mouse*(VAR keys: SET; VAR x, y: INTEGER)
* Mouse*(VAR keys: SET; VAR x, y: INTEGER)
* SetMouseLimits*(w, h: INTEGER)
* Init*
