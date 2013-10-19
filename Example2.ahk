
#SingleInstance,Off
#Include LibCon.ahk ;Needed
#NoTrayIcon ;Suggested
SetBatchLines,-1 ;suggested
LibConDebug:=1 ;let the user know about errors

SmartStartConsole() ;Shows the Console and 'initializes' the library
;<<<<<<<<  HEADER END  >>>>>>>>>

puts("press a key to create the gui...")
pause(0)
Gui, +HwndhGUI +ToolWindow +E0x40000
Gui, Add, Button,   x4       gButton    Default,   Button
Gui, Add, Button,   x+4 yp   gButton2,  Button2
Gui, Add, Radio,    x4       gRadio,    Radio
Gui, Add, CheckBox, x+4 yp   gCheckbox, CheckBox
Gui, Add, ComboBox, x4  w120 gComboBox, ComboBox
Gui, Add, Edit,     x4  w120 gEdit,     Edit
Gui, Add, Slider,x4 y+4 w248 gSlider    AltSubmit,   25
Gui, Add, Picture,y4 x130 w48 h48 Icon1 gPic1,%A_ahkpath%
Gui, Add, Picture,y4 x184 w48 h48 Icon2 gPic2,%A_ahkpath%
Gui, Add, Picture,y56 x130 w48 h48 Icon3 gPic3,%A_ahkpath%
Gui, Add, Picture,y56 x180 w48 h48 Icon4 gPic4,%A_ahkpath%
Gui, Show,w256, LibCon Test GUI Interaction
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

Button2:
puts("Button2 was pressed")
return

Radio:
puts("Radio was clicked")
return

CheckBox:
puts("CheckBox was clicked")
return

ComboBox:
puts("ComboBox was clicked/changed")
return

Edit:
puts("Edit was changed")
return

Slider:
puts("Slider was clicked/Moved")
return

Pic1:
puts("Picture 1 was clicked")
return

Pic2:
puts("Picture 2 was clicked")
return

Pic3:
puts("Picture 3 was clicked")
return

Pic4:
puts("Picture 4 was clicked")
return

GuiClose:
Gui,Destroy
puts("Gui was Closed")
return
