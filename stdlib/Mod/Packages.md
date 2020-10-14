
## [MODULE Packages](https://github.com/io-core/Mod/blob/main/Packages.Mod)

Procedures:


<code>  PROCEDURE New*(C: Component);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L76)


<code>  PROCEDURE Add*(P: Package; C: Component);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L80)


<code>  PROCEDURE ThisComponent*(P: Package; x, y: INTEGER): Component;</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L85)


<code>  PROCEDURE SelectComponent*(P: Package; C: Component);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L92)


<code>  PROCEDURE SelectArea*(P: Package; x0, y0, x1, y1: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L97)


<code>  PROCEDURE Draw*(P: Package; VAR m: Msg);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L111)


<code>  PROCEDURE List*(P: Package);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L118)


<code>  PROCEDURE Deselect*(P: Package);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L133)


<code>  PROCEDURE DrawSel*(P: Package; VAR m: Msg);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L139)


<code>  PROCEDURE Change*(P: Package; VAR m: Msg);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L148)


<code>  PROCEDURE WriteFile*(P: Package; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L159)


<code>  PROCEDURE SetWidth*(w: INTEGER);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L167)


<code>  PROCEDURE Open*(P: Package; name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L172)


<code>  PROCEDURE Delete*(P: Package);</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L189)


<code>  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg));</code> [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L208)

