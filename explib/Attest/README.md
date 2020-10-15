## Attest
This package provides code provenance tools for use in Oberon.


Module Attest provides tools and algoritms for code signing and attestation of provenance.


#### [MODULE Attest](https://github.com/io-core/doc/blob/main/explib/Attest/Attest.md) [(source)](https://github.com/io-core/Attest/blob/main/Attest.Mod)
Module Attest provides commands for code signing and checking provenance.


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


#### [MODULE KeySafeFrames](https://github.com/io-core/doc/blob/main/explib/Attest/KeySafeFrames.md) [(source)](https://github.com/io-core/Attest/blob/main/KeySafeFrames.Mod)
Module KeySafeFrames provides a user-interface to the keys used to sign and to trust signed code.


  **imports:** ` SYSTEM Display Viewers Input Fonts Texts KeySafes Oberon MenuViewers`
**Procedures:**
```
  Restore*(f: Frame)

  Focus*(): Frame

  Selected*(): Frame

  This*(x, y: INTEGER): Frame

  Draw*(f: Frame)

  Erase*(f: Frame)

  DrawKeyRing*(f: Frame; L: KeySafes.KeyRing)

  EraseKeyRing*(f: Frame; R: KeySafes.KeyRing)

  Change*(f: Frame; VAR msg: KeySafes.Msg)

  Defocus*(f: Frame)

  Deselect*(f: Frame)

  Handle*(f: Display.Frame; VAR m: Display.FrameMsg)

  Store*(f: Frame; name: ARRAY OF CHAR)

  ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER)

  ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER)

  Open*(f: Frame; S: KeySafes.KeySafe)

```


#### [MODULE KeySafes](https://github.com/io-core/doc/blob/main/explib/Attest/KeySafes.md) [(source)](https://github.com/io-core/Attest/blob/main/KeySafes.Mod)
Module KeySafes keeps the secrets used to sign and trust signed code.


  **imports:** ` SYSTEM Files Fonts KeyPairs`
**Procedures:**
```
          read*:(R: KeyRing; VAR r: Files.Rider); (*; VAR c: Context) *)

          write*:(R: KeyRing; cno: INTEGER; VAR r: Files.Rider); (*; VAR c: Context)*)

  New*(R: KeyRing)

  Add*(S: KeySafe; R: KeyRing)

  ThisKeyRing*(S: KeySafe; x, y: INTEGER): KeyRing

  SelectKeyRing*(S: KeySafe; R: KeyRing)

  SelectArea*(S: KeySafe; x0, y0, x1, y1: INTEGER)

  Draw*(S: KeySafe; VAR m: Msg)

  List*(S: KeySafe)

  Deselect*(S: KeySafe)

  DrawSel*(S: KeySafe; VAR m: Msg)

  Change*(S: KeySafe; VAR m: Msg)

  WriteFile*(S: KeySafe; name: ARRAY OF CHAR)

  SetWidth*(w: INTEGER)

  Open*(S: KeySafe; name: ARRAY OF CHAR)

  Delete*(S: KeySafe)

  InstallDrawMethods*(drawLine, drawCaption, drawMacro: PROCEDURE (R: KeyRing; VAR msg: Msg))

```


#### [MODULE KeyPairs](https://github.com/io-core/doc/blob/main/explib/Attest/KeyPairs.md) [(source)](https://github.com/io-core/Attest/blob/main/KeyPairs.Mod)
Module KeyPairs provides the data structures used by the Attest package for code provenance.


**imports:** ` SYSTEM Kernel Oberon`
**Procedures:**
```
  New*(P: KeyPair; v: INTEGER) : KeyPair

  Get*(P: KeyPair; x: INTEGER): INTEGER

  Clear*(P: KeyPair)

```
