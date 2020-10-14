
## [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)

Procedures:


<code>  PROCEDURE SetPartner(name: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L22)


<code>  PROCEDURE Send(t: BYTE; L: INTEGER; data: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L26)


<code>  PROCEDURE ReceiveHead(timeout: LONGINT);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L30)


<code>  PROCEDURE FindPartner(name: ARRAY OF CHAR; VAR res: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L42)


<code>  PROCEDURE AppendS(s: ARRAY OF CHAR; VAR d: ARRAY OF CHAR; VAR k: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L61)


<code>  PROCEDURE AppendW(s: LONGINT; VAR d: ARRAY OF CHAR; n: INTEGER; VAR k: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L67)


<code>  PROCEDURE PickS(VAR s: ARRAY OF CHAR);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L73)


<code>  PROCEDURE PickQ(VAR w: LONGINT);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L79)


<code>  PROCEDURE SendData(F: Files.File);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L85)


<code>  PROCEDURE ReceiveData(F: Files.File; VAR done: BOOLEAN);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L106)


<code>  PROCEDURE reply(msg: INTEGER);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L131)


<code>  PROCEDURE Serve;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L143)


<code>  PROCEDURE GetPar1(VAR S: Texts.Scanner);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L203)


<code>  PROCEDURE GetPar(VAR S: Texts.Scanner; VAR end: LONGINT);</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L207)


<code>  PROCEDURE SendFiles*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L217)


<code>  PROCEDURE ReceiveFiles*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L258)


<code>  PROCEDURE SendMsg*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L301)


<code>  PROCEDURE GetTime*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L320)


<code>  PROCEDURE StartServer*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L336)


<code>  PROCEDURE Unprotect*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L343)


<code>  PROCEDURE WProtect*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L347)


<code>  PROCEDURE Reset*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L351)


<code>  PROCEDURE StopServer*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L355)


<code>  PROCEDURE SCCStatus*;</code> [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L360)

