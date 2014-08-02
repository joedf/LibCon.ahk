;ChangeAll2CLI.ahk - 01:51 2014/08/02
SetWorkingDir, %A_ScriptDir%
FileTypes:="bin|exe"
Loop,Parse,FileTypes,|
	Loop %A_LoopField%\*.%A_LoopField%
		ChangeSubSystem(A_LoopFileFullPath)
ChangeSubSystem(f,s="C") {
	RunWait, Ahk2CLI.ahk "%f%" %s%
}