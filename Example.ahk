;
; AutoHotkey (Tested) Version: 1.1.13.01
; Author:         Joe DF  |  http://joedf.co.nr  |  joedf@users.sourceforge.net
; Date:           September 8th, 2013
;
;	LibCon.ahk Usage Example
;
;/////////////////////////////////////////////////////////////

#SingleInstance,Off
#Include LibCon.ahk ;Needed
#NoTrayIcon ;Suggested
SetBatchLines,-1 ;suggested
LibConDebug:=1 ;let the user know about errors

SmartStartConsole() ;Shows the Console and 'initializes' the library
;<<<<<<<<  HEADER END  >>>>>>>>>

if (args) {
	putsf("argc = %s",args[0]) ;use args[0] or argc
	loop % args[0]
		putsf("%s: %s",A_Index,args[A_Index])
	putsf("args (CSV Format): %s",args.CSV)
	newline()
}

puts("Hello World!")
print("Enter Your Name: ")
putsf("`nWelcome %s!", (gets(Name)=="") ? "User" : Name)
puts("`nSetting color to Green (0xa)")
setFGColor(Green) ;Set Foreground Color to Green (the text color)

;Create Fake loading bar...
Loop % (barmax:=70)+1 {
	printf("Loading `%s`r",sProgressBar(50,A_Index-1,barmax))
	Sleep 30
}

newline() ;Skip to new line
printcolortable()
newline() ;Skip to new line
puts("Press 5 different keys...")
Loop 5
{
	kcode:=getch(kname) ;getch returns keycode and stores the keyname in kname if possible
	putsf("KeyName: %s (%s)",kname,kcode) ;puts("KeyName: " . kname . " (" . kcode ")")
	
}
pause() ;Pause : "press any key to continue..."
puts("bye!")
Sleep 500
FreeConsole() ;Kill Console and keep ahk running till exit
sleep 500
MsgBox Im still Alive!!! ok.. bye now.
;ExitApp ;Note: #persistent is not set.