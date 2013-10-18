;LibCon Compiler wrapper

regread,ahkdir,HKLM,SOFTWARE\AutoHotkey,InstallDir
AhkCompiler:=ahkdir "\Compiler\Ahk2Exe.exe"
AhkVersion:="1.1.13.01"

Gui, Add, Text,     x12  y12 w32  h20 , Script:
Gui, Add, Text,     x12  y32 w32  h20 , Icon:
Gui, Add, Text,     x12  y52 w32  h20 , Type:
Gui, Add, Edit,     x44  y10 w148 h20 vtScript ReadOnly, 
Gui, Add, Edit,     x44  y30 w148 h20 vtIcon ReadOnly, 
Gui, Add, Button,   x192 y10 w70  h20 gbScript, Browse...
Gui, Add, Button,   x192 y30 w70  h20 gbIcon, Browse...
Gui, Add, DDL,      x44  y50 w148 h20 vtType AltSubmit choose1 r3, v%AhkVersion% Unicode 32-bit|v%AhkVersion% Unicode 64-bit|v%AhkVersion% ANSI 32-bit
Gui, Add, Checkbox, x200 y52 w70  h20 vtMpress, Mpress
Gui, Add, Button,   x2   y72 w130 h30 gCompile, Compile && Save As...
Gui, Add, Button,   x132 y72 w130 h30 gGuiClose, Cancel
; Generated using SmartGUI Creator for SciTE
Gui, Show, w264 h104, LibCon Compiler
return

GuiClose:
ExitApp

bScript:
	FileSelectFile,obScript,1,,,AutoHotkey Files (*.ahk)
	if obScript is not space
		GuiControl,,tScript,%obScript%
return

bIcon:
	FileSelectFile,obIcon,1,,,Icon Files (*.ico)
	if obIcon is not space
		GuiControl,,tIcon,%obIcon%
return

Compile:
	FileSelectFile,obExe,S16,,,Executable Files (*.exe)
	if (ErrorLevel) {
		MsgBox Invalid file...
		return
	} else {
		cIcon:=""
		GuiControlGet,Script,,tScript
		GuiControlGet,Icon,,tIcon
		GuiControlGet,Type,,tType
		GuiControlGet,Mpress,,tMpress
			if (Type==2)
				bin:=A_scriptDir "\bin\AutoHotkeyU64_CLI.bin"
			else if (Type==3)
				bin:=A_scriptDir "\bin\AutoHotkeyA32_CLI.bin"
			else
				bin:=A_scriptDir "\bin\AutoHotkeyU32_CLI.bin"
			
			if Script is space
			{
				MsgBox No Script was selected.
				return
			}
			if Icon is not space
			{
				cIcon=/icon "%Icon%"
			}
		Gui +Disabled
		ToolTip Compiling... Please wait...
		RunWait, %AhkCompiler% /in "%Script%" /out "%obExe%" %cIcon% /bin "%bin%" /mpress %mpress%,,UseErrorLevel
		e:=ErrorLevel
		ToolTip
		MsgBox Done.
	}
ExitApp