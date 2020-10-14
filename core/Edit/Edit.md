
## [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)

Procedures:

[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L36) `  PROCEDURE Max(i, j: LONGINT): LONGINT;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L42) `  PROCEDURE FocusViewer(): Viewers.Viewer;  (*for Extended Oberon*)`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L46) `  PROCEDURE Open*;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L66) `  PROCEDURE Store*;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L73) `    PROCEDURE Backup (VAR name: ARRAY OF CHAR);`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L99) `  PROCEDURE CopyLooks*;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L116) `  PROCEDURE ChangeFont*;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L128) `  PROCEDURE ChangeColor*;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L140) `  PROCEDURE ChangeOffset*;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L152) `  PROCEDURE Search*;  (*uses global variables M, pat, d for Boyer-Moore search*)`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L160) `    PROCEDURE Forward(n: INTEGER; VAR R: Texts.Reader; VAR buf: ARRAY OF CHAR);`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L201) `  PROCEDURE Locate*;`
[(src)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L226) `  PROCEDURE Recall*;`
