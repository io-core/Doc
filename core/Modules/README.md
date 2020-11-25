## Modules
This package manages compiled module loading and unloading in Oberon.


### _Package Overview:_
The Modules package manages the loading and linking and unloading of program code and is the first code run when the boot loader passes control to the OS.


### _Package Use:_

USAGE:
```
Modules.Load("something",M)
```

### _Modules in this package:_

#### [MODULE Modules](https://github.com/io-core/doc/blob/main/core/Modules/Modules.md) [(source)](https://github.com/io-core/Modules/blob/main/Modules.Mod)
Module Modules is the heart of how separately compiled Oberon programs are loaded and linked.


  **imports:** ` SYSTEM Files`

**Procedures:**
```
  Load*(name: ARRAY OF CHAR; VAR newmod: Module)

  ThisCommand*(mod: Module; name: ARRAY OF CHAR): Command

  Free*(name: ARRAY OF CHAR)

  Init*

```
