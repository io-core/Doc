
## [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)

  ## imports
 SYSTEM SCC Files Texts Oberon
## Procedures
---

`  PROCEDURE SetPartner(name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L22)


`  PROCEDURE Send(t: BYTE; L: INTEGER; data: ARRAY OF CHAR);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L26)


`  PROCEDURE ReceiveHead(timeout: LONGINT);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L30)


`  PROCEDURE FindPartner(name: ARRAY OF CHAR; VAR res: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L42)


`  PROCEDURE AppendS(s: ARRAY OF CHAR; VAR d: ARRAY OF CHAR; VAR k: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L61)


`  PROCEDURE AppendW(s: LONGINT; VAR d: ARRAY OF CHAR; n: INTEGER; VAR k: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L67)


`  PROCEDURE PickS(VAR s: ARRAY OF CHAR);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L73)


`  PROCEDURE PickQ(VAR w: LONGINT);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L79)


`  PROCEDURE SendData(F: Files.File);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L85)


`  PROCEDURE ReceiveData(F: Files.File; VAR done: BOOLEAN);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L106)


`  PROCEDURE reply(msg: INTEGER);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L131)


`  PROCEDURE Serve;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L143)


`  PROCEDURE GetPar1(VAR S: Texts.Scanner);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L203)


`  PROCEDURE GetPar(VAR S: Texts.Scanner; VAR end: LONGINT);` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L207)


`  PROCEDURE SendFiles*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L217)


`  PROCEDURE ReceiveFiles*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L258)


`  PROCEDURE SendMsg*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L301)


`  PROCEDURE GetTime*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L320)


`  PROCEDURE StartServer*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L336)


`  PROCEDURE Unprotect*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L343)


`  PROCEDURE WProtect*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L347)


`  PROCEDURE Reset*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L351)


`  PROCEDURE StopServer*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L355)


`  PROCEDURE SCCStatus*;` [(source)](https://github.com/io-core/System/blob/main/Net.Mod#L360)

