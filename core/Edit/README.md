The [Edit](./Edit/README.md) package manages the text and font handling in Oberon.


#### [MODULE TextFrames](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)
##### Procedures:
* Recall*(VAR B: Texts.Buffer)

#### [MODULE Texts](https://github.com/io-core/Edit/blob/main/Texts.Mod)
##### Procedures:
* Close*(T: Text; name: ARRAY OF CHAR)
* Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER)

#### [MODULE Edit](https://github.com/io-core/Edit/blob/main/Edit.Mod)
##### Procedures:
* Open*
* Store*
* CopyLooks*
* ChangeFont*
* ChangeColor*
* ChangeOffset*
* Search*  (*uses global variables M, pat, d for Boyer-Moore search*)
* Locate*
* Recall*

#### [MODULE Fonts](https://github.com/io-core/Edit/blob/main/Fonts.Mod)
##### Procedures:
* GetPat*(fnt: Font; ch: CHAR; VAR dx, x, y, w, h, patadr: INTEGER)
* Load*(name: ARRAY OF CHAR): Font
* This*(name: ARRAY OF CHAR): Font  (*for backward compatibility*)
* Free*  (*remove all but first two from font list*)
