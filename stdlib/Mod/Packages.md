
## [MODULE Packages](https://github.com/io-core/Mod/blob/main/Packages.Mod)

  **imports** SYSTEM Files Fonts Resources
## Procedures
---

`  PROCEDURE New*(C: Component);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L76)


`  PROCEDURE Add*(P: Package; C: Component);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L80)


`  PROCEDURE ThisComponent*(P: Package; x, y: INTEGER): Component;` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L85)


`  PROCEDURE SelectComponent*(P: Package; C: Component);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L92)


`  PROCEDURE SelectArea*(P: Package; x0, y0, x1, y1: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L97)


`  PROCEDURE Draw*(P: Package; VAR m: Msg);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L111)


`  PROCEDURE List*(P: Package);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L118)


`  PROCEDURE Deselect*(P: Package);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L133)


`  PROCEDURE DrawSel*(P: Package; VAR m: Msg);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L139)


`  PROCEDURE Change*(P: Package; VAR m: Msg);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L148)


`  PROCEDURE WriteFile*(P: Package; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L159)


`  PROCEDURE SetWidth*(w: INTEGER);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L167)


`  PROCEDURE Open*(P: Package; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L172)


`  PROCEDURE Delete*(P: Package);` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L189)


`  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg));` [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod#L208)

