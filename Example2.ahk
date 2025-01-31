#Requires AutoHotkey >=2.0-
#SingleInstance Off
#Include LibCon.ahk ;Needed
#NoTrayIcon ;Suggested
LibConDebug:=1 ;let the user know about errors

SmartStartConsole() ;Shows the Console and 'initializes' the library
;<<<<<<<<  HEADER END  >>>>>>>>>

puts("press a key to create the gui...")
pause(0)
g := Gui("+ToolWindow +E0x40000", "LibCon Test GUI Interaction")
hGUI := g.Hwnd
b1 := g.AddButton("x4 Default", "Button"), b1.OnEvent("Click", g_Button)
b2 := g.AddButton("x+4 yp", "Button2"), b2.OnEvent("Click", g_Button2)
r1 := g.AddRadio("x4", "Radio"), r1.OnEvent("Click", g_Radio)
c1 := g.AddCheckBox("x+4 yp", "CheckBox"), c1.OnEvent("Click", g_Checkbox)
c2 := g.AddComboBox("x4 w120", ["ComboBox"]), c2.OnEvent("Change", g_ComboBox)
e1 := g.AddEdit("x4 w120", "Edit"), e1.OnEvent("Change", g_Edit)
s1 := g.AddSlider("x4 y+4 w248 AltSubmit", "25"), s1.OnEvent("Change", g_Slider)
p1 := g.AddPicture("y4 x130 w48 h48 Icon1", A_ahkpath), p1.OnEvent("Click", g_Pic1)
p2 := g.AddPicture("y4 x184 w48 h48 Icon2", A_ahkpath), p2.OnEvent("Click", g_Pic2)
p3 := g.AddPicture("y56 x130 w48 h48 Icon3", A_ahkpath), p3.OnEvent("Click", g_Pic3)
p4 := g.AddPicture("y56 x180 w48 h48 Icon4", A_ahkpath), p4.OnEvent("Click", g_Pic4)
g.OnEvent("Close", GuiClose)
g.Show("w256")
WinWaitClose("ahk_id " . hGUI)
puts("testing Unicode Input/Output... press a key to continue")
pause(0)
putsf("Current InputCP: %s  OutputCP: %s  ",GetConsoleInputCP(),GetConsoleOutputCP())
puts("UNICODE_¥£¤__%s__UNICODE_¢µ®___")
print("enter some Unicode chars:")
gets(&user_input)
puts(user_input)
pause()
puts("bye!")
Sleep 500
ExitApp

g_Button(g*){
	puts("Button was pressed")
}

g_Button2(g*){
	puts("Button2 was pressed")
}

g_Radio(g*){
	puts("Radio was clicked")
}

g_CheckBox(g*){
	puts("CheckBox was clicked")
}

g_ComboBox(g*){
	puts("ComboBox was clicked/changed")
}

g_Edit(g*){
	puts("Edit was changed")
}

g_Slider(g*){
	puts("Slider was clicked/Moved")
}

g_Pic1(g*){
	puts("Picture 1 was clicked")
}

g_Pic2(g*){
	puts("Picture 2 was clicked")
}

g_Pic3(g*){
	puts("Picture 3 was clicked")
}

g_Pic4(g*){
	puts("Picture 4 was clicked")
}

GuiClose(g){
	g.Destroy()
	puts("Gui was Closed")
}
