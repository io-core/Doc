
## [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)

Procedures:


<pre>  PROCEDURE Max(i, j: LONGINT): LONGINT;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L36)


<pre>  PROCEDURE FocusViewer(): Viewers.Viewer;  (*for Extended Oberon*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L42)


<pre>  PROCEDURE Open*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L46)


<pre>  PROCEDURE Store*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L66)


<pre>    PROCEDURE Backup (VAR name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L73)


<pre>  PROCEDURE CopyLooks*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L99)


<pre>  PROCEDURE ChangeFont*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L116)


<pre>  PROCEDURE ChangeColor*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L128)


<pre>  PROCEDURE ChangeOffset*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L140)


<pre>  PROCEDURE Search*;  (*uses global variables M, pat, d for Boyer-Moore search*)</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L152)


<pre>    PROCEDURE Forward(n: INTEGER; VAR R: Texts.Reader; VAR buf: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L160)


<pre>  PROCEDURE Locate*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L201)


<pre>  PROCEDURE Recall*;</pre> [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod#L226)

