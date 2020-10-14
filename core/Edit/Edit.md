
## [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)

Procedures:


<code>  PROCEDURE Max(i, j: LONGINT): LONGINT;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L36)


<code>  PROCEDURE FocusViewer(): Viewers.Viewer;  (*for Extended Oberon*)</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L42)


<code>  PROCEDURE Open*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L46)


<code>  PROCEDURE Store*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L66)


<code>    PROCEDURE Backup (VAR name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L73)


<code>  PROCEDURE CopyLooks*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L99)


<code>  PROCEDURE ChangeFont*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L116)


<code>  PROCEDURE ChangeColor*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L128)


<code>  PROCEDURE ChangeOffset*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L140)


<code>  PROCEDURE Search*;  (*uses global variables M, pat, d for Boyer-Moore search*)</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L152)


<code>    PROCEDURE Forward(n: INTEGER; VAR R: Texts.Reader; VAR buf: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L160)


<code>  PROCEDURE Locate*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L201)


<code>  PROCEDURE Recall*;</code> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L226)

