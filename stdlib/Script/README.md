##The Script package allows the user to batch commands and 'script' the Oberon environment


#### [MODULE Environments](https://github.com/io-core/Script/blob/main/Environments.Mod)
##### Procedures:
*         read*:(b: Binding; VAR r: Files.Rider); (*; VAR c: Context) *)
*         write*:(b: Binding; cno: INTEGER; VAR r: Files.Rider); (*; VAR c: Context)*)
* New*(b: Binding)
* Prepare*(VAR e: Env; VAR T: Text)
* Set*(e: Env; b: Binding)
* Save*(e: Env; name: ARRAY OF CHAR)
* Resume*(e: Env; name: ARRAY OF CHAR)
* Unset*(e: Env)

#### [MODULE Intrinsics](https://github.com/io-core/Script/blob/main/Intrinsics.Mod)
##### Procedures:
* New*(i: Intrinsic; v: INTEGER) : Intrinsic
* Clear*(i: Intrinsic)

#### [MODULE Script](https://github.com/io-core/Script/blob/main/Script.Mod)
##### Procedures:
* Load*
* Open*
* Run*
