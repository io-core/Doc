
## [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)

Procedures:

[22](https://github.com/io-core/System/blob/main/Net.Mod#22) `  PROCEDURE SetPartner(name: ARRAY OF CHAR);`
[26](https://github.com/io-core/System/blob/main/Net.Mod#26) `  PROCEDURE Send(t: BYTE; L: INTEGER; data: ARRAY OF CHAR);`
[30](https://github.com/io-core/System/blob/main/Net.Mod#30) `  PROCEDURE ReceiveHead(timeout: LONGINT);`
[42](https://github.com/io-core/System/blob/main/Net.Mod#42) `  PROCEDURE FindPartner(name: ARRAY OF CHAR; VAR res: INTEGER);`
[61](https://github.com/io-core/System/blob/main/Net.Mod#61) `  PROCEDURE AppendS(s: ARRAY OF CHAR; VAR d: ARRAY OF CHAR; VAR k: INTEGER);`
[67](https://github.com/io-core/System/blob/main/Net.Mod#67) `  PROCEDURE AppendW(s: LONGINT; VAR d: ARRAY OF CHAR; n: INTEGER; VAR k: INTEGER);`
[73](https://github.com/io-core/System/blob/main/Net.Mod#73) `  PROCEDURE PickS(VAR s: ARRAY OF CHAR);`
[79](https://github.com/io-core/System/blob/main/Net.Mod#79) `  PROCEDURE PickQ(VAR w: LONGINT);`
[85](https://github.com/io-core/System/blob/main/Net.Mod#85) `  PROCEDURE SendData(F: Files.File);`
[106](https://github.com/io-core/System/blob/main/Net.Mod#106) `  PROCEDURE ReceiveData(F: Files.File; VAR done: BOOLEAN);`
[131](https://github.com/io-core/System/blob/main/Net.Mod#131) `  PROCEDURE reply(msg: INTEGER);`
[143](https://github.com/io-core/System/blob/main/Net.Mod#143) `  PROCEDURE Serve;`
[203](https://github.com/io-core/System/blob/main/Net.Mod#203) `  PROCEDURE GetPar1(VAR S: Texts.Scanner);`
[207](https://github.com/io-core/System/blob/main/Net.Mod#207) `  PROCEDURE GetPar(VAR S: Texts.Scanner; VAR end: LONGINT);`
[217](https://github.com/io-core/System/blob/main/Net.Mod#217) `  PROCEDURE SendFiles*;`
[258](https://github.com/io-core/System/blob/main/Net.Mod#258) `  PROCEDURE ReceiveFiles*;`
[301](https://github.com/io-core/System/blob/main/Net.Mod#301) `  PROCEDURE SendMsg*;`
[320](https://github.com/io-core/System/blob/main/Net.Mod#320) `  PROCEDURE GetTime*;`
[336](https://github.com/io-core/System/blob/main/Net.Mod#336) `  PROCEDURE StartServer*;`
[343](https://github.com/io-core/System/blob/main/Net.Mod#343) `  PROCEDURE Unprotect*;`
[347](https://github.com/io-core/System/blob/main/Net.Mod#347) `  PROCEDURE WProtect*;`
[351](https://github.com/io-core/System/blob/main/Net.Mod#351) `  PROCEDURE Reset*;`
[355](https://github.com/io-core/System/blob/main/Net.Mod#355) `  PROCEDURE StopServer*;`
[360](https://github.com/io-core/System/blob/main/Net.Mod#360) `  PROCEDURE SCCStatus*;`
