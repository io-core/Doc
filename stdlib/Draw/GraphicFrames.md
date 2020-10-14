
## [MODULE GraphicFrames](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod)

Procedures:


<pre>  PROCEDURE SetChangeMark(F: Frame; col: INTEGER); (*set mark in corner of frame*)</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L76)


<pre>  PROCEDURE Restore*(F: Frame);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L85)


<pre>  PROCEDURE FlipCross(X, Y: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L102)


<pre>  PROCEDURE Focus*(): Frame;</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L113)


<pre>  PROCEDURE Selected*(): Frame;</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L118)


<pre>  PROCEDURE This*(x, y: INTEGER): Frame;</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L123)


<pre>  PROCEDURE Mark(F: Frame; mode: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L128)


<pre>  PROCEDURE Draw*(F: Frame);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L133)


<pre>  PROCEDURE DrawNorm(F: Frame);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L138)


<pre>  PROCEDURE Erase*(F: Frame);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L143)


<pre>  PROCEDURE DrawObj*(F: Frame; obj: Graphics.Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L148)


<pre>  PROCEDURE EraseObj*(F: Frame; obj: Graphics.Object);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L153)


<pre>  PROCEDURE Change*(F: Frame; VAR msg: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L158)


<pre>  PROCEDURE FlipMark(x, y: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L163)


<pre>  PROCEDURE Defocus*(F: Frame);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L169)


<pre>  PROCEDURE Deselect*(F: Frame);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L179)


<pre>  PROCEDURE Macro*(Lname, Mname: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L188)


<pre>  PROCEDURE CaptionCopy(F: Frame;</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L211)


<pre>  PROCEDURE NewLine(F: Frame; G: Graphics.Graph; x, y, w, h: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L232)


<pre>  PROCEDURE Edit(F: Frame; x0, y0: INTEGER; k0: SET);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L239)


<pre>  PROCEDURE NewCaption(F: Frame; col: INTEGER; font: Fonts.Font);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L324)


<pre>  PROCEDURE InsertChar(F: Frame; ch: CHAR);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L332)


<pre>  PROCEDURE DeleteChar(F: Frame);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L342)


<pre>  PROCEDURE GetSelection(F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L357)


<pre>  PROCEDURE Handle*(G: Display.Frame; VAR M: Display.FrameMsg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L367)


<pre>  PROCEDURE Store*(F: Frame; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L425)


<pre>  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L431)


<pre>  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L440)


<pre>  PROCEDURE DrawLine(obj: Graphics.Object; VAR M: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L449)


<pre>  PROCEDURE DrawCaption(obj: Graphics.Object; VAR M: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L469)


<pre>  PROCEDURE DrawMacro(obj: Graphics.Object; VAR M: Graphics.Msg);</pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L498)


<pre>  PROCEDURE Open*(G: Frame; graph: Graphics.Graph); </pre> [(source)](https://github.com/io-core/Draw/blob/main/GraphicFrames.Mod#L518)

