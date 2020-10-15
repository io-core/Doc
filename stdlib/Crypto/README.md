## Crypto
This package provides common cryptographic algorithms.


## Overview
The Crypto package provides:

* Cryptographic utilities
* Cryptographic Algorithms

## Examples

USAGE:
```
--none yet--
```

## Modules

#### [MODULE Crypto](https://github.com/io-core/doc/blob/main/stdlib/Crypto/Crypto.md) [(source)](https://github.com/io-core/Crypto/blob/main/Crypto.Mod)
Module Crypto provides command tools for cryptographic functions.


  **imports:** ` Files Fonts Viewers Texts Oberon
**Procedures:**
```
  Open*

  Delete*

  SetWidth*

  ChangeColor*

  ChangeWidth*

  ChangeFont*

  Ticks*

  Restore*

  Store*

  Macro*

```


#### [MODULE VaultFrames](https://github.com/io-core/doc/blob/main/stdlib/Crypto/VaultFrames.md) [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod)
Module VaultFrames provides a user-interface for manipulating secrets and vaults.


  **imports:** ` SYSTEM Display Viewers Input Fonts Texts Vaults Oberon MenuViewers`

**Procedures:**
```
  Restore*(f: Frame)

  Focus*(): Frame

  Selected*(): Frame

  This*(x, y: INTEGER): Frame

  Draw*(f: Frame)

  Erase*(f: Frame)

  DrawDocument*(f: Frame; L: Vaults.Document)

  EraseDocument*(f: Frame; D: Vaults.Document)

  Change*(f: Frame; VAR msg: Vaults.Msg)

  Defocus*(f: Frame)

  Deselect*(f: Frame)

  Handle*(f: Display.Frame; VAR m: Display.FrameMsg)

  Store*(f: Frame; name: ARRAY OF CHAR)

  ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER)

  ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER)

  Open*(f: Frame; V: Vaults.Vault)

```


#### [MODULE Vaults](https://github.com/io-core/doc/blob/main/stdlib/Crypto/Vaults.md) [(source)](https://github.com/io-core/Crypto/blob/main/Vaults.Mod)
Module Vaults provides an infrastructure for secrets and vaults.


  **imports:** ` SYSTEM Files Fonts Ciphers`

**Procedures:**
```
          read*:(D: Document; VAR r: Files.Rider); (*; VAR c: Context) *)

          write*:(D: Document; cno: INTEGER; VAR r: Files.Rider); (*; VAR c: Context)*)

  New*(D: Document)

  Add*(V: Vault; D: Document)

  ThisDocument*(V: Vault; x, y: INTEGER): Document

  SelectDocument*(V: Vault; D: Document)

  SelectArea*(V: Vault; x0, y0, x1, y1: INTEGER)

  Draw*(V: Vault; VAR m: Msg)

  List*(V: Vault)

  Deselect*(V: Vault)

  DrawSel*(V: Vault; VAR m: Msg)

  Change*(V: Vault; VAR m: Msg)

  WriteFile*(V: Vault; name: ARRAY OF CHAR)

  SetWidth*(w: INTEGER)

  Open*(V: Vault; name: ARRAY OF CHAR)

  Delete*(V: Vault)

  InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (D: Document; VAR msg: Msg))

```


#### [MODULE Ciphers](https://github.com/io-core/doc/blob/main/stdlib/Crypto/Ciphers.md) [(source)](https://github.com/io-core/Crypto/blob/main/Ciphers.Mod)
Module Ciphers provides cryptographic interfaces and algorithms.


**imports:** ` SYSTEM Kernel Oberon`

**Procedures:**
```
  New*(C: Cipher; v: INTEGER) : Cipher

  Get*(C: Cipher; x: INTEGER): INTEGER

  Clear*(C: Cipher)

```
