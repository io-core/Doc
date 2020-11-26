
## [MODULE M](https://github.com/io-core/Build/blob/main/M.Mod)

```
```
## Variables:
```
 a, b: INTEGER;
 PROCEDURE F(x, y: INTEGER): INTEGER;
## Variables:
```
 z: INTEGER;
 BEGIN
 IF x > y THEN z := F(x-y, y)
 ELSIF y > x THEN z := F(y-x, x)
 ELSE z := x
 END ;
 RETURN z
 END F;
 PROCEDURE Q(VAR x, y: INTEGER);
## Variables:
```
 z: INTEGER;
 BEGIN z := x; x := y; y := z
 END Q;
BEGIN a := F(35, 21); Q(a, b)
END M. 
```
## Procedures:
---

` PROCEDURE F(x, y: INTEGER): INTEGER;` [(source)](https://github.com/io-core/Build/blob/main/M.Mod#L3)


` PROCEDURE Q(VAR x, y: INTEGER);` [(source)](https://github.com/io-core/Build/blob/main/M.Mod#L12)

