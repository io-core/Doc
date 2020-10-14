
#### [MODULE Net](https://github.com/io-core/System/blob/main/Net.Mod)

Procedures:

```
  PROCEDURE SetPartner(name: ARRAY OF CHAR);
```
```
  PROCEDURE Send(t: BYTE; L: INTEGER; data: ARRAY OF CHAR);
```
```
  PROCEDURE ReceiveHead(timeout: LONGINT);
```
```
  PROCEDURE FindPartner(name: ARRAY OF CHAR; VAR res: INTEGER);
```
```
  PROCEDURE AppendS(s: ARRAY OF CHAR; VAR d: ARRAY OF CHAR; VAR k: INTEGER);
```
```
  PROCEDURE AppendW(s: LONGINT; VAR d: ARRAY OF CHAR; n: INTEGER; VAR k: INTEGER);
```
```
  PROCEDURE PickS(VAR s: ARRAY OF CHAR);
```
```
  PROCEDURE PickQ(VAR w: LONGINT);
```
```
  PROCEDURE SendData(F: Files.File);
```
```
  PROCEDURE ReceiveData(F: Files.File; VAR done: BOOLEAN);
```
```
  PROCEDURE reply(msg: INTEGER);
```
```
  PROCEDURE Serve;
```
```
  PROCEDURE GetPar1(VAR S: Texts.Scanner);
```
```
  PROCEDURE GetPar(VAR S: Texts.Scanner; VAR end: LONGINT);
```
```
  PROCEDURE SendFiles*;
```
```
  PROCEDURE ReceiveFiles*;
```
```
  PROCEDURE SendMsg*;
```
```
  PROCEDURE GetTime*;
```
```
  PROCEDURE StartServer*;
```
```
  PROCEDURE Unprotect*;
```
```
  PROCEDURE WProtect*;
```
```
  PROCEDURE Reset*;
```
```
  PROCEDURE StopServer*;
```
```
  PROCEDURE SCCStatus*;
```
