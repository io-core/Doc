
#### [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)

Procedures:

```
  PROCEDURE Max(i, j: LONGINT): LONGINT;
```
```
  PROCEDURE FocusViewer(): Viewers.Viewer;  (*for Extended Oberon*)
```
```
  PROCEDURE Open*;
```
```
  PROCEDURE Store*;
```
```
    PROCEDURE Backup (VAR name: ARRAY OF CHAR);
```
```
  PROCEDURE CopyLooks*;
```
```
  PROCEDURE ChangeFont*;
```
```
  PROCEDURE ChangeColor*;
```
```
  PROCEDURE ChangeOffset*;
```
```
  PROCEDURE Search*;  (*uses global variables M, pat, d for Boyer-Moore search*)
```
```
    PROCEDURE Forward(n: INTEGER; VAR R: Texts.Reader; VAR buf: ARRAY OF CHAR);
```
```
  PROCEDURE Locate*;
```
```
  PROCEDURE Recall*;
```
