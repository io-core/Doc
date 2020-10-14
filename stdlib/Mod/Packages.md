
## [MODULE Packages](https://github.com/io-core/Mod/blob/main/Packages.Mod)

Procedures:

```
[76](https://github.com/io-core/Mod/blob/main/Packages.Mod#76)    PROCEDURE New*(C: Component);
```
```
[80](https://github.com/io-core/Mod/blob/main/Packages.Mod#80)    PROCEDURE Add*(P: Package; C: Component);
```
```
[85](https://github.com/io-core/Mod/blob/main/Packages.Mod#85)    PROCEDURE ThisComponent*(P: Package; x, y: INTEGER): Component;
```
```
[92](https://github.com/io-core/Mod/blob/main/Packages.Mod#92)    PROCEDURE SelectComponent*(P: Package; C: Component);
```
```
[97](https://github.com/io-core/Mod/blob/main/Packages.Mod#97)    PROCEDURE SelectArea*(P: Package; x0, y0, x1, y1: INTEGER);
```
```
[111](https://github.com/io-core/Mod/blob/main/Packages.Mod#111)    PROCEDURE Draw*(P: Package; VAR m: Msg);
```
```
[118](https://github.com/io-core/Mod/blob/main/Packages.Mod#118)    PROCEDURE List*(P: Package);
```
```
[133](https://github.com/io-core/Mod/blob/main/Packages.Mod#133)    PROCEDURE Deselect*(P: Package);
```
```
[139](https://github.com/io-core/Mod/blob/main/Packages.Mod#139)    PROCEDURE DrawSel*(P: Package; VAR m: Msg);
```
```
[148](https://github.com/io-core/Mod/blob/main/Packages.Mod#148)    PROCEDURE Change*(P: Package; VAR m: Msg);
```
```
[159](https://github.com/io-core/Mod/blob/main/Packages.Mod#159)    PROCEDURE WriteFile*(P: Package; name: ARRAY OF CHAR);
```
```
[167](https://github.com/io-core/Mod/blob/main/Packages.Mod#167)    PROCEDURE SetWidth*(w: INTEGER);
```
```
[172](https://github.com/io-core/Mod/blob/main/Packages.Mod#172)    PROCEDURE Open*(P: Package; name: ARRAY OF CHAR);
```
```
[189](https://github.com/io-core/Mod/blob/main/Packages.Mod#189)    PROCEDURE Delete*(P: Package);
```
```
[208](https://github.com/io-core/Mod/blob/main/Packages.Mod#208)    PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg));
```
