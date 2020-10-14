
## [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)

Procedures:

[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L36) `  PROCEDURE Max(i, j: LONGINT): LONGINT;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L42) `  PROCEDURE FocusViewer(): Viewers.Viewer;  (*for Extended Oberon*)`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L46) `  PROCEDURE Open*;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L66) `  PROCEDURE Store*;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L73) `    PROCEDURE Backup (VAR name: ARRAY OF CHAR);`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L99) `  PROCEDURE CopyLooks*;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L116) `  PROCEDURE ChangeFont*;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L128) `  PROCEDURE ChangeColor*;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L140) `  PROCEDURE ChangeOffset*;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L152) `  PROCEDURE Search*;  (*uses global variables M, pat, d for Boyer-Moore search*)`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L160) `    PROCEDURE Forward(n: INTEGER; VAR R: Texts.Reader; VAR buf: ARRAY OF CHAR);`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L201) `  PROCEDURE Locate*;`
[](https://github.com/io-core/Edit/blob/main/Edit.Mod#L226) `  PROCEDURE Recall*;`
