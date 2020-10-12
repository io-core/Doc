The [Kernel](./Kernel/README.md) package handles basic os functionality including device access and garbage collection.


#### [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)
##### Procedures:
* InitSecMap*
* MarkSector*(sec: INTEGER)
* FreeSector*(sec: INTEGER)
* AllocSector*(hint: INTEGER; VAR sec: INTEGER)
* GetSector*(src: INTEGER; VAR dst: Sector)
* PutSector*(dst: INTEGER; VAR src: Sector)
* Init*

#### [MODULE Kernel](https://github.com/io-core/Kernel/blob/main/Kernel.Mod)
##### Procedures:
* New*(VAR ptr: LONGINT; tag, len, elemsize: LONGINT)
* Mark*(pref: LONGINT)
* Collect*
* Scan*(typ, ptr, pvr: Handler; s: ARRAY OF CHAR; VAR resTyp, resPtr, resPvr: INTEGER)
* Time*(): INTEGER
* Clock*(): INTEGER
* SetClock*(dt: INTEGER)
* Install*(Padr, at: INTEGER)
* Init*
