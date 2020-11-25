## Files
This package handles persistent storage and the file and directory interface of Oberon.


### _Package Overview:_
The Files package provides:

* Directory operations
* File i/o

### _Package Use:_

USAGE:
```
F := Files.New("newfile.txt")
```

### _Modules in this package:_

#### [MODULE FileDir](https://github.com/io-core/doc/blob/main/core/Files/FileDir.md) [(source)](https://github.com/io-core/Files/blob/main/FileDir.Mod)
Module FileDir implements the following operations on the binary tree of directory pages stored on disk:
* inserting directory entries
* deleting directory entries
* searching for directory entries
* enumerating directory entries
* initializing the Kernel sector table bitmap

FileDir is not intended for use by regular programs. The FileDir interface is used by the Files module which regular programs may access.


  **imports:** ` SYSTEM Kernel`

**Procedures:**
```
  Search*(name: FileName; VAR A: DiskAdr)

  Insert*(name: FileName; fad: DiskAdr)

  Delete*(name: FileName; VAR fad: DiskAdr)

  Enumerate*(prefix: ARRAY OF CHAR; proc: EntryHandler)

  Init*

```


#### [MODULE Files](https://github.com/io-core/doc/blob/main/core/Files/Files.md) [(source)](https://github.com/io-core/Files/blob/main/Files.Mod)
Module Files manages the on-disk representation of files and presents the following APIs:
* File Directory API: Old, New, Register, Close, Purge, Delete, Rename, Date, Length
* File Read API: Set, Pos, Base, ReadByte, ReadBytes, Read, ReadInt, ReadSet, ReadReal, ReadString, ReadNum
* File Write API: WriteByte, WriteBytes, Write, WriteInt, WriteReal, WriteString, WriteNum
* System use: Init, RestoreList


  **imports:** ` SYSTEM Kernel FileDir`

**Procedures:**
```
  Old*(name: ARRAY OF CHAR): File

  New*(name: ARRAY OF CHAR): File

  Register*(f: File)

  Close*(f: File)

  Purge*(f: File)

  Delete*(name: ARRAY OF CHAR; VAR res: INTEGER)

  Rename*(old, new: ARRAY OF CHAR; VAR res: INTEGER)

  Length*(f: File): INTEGER

  Date*(f: File): INTEGER

  Set*(VAR r: Rider; f: File; pos: INTEGER)

  Pos*(VAR r: Rider): INTEGER

  Base*(VAR r: Rider): File

  ReadByte*(VAR r: Rider; VAR x: BYTE)

  ReadBytes*(VAR r: Rider; VAR x: ARRAY OF BYTE; n: INTEGER)

  Read*(VAR r: Rider; VAR ch: CHAR)

  ReadInt*(VAR R: Rider; VAR x: INTEGER)

  ReadSet*(VAR R: Rider; VAR s: SET)

  ReadReal*(VAR R: Rider; VAR x: REAL)

  ReadString*(VAR R: Rider; VAR x: ARRAY OF CHAR)

  ReadNum*(VAR R: Rider; VAR x: INTEGER)

  WriteByte*(VAR r: Rider; x: BYTE)

  WriteBytes*(VAR r: Rider; x: ARRAY OF BYTE; n: INTEGER)

  Write*(VAR r: Rider; ch: CHAR)

  WriteInt*(VAR R: Rider; x: INTEGER)

  WriteSet*(VAR R: Rider; s: SET)

  WriteReal*(VAR R: Rider; x: REAL)

  WriteString*(VAR R: Rider; x: ARRAY OF CHAR)

  WriteNum*(VAR R: Rider; x: INTEGER)

  Init*

  RestoreList* (*after mark phase of garbage collection*)

```
