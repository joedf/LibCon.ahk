;LibCon Compiler wrapper

regread,ahkdir,HKLM,SOFTWARE\AutoHotkey,InstallDir
AhkCompiler:=ahkdir "\Compiler\Ahk2Exe.exe"
BuildTypes:="A32|U32|U64"
Loop,Parse,BuildTypes,|
{
	FileGetVersion,AhkVersion_%A_LoopField%,%A_ScriptDir%\bin\AutoHotkey%A_LoopField%_CLI.bin
	if (ErrorLevel) {
		MsgBox, 16, , File missing:`n"%A_ScriptDir%\bin\AutoHotkey%A_LoopField%_CLI.bin"`n`nThe program will not exit.
		ExitApp -1
	}
}

Gui, Add, Text,     x12  y12 w32  h20 , Script:
Gui, Add, Text,     x12  y32 w32  h20 , Icon:
Gui, Add, Text,     x12  y52 w32  h20 , Type:
Gui, Add, Edit,     x44  y10 w148 h20 vtScript ReadOnly, 
Gui, Add, Edit,     x44  y30 w148 h20 vtIcon ReadOnly, 
Gui, Add, Button,   x192 y10 w70  h20 gbScript, Browse...
Gui, Add, Button,   x192 y30 w70  h20 gbIcon, Browse...
Gui, Add, DDL,      x44  y50 w148 h20 vtType AltSubmit choose1 r3, v%AhkVersion_U32% Unicode 32-bit|v%AhkVersion_U64% Unicode 64-bit|v%AhkVersion_A32% ANSI 32-bit
Gui, Add, Checkbox, x200 y52 w70  h20 vtMpress, Mpress
Gui, Add, Button,   x2   y72 w130 h30 gCompile, Compile && Save As...
Gui, Add, Button,   x132 y72 w130 h30 gGuiClose, Cancel
; Generated using SmartGUI Creator for SciTE
Gui, Show, w264 h104, LibCon Compiler
return

GuiClose:
ExitApp

GuiDropFiles: ;https://github.com/fincs/Ahk2Exe/blob/44f155b96c571dc83a16370762fda78a46320d92/Ahk2Exe.ahk#L85-L93
	if A_EventInfo > 2
		MsgBox, 16, , You cannot drop more than one file into this window!
	SplitPath, A_GuiEvent,,, dropExt
	if dropExt = ahk
		GuiControl,, tScript, %A_GuiEvent%
	else if dropExt = ico
		GuiControl,, tIcon, %A_GuiEvent%
return

bScript:
	Gui +OwnDialogs
	FileSelectFile,obScript,1,,,AutoHotkey Files (*.ahk)
	if obScript is not space
		GuiControl,,tScript,%obScript%
return

bIcon:
	Gui +OwnDialogs
	FileSelectFile,obIcon,1,,,Icon Files (*.ico)
	if obIcon is not space
		GuiControl,,tIcon,%obIcon%
return

Compile:
	Gui +OwnDialogs
	FileSelectFile,obExe,S16,,,Executable Files (*.exe)
	if (ErrorLevel) {
		MsgBox Invalid file...
		return
	} else {
		if (SubStr(obExe,-3)!=".exe")
			obExe:=obExe ".exe"
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
			RegRead, LastIconDir, HKCU, Software\AutoHotkey\Ahk2Exe, LastIconDir
			RegRead, LastIcon, HKCU, Software\AutoHotkey\Ahk2Exe, LastIcon
			if Icon is space
			{
				RegDelete, HKCU, Software\AutoHotkey\Ahk2Exe, LastIconDir
				RegDelete, HKCU, Software\AutoHotkey\Ahk2Exe, LastIcon
			}
			else
			{
				cIcon=/icon "%Icon%"
			}
		Gui +Disabled
		ToolTip Compiling... Please wait...
		RunWait, %AhkCompiler% /in "%Script%" /out "%obExe%" %cIcon% /bin "%bin%" /mpress %mpress%,,UseErrorLevel
		e:=ErrorLevel
			if Icon is space
			{
				RegWrite, REG_SZ, HKCU, Software\AutoHotkey\Ahk2Exe, LastIconDir, %LastIconDir%
				RegWrite, REG_SZ, HKCU, Software\AutoHotkey\Ahk2Exe, LastIcon, %LastIcon%
			}
		ToolTip
		if (e)
			MsgBox Error occured - ErrorLevel: %e%
		else
			MsgBox Done.
		Gui -Disabled
	}
return