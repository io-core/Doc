
## [MODULE Packages](https://github.com/io-core/Mod/blob/main/Packages.Mod)

Procedures:


<pre>  PROCEDURE New*(C: Component);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L76)


<pre>  PROCEDURE Add*(P: Package; C: Component);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L80)


<pre>  PROCEDURE ThisComponent*(P: Package; x, y: INTEGER): Component;</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L85)


<pre>  PROCEDURE SelectComponent*(P: Package; C: Component);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L92)


<pre>  PROCEDURE SelectArea*(P: Package; x0, y0, x1, y1: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L97)


<pre>  PROCEDURE Draw*(P: Package; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L111)


<pre>  PROCEDURE List*(P: Package);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L118)


<pre>  PROCEDURE Deselect*(P: Package);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L133)


<pre>  PROCEDURE DrawSel*(P: Package; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L139)


<pre>  PROCEDURE Change*(P: Package; VAR m: Msg);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L148)


<pre>  PROCEDURE WriteFile*(P: Package; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L159)


<pre>  PROCEDURE SetWidth*(w: INTEGER);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L167)


<pre>  PROCEDURE Open*(P: Package; name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L172)


<pre>  PROCEDURE Delete*(P: Package);</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L189)


<pre>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg));</pre> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L208)

