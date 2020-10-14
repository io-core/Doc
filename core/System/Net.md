
## [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)

Procedures:

[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L22) `  PROCEDURE SetPartner(name: ARRAY OF CHAR);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L26) `  PROCEDURE Send(t: BYTE; L: INTEGER; data: ARRAY OF CHAR);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L30) `  PROCEDURE ReceiveHead(timeout: LONGINT);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L42) `  PROCEDURE FindPartner(name: ARRAY OF CHAR; VAR res: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L61) `  PROCEDURE AppendS(s: ARRAY OF CHAR; VAR d: ARRAY OF CHAR; VAR k: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L67) `  PROCEDURE AppendW(s: LONGINT; VAR d: ARRAY OF CHAR; n: INTEGER; VAR k: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L73) `  PROCEDURE PickS(VAR s: ARRAY OF CHAR);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L79) `  PROCEDURE PickQ(VAR w: LONGINT);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L85) `  PROCEDURE SendData(F: Files.File);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L106) `  PROCEDURE ReceiveData(F: Files.File; VAR done: BOOLEAN);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L131) `  PROCEDURE reply(msg: INTEGER);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L143) `  PROCEDURE Serve;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L203) `  PROCEDURE GetPar1(VAR S: Texts.Scanner);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L207) `  PROCEDURE GetPar(VAR S: Texts.Scanner; VAR end: LONGINT);`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L217) `  PROCEDURE SendFiles*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L258) `  PROCEDURE ReceiveFiles*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L301) `  PROCEDURE SendMsg*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L320) `  PROCEDURE GetTime*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L336) `  PROCEDURE StartServer*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L343) `  PROCEDURE Unprotect*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L347) `  PROCEDURE WProtect*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L351) `  PROCEDURE Reset*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L355) `  PROCEDURE StopServer*;`
[(src)](https://github.com/io-core/System/blob/main/Net.Mod#L360) `  PROCEDURE SCCStatus*;`
