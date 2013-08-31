;
; AutoHotkey (Tested) Version: 1.1.13.00
; Author:         Joe DF  |  http://joedf.co.nr  |  joedf@users.sourceforge.net
; Date:           August 31st, 2013
;
;	LibCon.ahk Usage Example
;
;/////////////////////////////////////////////////////////////

#SingleInstance,force
#Include LibCon.ahk ;Needed
#NoTrayIcon ;Suggested
SetBatchLines,-1 ;suggested
StartConsole() ;Shows the Console and 'initializes' the library
;<<<<<<<<  HEADER END  >>>>>>>>>

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
pause() ;Pause : "press any key to continue..."
puts("bye!")
Sleep 500
FreeConsole() ;Kill Console and keep ahk running till exit
sleep 500
MsgBox Im still Alive!!! ok.. bye now.
;ExitApp ;Note: #persistent is not set.