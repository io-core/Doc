
## [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)

Procedures:

[36](https://github.com/io-core/Edit/blob/main/Edit.Mod#36) `  PROCEDURE Max(i, j: LONGINT): LONGINT;`
[42](https://github.com/io-core/Edit/blob/main/Edit.Mod#42) `  PROCEDURE FocusViewer(): Viewers.Viewer;  (*for Extended Oberon*)`
[46](https://github.com/io-core/Edit/blob/main/Edit.Mod#46) `  PROCEDURE Open*;`
[66](https://github.com/io-core/Edit/blob/main/Edit.Mod#66) `  PROCEDURE Store*;`
[73](https://github.com/io-core/Edit/blob/main/Edit.Mod#73) `    PROCEDURE Backup (VAR name: ARRAY OF CHAR);`
[99](https://github.com/io-core/Edit/blob/main/Edit.Mod#99) `  PROCEDURE CopyLooks*;`
[116](https://github.com/io-core/Edit/blob/main/Edit.Mod#116) `  PROCEDURE ChangeFont*;`
[128](https://github.com/io-core/Edit/blob/main/Edit.Mod#128) `  PROCEDURE ChangeColor*;`
[140](https://github.com/io-core/Edit/blob/main/Edit.Mod#140) `  PROCEDURE ChangeOffset*;`
[152](https://github.com/io-core/Edit/blob/main/Edit.Mod#152) `  PROCEDURE Search*;  (*uses global variables M, pat, d for Boyer-Moore search*)`
[160](https://github.com/io-core/Edit/blob/main/Edit.Mod#160) `    PROCEDURE Forward(n: INTEGER; VAR R: Texts.Reader; VAR buf: ARRAY OF CHAR);`
[201](https://github.com/io-core/Edit/blob/main/Edit.Mod#201) `  PROCEDURE Locate*;`
[226](https://github.com/io-core/Edit/blob/main/Edit.Mod#226) `  PROCEDURE Recall*;`
