
## [MODULE Environments](https://github.com/io-core/Script/blob/main/Environments.Mod)

Procedures:

```
  PROCEDURE New*(b: Binding);
```
```
  PROCEDURE Prepare*(VAR e: Env; VAR T: Text);
```
```
  PROCEDURE Set*(e: Env; b: Binding);
```
```
  PROCEDURE Save*(e: Env; name: ARRAY OF CHAR);
```
```
  PROCEDURE Resume*(e: Env; name: ARRAY OF CHAR);
```
```
  PROCEDURE Unset*(e: Env);
```
