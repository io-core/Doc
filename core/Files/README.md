## The Files package handles persistent storage and the file and directory interface of Oberon.


#### [MODULE FileDir](https://github.com/io-core/Files/blob/main/FileDir.Mod)
##### Procedures:
* Search*(name: FileName; VAR A: DiskAdr)
* Insert*(name: FileName; fad: DiskAdr)
* Delete*(name: FileName; VAR fad: DiskAdr)
* Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler)
* Attributes*(fad: INTEGER; VAR length, date: INTEGER)
* Init*

#### [MODULE Files](https://github.com/io-core/Files/blob/main/Files.Mod)
##### Procedures:
* Old*(name: ARRAY OF CHAR): File
* New*(name: ARRAY OF CHAR): File
* Register*(f: File)
* Close*(f: File)
* Purge*(f: File)
* Delete*(name: ARRAY OF CHAR; VAR res: INTEGER)
* Rename*(old, new: ARRAY OF CHAR; VAR res: INTEGER)
* Length*(f: File): INTEGER
* Date*(f: File): INTEGER
* Set*(VAR r: Rider; f: File; pos: INTEGER)
* Pos*(VAR r: Rider): INTEGER
* Base*(VAR r: Rider): File
* ReadByte*(VAR r: Rider; VAR x: BYTE)
* ReadBytes*(VAR r: Rider; VAR x: ARRAY OF BYTE; n: INTEGER)
* Read*(VAR r: Rider; VAR ch: CHAR)
* ReadInt*(VAR R: Rider; VAR x: INTEGER)
* ReadSet*(VAR R: Rider; VAR s: SET)
* ReadReal*(VAR R: Rider; VAR x: REAL)
* ReadString*(VAR R: Rider; VAR x: ARRAY OF CHAR)
* ReadNum*(VAR R: Rider; VAR x: INTEGER)
* WriteByte*(VAR r: Rider; x: BYTE)
* WriteBytes*(VAR r: Rider; x: ARRAY OF BYTE; n: INTEGER)
* Write*(VAR r: Rider; ch: CHAR)
* WriteInt*(VAR R: Rider; x: INTEGER)
* WriteSet*(VAR R: Rider; s: SET)
* WriteReal*(VAR R: Rider; x: REAL)
* WriteString*(VAR R: Rider; x: ARRAY OF CHAR)
* WriteNum*(VAR R: Rider; x: INTEGER)
* Init*
* RestoreList* (*after mark phase of garbage collection*)
