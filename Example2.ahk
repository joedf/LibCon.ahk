
#SingleInstance,Off
#Include LibCon.ahk ;Needed
#NoTrayIcon ;Suggested
SetBatchLines,-1 ;suggested
LibConDebug:=1

StartConsole() ;or use startSmart(), if Compiled as a console app
;<<<<<<<<  HEADER END  >>>>>>>>>

puts("press a key to create the gui...")
pause(0)
gui, +HwndhGUI
Gui, Add, Button,   x82  y50  w100 h30 gButton    Default,   Button
Gui, Add, Button,   x82  y90  w100 h30 gButton,   Button
Gui, Add, Radio,    x212 y50  w80  h20 gRadio,    Radio
Gui, Add, CheckBox, x212 y80  w100 h30 gCheckbox, CheckBox
Gui, Add, Slider,   x82  y130 w240 h40 gSlider    AltSubmit,   25
Gui, Add, ComboBox, x332 y50  w100 h20 gComboBox, ComboBox
Gui, Add, Edit,     x342 y90  w100 h30 gEdit,     Edit
Gui, Show, w470 h194, LibCon Test GUI Interaction ; Generated using SmartGUI Creator for SciTE
WinWaitClose, ahk_id %hGUI%
puts("testing Unicode Input/Output... press a key to continue")
pause(0)
putsf("Current InputCP: %s  OutputCP: %s  ",GetConsoleInputCP(),GetConsoleOutputCP())
puts("UNICODE_¥£¤__%s__UNICODE_¢µ®___")
print("enter some Unicode chars:")
gets(a)
puts(a)
pause()
puts("bye!")
Sleep 500
ExitApp

Button:
puts("Button was pressed")
return

Radio:
puts("Radio was clicked")
return

CheckBox:
puts("CheckBox was clicked")
return

Slider:
puts("Slider was clicked/Moved")
return

ComboBox:
puts("ComboBox was clicked/changed")
return

Edit:
puts("Edit was changed")
return

GuiClose:
Gui,Destroy
puts("Gui was Closed")
return
