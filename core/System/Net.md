
## [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)

Procedures:


<pre>  PROCEDURE SetPartner(name: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L22)


<pre>  PROCEDURE Send(t: BYTE; L: INTEGER; data: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L26)


<pre>  PROCEDURE ReceiveHead(timeout: LONGINT);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L30)


<pre>  PROCEDURE FindPartner(name: ARRAY OF CHAR; VAR res: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L42)


<pre>  PROCEDURE AppendS(s: ARRAY OF CHAR; VAR d: ARRAY OF CHAR; VAR k: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L61)


<pre>  PROCEDURE AppendW(s: LONGINT; VAR d: ARRAY OF CHAR; n: INTEGER; VAR k: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L67)


<pre>  PROCEDURE PickS(VAR s: ARRAY OF CHAR);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L73)


<pre>  PROCEDURE PickQ(VAR w: LONGINT);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L79)


<pre>  PROCEDURE SendData(F: Files.File);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L85)


<pre>  PROCEDURE ReceiveData(F: Files.File; VAR done: BOOLEAN);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L106)


<pre>  PROCEDURE reply(msg: INTEGER);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L131)


<pre>  PROCEDURE Serve;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L143)


<pre>  PROCEDURE GetPar1(VAR S: Texts.Scanner);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L203)


<pre>  PROCEDURE GetPar(VAR S: Texts.Scanner; VAR end: LONGINT);</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L207)


<pre>  PROCEDURE SendFiles*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L217)


<pre>  PROCEDURE ReceiveFiles*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L258)


<pre>  PROCEDURE SendMsg*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L301)


<pre>  PROCEDURE GetTime*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L320)


<pre>  PROCEDURE StartServer*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L336)


<pre>  PROCEDURE Unprotect*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L343)


<pre>  PROCEDURE WProtect*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L347)


<pre>  PROCEDURE Reset*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L351)


<pre>  PROCEDURE StopServer*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L355)


<pre>  PROCEDURE SCCStatus*;</pre> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L360)

