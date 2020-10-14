
## [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)

Procedures:

[](https://github.com/io-core/System/blob/main/Net.Mod#L22) `  PROCEDURE SetPartner(name: ARRAY OF CHAR);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L26) `  PROCEDURE Send(t: BYTE; L: INTEGER; data: ARRAY OF CHAR);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L30) `  PROCEDURE ReceiveHead(timeout: LONGINT);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L42) `  PROCEDURE FindPartner(name: ARRAY OF CHAR; VAR res: INTEGER);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L61) `  PROCEDURE AppendS(s: ARRAY OF CHAR; VAR d: ARRAY OF CHAR; VAR k: INTEGER);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L67) `  PROCEDURE AppendW(s: LONGINT; VAR d: ARRAY OF CHAR; n: INTEGER; VAR k: INTEGER);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L73) `  PROCEDURE PickS(VAR s: ARRAY OF CHAR);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L79) `  PROCEDURE PickQ(VAR w: LONGINT);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L85) `  PROCEDURE SendData(F: Files.File);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L106) `  PROCEDURE ReceiveData(F: Files.File; VAR done: BOOLEAN);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L131) `  PROCEDURE reply(msg: INTEGER);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L143) `  PROCEDURE Serve;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L203) `  PROCEDURE GetPar1(VAR S: Texts.Scanner);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L207) `  PROCEDURE GetPar(VAR S: Texts.Scanner; VAR end: LONGINT);`
[](https://github.com/io-core/System/blob/main/Net.Mod#L217) `  PROCEDURE SendFiles*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L258) `  PROCEDURE ReceiveFiles*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L301) `  PROCEDURE SendMsg*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L320) `  PROCEDURE GetTime*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L336) `  PROCEDURE StartServer*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L343) `  PROCEDURE Unprotect*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L347) `  PROCEDURE WProtect*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L351) `  PROCEDURE Reset*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L355) `  PROCEDURE StopServer*;`
[](https://github.com/io-core/System/blob/main/Net.Mod#L360) `  PROCEDURE SCCStatus*;`
