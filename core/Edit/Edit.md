
## [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)

  ## imports:
` Files Fonts Texts Input Display Viewers Oberon MenuViewers TextFrames`
## Procedures:
---

`  PROCEDURE Max(i, j: LONGINT): LONGINT;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L36)


`  PROCEDURE FocusViewer(): Viewers.Viewer;  (*for Extended Oberon*)` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L42)


`  PROCEDURE Open*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L46)


`  PROCEDURE Store*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L66)


`    PROCEDURE Backup (VAR name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L73)


`  PROCEDURE CopyLooks*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L99)


`  PROCEDURE ChangeFont*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L116)


`  PROCEDURE ChangeColor*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L128)


`  PROCEDURE ChangeOffset*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L140)


`  PROCEDURE Search*;  (*uses global variables M, pat, d for Boyer-Moore search*)` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L152)


`    PROCEDURE Forward(n: INTEGER; VAR R: Texts.Reader; VAR buf: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L160)


`  PROCEDURE Locate*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L201)


`  PROCEDURE Recall*;` [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L226)

