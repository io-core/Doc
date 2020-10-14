
## [MODULE GraphicFrames](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

Procedures:


<code>  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L76)


<code>  PROCEDURE Restore*(F: Frame);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L85)


<code>  PROCEDURE FlipCross(X, Y: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L102)


<code>  PROCEDURE Focus*(): Frame;</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L113)


<code>  PROCEDURE Selected*(): Frame;</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L118)


<code>  PROCEDURE This*(x, y: INTEGER): Frame;</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L123)


<code>  PROCEDURE Mark(F: Frame; mode: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L128)


<code>  PROCEDURE Draw*(F: Frame);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L133)


<code>  PROCEDURE DrawNorm(F: Frame);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L138)


<code>  PROCEDURE Erase*(F: Frame);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L143)


<code>  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L148)


<code>  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L153)


<code>  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L158)


<code>  PROCEDURE FlipMark(x, y: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L163)


<code>  PROCEDURE Defocus*(F: Frame);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L169)


<code>  PROCEDURE Deselect*(F: Frame);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L179)


<code>  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L188)


<code>  PROCEDURE CaptionCopy(F: Frame;</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L211)


<code>  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L232)


<code>  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L239)


<code>  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L324)


<code>  PROCEDURE InsertChar(F: Frame; ch: CHAR);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L332)


<code>  PROCEDURE DeleteChar(F: Frame);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L342)


<code>  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L357)


<code>  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L367)


<code>  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L425)


<code>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L431)


<code>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L440)


<code>  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L449)


<code>  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L469)


<code>  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);</code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L498)


<code>  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); </code> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L518)

