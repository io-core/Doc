
## [MODULE Packages](https://github.com/io-core/Mod/blob/main/Packages.Mod)

Procedures:

[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L76) `  PROCEDURE New*(C: Component);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L80) `  PROCEDURE Add*(P: Package; C: Component);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L85) `  PROCEDURE ThisComponent*(P: Package; x, y: INTEGER): Component;`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L92) `  PROCEDURE SelectComponent*(P: Package; C: Component);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L97) `  PROCEDURE SelectArea*(P: Package; x0, y0, x1, y1: INTEGER);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L111) `  PROCEDURE Draw*(P: Package; VAR m: Msg);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L118) `  PROCEDURE List*(P: Package);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L133) `  PROCEDURE Deselect*(P: Package);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L139) `  PROCEDURE DrawSel*(P: Package; VAR m: Msg);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L148) `  PROCEDURE Change*(P: Package; VAR m: Msg);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L159) `  PROCEDURE WriteFile*(P: Package; name: ARRAY OF CHAR);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L167) `  PROCEDURE SetWidth*(w: INTEGER);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L172) `  PROCEDURE Open*(P: Package; name: ARRAY OF CHAR);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L189) `  PROCEDURE Delete*(P: Package);`
[](https://github.com/io-core/Mod/blob/main/Packages.Mod#L208) `  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg));`
