## Mod
This package provides source code package management in Oberon.



#### [MODULE PackageFrames](https://github.com/io-core/doc/blob/main/stdlib/Mod/PackageFrames.md) [(source)](https://github.com/io-core/Mod/blob/main/PackageFrames.Mod)

Procedures:
```
  Restore*(f: Frame)

  Focus*(): Frame

  Selected*(): Frame

  This*(x, y: INTEGER): Frame

  Draw*(f: Frame)

  Erase*(f: Frame)

  DrawComponent*(f: Frame; L: Packages.Component)

  EraseComponent*(f: Frame; C: Packages.Component)

  Change*(f: Frame; VAR msg: Packages.Msg)

  Defocus*(f: Frame)

  Deselect*(f: Frame)

  Handle*(f: Display.Frame; VAR m: Display.FrameMsg)

  Store*(f: Frame; name: ARRAY OF CHAR)

  ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER)

  ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER)

  Open*(f: Frame; P: Packages.Package)

```


#### [MODULE Mod](https://github.com/io-core/doc/blob/main/stdlib/Mod/Mod.md) [(source)](https://github.com/io-core/Mod/blob/main/Mod.Mod)

Procedures:
```
  Open*

  Delete*

  SetWidth*

  ChangeColor*

  ChangeWidth*

  ChangeFont*

  Ticks*

  Restore*

  Store*

  Macro*

```


#### [MODULE Packages](https://github.com/io-core/doc/blob/main/stdlib/Mod/Packages.md) [(source)](https://github.com/io-core/Mod/blob/main/Packages.Mod)

Procedures:
```
          read*:(C: Component; VAR r: Files.Rider); (*; VAR c: Context) *)

          write*:(C: Component; cno: INTEGER; VAR r: Files.Rider); (*; VAR c: Context)*)

  New*(C: Component)

  Add*(P: Package; C: Component)

  ThisComponent*(P: Package; x, y: INTEGER): Component

  SelectComponent*(P: Package; C: Component)

  SelectArea*(P: Package; x0, y0, x1, y1: INTEGER)

  Draw*(P: Package; VAR m: Msg)

  List*(P: Package)

  Deselect*(P: Package)

  DrawSel*(P: Package; VAR m: Msg)

  Change*(P: Package; VAR m: Msg)

  WriteFile*(P: Package; name: ARRAY OF CHAR)

  SetWidth*(w: INTEGER)

  Open*(P: Package; name: ARRAY OF CHAR)

  Delete*(P: Package)

  InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (C: Component; VAR msg: Msg))

```


#### [MODULE Resources](https://github.com/io-core/doc/blob/main/stdlib/Mod/Resources.md) [(source)](https://github.com/io-core/Mod/blob/main/Resources.Mod)

Procedures:
```
  New*(R: Resource; v: INTEGER) : Resource

  Get*(R: Resource; x: INTEGER): INTEGER

  Clear*(R: Resource)

```
