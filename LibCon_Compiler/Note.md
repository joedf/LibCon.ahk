## Update
This is no longer necessary, as we now have the `;@Ahk2Exe-ConsoleApp` compiler directive to do this for us.  
https://www.autohotkey.com/docs/misc/Ahk2ExeDirectives.htm#ConsoleApp

## Original notes
These Binaries are essentially the same as the originals except, they have been modified using a method to make AutoHotkey act/be as console applcation. In other words, changing the binaries to use the console subsystem. They have been created using `Ahk2CLI.ahk`

See: https://github.com/fincs/Ahk2Exe/issues/14

Run `ChangeAll2CLI.ahk` to run `Ahk2CLI.ahk` on all files in `bin\*.bin` and `exe\*.exe`, usually :

```
bin\
	AutoHotkeyA32_CLI.bin
	AutoHotkeyU32_CLI.bin
	AutoHotkeyU64_CLI.bin

exe\
	AutoHotkeyA32_CLI.exe
	AutoHotkeyU32_CLI.exe
	AutoHotkeyU64_CLI.exe
```
