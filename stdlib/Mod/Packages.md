
## [MODULE Packages](https://github.com/io-core/Mod/blob/main/Packages.Mod)

Procedures:

```
  PROCEDURE New*(C: Component);
```
```
  PROCEDURE Add*(P: Package; C: Component);
```
```
  PROCEDURE ThisComponent*(P: Package; x, y: INTEGER): Component;
```
```
  PROCEDURE SelectComponent*(P: Package; C: Component);
```
```
  PROCEDURE SelectArea*(P: Package; x0, y0, x1, y1: INTEGER);
```
```
  PROCEDURE Draw*(P: Package; VAR m: Msg);
```
```
  PROCEDURE List*(P: Package);
```
```
  PROCEDURE Deselect*(P: Package);
```
```
  PROCEDURE DrawSel*(P: Package; VAR m: Msg);
```
```
  PROCEDURE Change*(P: Package; VAR m: Msg);
```
```
  PROCEDURE WriteFile*(P: Package; name: ARRAY OF CHAR);
```
```
  PROCEDURE SetWidth*(w: INTEGER);
```
```
  PROCEDURE Open*(P: Package; name: ARRAY OF CHAR);
```
```
  PROCEDURE Delete*(P: Package);
```
```
  PROCEDURE InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg));
```
