# Baxi-File-Format
A new file format for projects that uses a baxi.

## Baxi syntax and file maker
The syntax of ".baxi" files is based in blocks, lines and new lines.
Example:
* Blocks: Save lines
* Lines: Save strings
* New Lines: Separate blocks
* Commands: The acctual version of software just have the "\close" command, this command is used to close and save a file in baxi file maker.

```
--file1.baxi
Block
Line
Line
Line

AnotherBlock
Line
Line
\close
```
In the example of a new file being wrote above we have two blocks that save the lines in it (the Block and AnotherBlock are just examples to simplify, imagine they like another lines).

A important thing to know is that the file maker was thought to write multiple lines, so the only way to close a file saving the changes is using the command "\close" that is the unique command currently.

## Baxi interpreter

Baxi interpreter is basically a lua lib that allows you to use the blocks and lines to select the string you want to use.

The uniques functions currently in the project is:
* baxinterpreter.readInLines("file.baxi")
* baxinterpreter.callLine(block, line)

### baxinterpreter.readInLines("file.baxi")
This fuction only existis to read the files and organize the lines.

### baxinterpreter.callLine(block, line)
This function returns a string based on the block and line on the block, that is, if you want the line "4" of the block "1" you use "1" for block argument and "4" to the line argument.

Example:
```
--file1.baxi

blockInit
line
line
lineYouWant --< you want this line
line
line

blockTwo
line
line
line
```
```
--your project.lua
local baxi = require("interpreter")

baxinterpreter.readInLines("file1.baxi")

print(baxinterpreter.callLine(1, 4)) --Block and line

--output: line
```

## Why use baxi?

The baxi never wanted to replace other file format, is just a personal project developed by me regardless to expand my programming logic and maybe used in others personal projects to expand this project even more!

The filosophy behind the baxi is make the process of write strings more easy and less stressfully. I believe that the baxi can be excelent for projects that needs much strings because you dont need to declare variables or tables, you can just write in blocks the strings and call they after.