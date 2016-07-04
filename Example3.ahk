
#SingleInstance,Off
#Include LibCon.ahk ;Needed
#NoTrayIcon ;Suggested
SetBatchLines,-1 ;suggested
LibConDebug:=1 ;let the user know about errors
StartConsole() ;Shows the Console (new/seperate) and 'initializes' the library

AutoTrim, Off ;needed for this example
SetWinDelay,0 ;optional
;<<<<<<<<  HEADER END  >>>>>>>>>

if LibConVersion < 1.0.5.0
{
	puts("sorry... LibCon v1.0.5.0 and Up is required to run this script.")
	Pause(0)
	ExitApp
}

;Create self-referrer
self:="ahk_pid " DllCall("GetCurrentProcessId") ;or use: ahk_id with getConsoleHandle()

;Save the original console size
GetConsoleSize(ocW,ocH)

;Save the original window size
WinGetPos,,,owW,owH,%self%

;Set the text (foreground) color to yellow on black
setcolor(Yellow,0)

;save the color
oc:=getcolor()

;Save original cursor settings
getconsoleCursorInfo(oCurSz,oCurSw)

;Save the original console "mode"
getConsoleMode(oCMode)

;Save Font size
fH:=GetFontHeight()
fW:=GetFontWidth()

;set vars
cH:=31
cW:=80
title:="Untitled GUI"
INT_MAX:=32768
lastcolor_at_cursor:=-1
print_n:=0
;set gui colors -- Note: Blue, Gray, Black, DarkGray are defined in LibCon.ahk
consoleGUI.BgColor:=Blue
consoleGUI.FgColor:=Gray
consoleGUI.cFgColor:=Black ;ClientArea
consoleGUI.cBgColor:=DarkGray ;ClientArea

;print start/intro message
puts( "Testing ConsoleWindow_FakeGUI...`n`n")
puts( "`t     Window Specifications")
puts( "`t_______________________________")
putsf( "`t    Title: ""%s""",title)
putsf("`t   Colums: %s",cW)
putsf("`t     Rows: %s",cH)
puts( "`t_______________________________`n")
puts( "`nNOTICE: The Loading Message is fake...")
newline()

;Disable selection "mode" if active
SetConsoleMode(0x0080)
;Ensure Mouse input is enabled
SetConsoleMode(0x0010)

;Wait for mouse double click
puts("Please double click to continue.")
Loop
{
	E := ReadConsoleInput()
	if(E.EventType = 2 && E.EventInfo[5] = 2)
		break
}

KeyWait Space ;is a used 'key' / blocked for later

;enable selection "mode"
SetConsoleMode((0x0040|0x0080))

;Hide the cursor
setconsoleCursorInfo(oCurSz,0)

;Clear the screen, prepare for draw routine
;and set cursor to (0,0)
clearscreen()

;Set the console size
;and +1 to correctly draw later
setconsolesize(cW+1,cH+1)

;Correctly size the window accordingly (max the window size)
;WinMove,%self%,,,,%INT_MAX%,%INT_MAX%
WinMove,%self%,,,, % (cW+5)*fW , (cH+5)*fH

;draw the gui (background)
consoleGUI.Draw(title)

;set cursor back to (0,0)
setConsoleCursorPos(0,0)

;draw the "tip!" message
gosub print_tip

;Load Pages into memory // Load Text into vars
gosub Load_txt

;Start Draw Update routine
update_draw:

	;Determine which page to print (print_n is print number)
	if (print_n==1)
		consoleGUI.print_page("The Zlib License",ZLIB,4)
	else if (print_n==2)
		consoleGUI.print_page("Lorem Ipsum",LOREMIPSUM,6)
	else
		consoleGUI.print_page("The MIT License",MIT,4)
	
	;switch the print number for next page switch // the "page switcher"
	print_n:=(print_n==1)?2:(print_n==2)?3:1
	
	;set the color for the "status bar"
	setcolor(Black,consoleGUI.FgColor)
	
	;the Coordmode of the mouse relative to the "console gui" area
	CoordMode,Mouse,Client
	
	;Draw/Prepare the status bar at the bottom of the gui
	setConsoleCursorPos(24,cH-2)
	printf("  Size: [%s,%s] ",cW,cH)
	setConsoleCursorPos(cW-strlen(quit_msg:=" Press Esc to quit ")-1,cH-2)
	print(quit_msg)
	setConsoleCursorPos(1,cH-2)
	print(" Mouse coords: ")
	
	;Redraw to correct graphic issues, if any
	WinSet, Redraw,,%self%
	
	;Start internal draw loop
	Loop {
		Sleep 10 ;avoid CPU overload
		
		;make the loop take action only when the window is active
		if (!WinActive(self))
			continue
		
		;get the mouse position
		MouseGetPos,mx,my
		
		;Set the quit "hotkey"
		if (GetKeyState("Esc","P"))
			break
		
		;set the change page "hotkey"
		if (GetKeyState("Space","P"))
		{
			KeyWait Space
			
			;Draw next page
			goto update_draw
		}
		
		;if the mouse moved, redraw the cursor and mouse position in status bar
		if ( (mx!=lmx) || (my!=lmy) )
		{
			;set cursor to mouse coords (draw area) in statusbar
			setConsoleCursorPos(16,cH-2)
			
			;Calculate mouse position, relative to the console 'chars'
			_mx:=(mx//fw)
			_my:=(my//fh)
			_mx:=(_mx>cW-1)?cW-1:((_mx<0)?0:_mx) ;-1 is used, because the console's
			_my:=(_my>cH-1)?cH-1:((_my<0)?0:_my) ;... cursor position origin is (0,0)
			
			;Draw The cursor
				;if the cursor position and colors (the vars) are valid
				;Erase last cursor drawn at position (essentially reset to original colors at last position)
				if ( (_lmx!="") && (_lmy!="") && (lastcolor_at_cursor>=0) )
					SetColorPos(lastcolor_at_cursor,_lmx,_lmy) ;FillConsoleOutputAttribute(lastcolor_at_cursor,1,_lmx,_lmy)
				
				;save the current position's colors for reset later, before drawing new cursor
				lastcolor_at_cursor:=GetColorPos(_mx,_my) ;ReadConsoleOutputAttribute(lastcolor_at_cursor,1,_mx,_my)
				
				;set/draw the cursor
				SetColorPos((Yellow*16)+Black,_mx,_my) ;FillConsoleOutputAttribute((Yellow*16)+Black,1,_mx,_my)
			
			;Print mouse coords in "statusbar"
			printf("[%s,%s]  ",_mx,_my)
			
			;save mouse info for later
			lmx:=mx
			lmy:=my
			_lmx:=_mx
			_lmy:=_my
			
			;Redraw to correct graphic issues, if any
			WinSet, Redraw,,%self%
		}
	}
	
;Quit key was pressed. Reset everything.

;Reset original colors
setcolor(oc,0)

;Clear the screen
clearscreen()

;Reset console size
setConsoleSize(ocW,ocH)

;Reset window size
WinMove,%self%,,,,%owW%,%owH%

;Reset cursor visibility
setconsoleCursorInfo(oCurSz,oCurSw)

;Reset console mode
getConsoleMode(oCMode)

;print end/quit message
puts("Execution over.")

;Wait for keypress
Pause()

;Exit program
ExitApp
return

print_tip:
	;save the color, for reset later
	before_tip_color:=getcolor()

	;Set the color for the tip message
	setcolor(Black,DarkGreen)

	;Draw the tip in the top right corner
	setConsoleCursorPos(cW-strlen(tip_msg:=" TIP! : Press Space for Next Page ")-1,1)
	printf(tip_msg)
	setConsoleCursorPos(cW-strlen(tip_msg:="        LClick=Select RClick=Copy ")-1,2)
	printf(tip_msg)

	;reset color to what was before the tip
	setcolor(before_tip_color,0)
return

Load_txt:
;Initialize vars with content
MIT =
(
The MIT License (MIT)

Copyright (c) Joe DF (joedf@users.sourceforge.net)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
)

ZLIB =
(
The zlib/libpng License (Zlib)

Copyright (c) <year> <copyright holders>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute
it freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must
   not claim that you wrote the original software. If you use this
   software in a product, an acknowledgment in the product
   documentation would be appreciated but is not required.

2. Altered source versions must be plainly marked as such, and must
   not be misrepresented as being the original software.

3. This notice may not be removed or altered from any source
   distribution.
)

LOREMIPSUM =
(
%A_space%                         - Lorem Ipsum -

  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
%A_space%                consectetur, adipisci velit..."
  "There is no one who loves pain itself, who seeks after it and
%A_space%         wants to have it, simply because it is pain..."

The standard Lorem Ipsum passage, used since the 1500s

" Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
  eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
  ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
  aliquip ex ea commodo consequat. Duis aute irure dolor in
  reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
  pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
  culpa qui officia deserunt mollit anim id est laborum. "
  
  
%A_space%                             http://www.lipsum.com/ (November, 2013)
)
return

;consoleGUI functions
class consoleGUI {
	
	;Gui colors
	static BgColor
	static FgColor
	static cFgColor ;ClientArea
	static cBgColor ;ClientArea
	
	Draw(title="Untitled GUI") {
		setConsoleCursorPos(0,0) ;bring back up
		this.HorizontalBar(title)
		Loop % ((GetConsoleClientHeight()//GetFontHeight())-3)
			this.VerticalBar()
		this.HorizontalBar("") ;bottom
	}

	print_page(title,text,y) {
		;clean the gui in case it contains anything
		this.print_clean()
		
		offset_txt:=6
		setConsoleCursorPos(0,0)
		this.HorizontalBar(title)
		setcolor(this.cFgColor,this.cBgColor)
		setConsoleCursorPos(offset_txt,y)
		Loop, parse, text, `n, `r
		{
			setConsoleCursorPos(offset_txt)
			puts(A_LoopField)
		}
	}
	
	print_clean(delay=250) {
		setcolor(this.cFgColor,this.cBgColor)
		setConsoleCursorPos(offset_txt:=6,4)
		spaces:="                                                                      "
		Loop, 22
		{
			;msgbox Line number %A_Index% is %A_LoopField%
			setConsoleCursorPos(offset_txt)
			if (A_Index==11)
				puts("                             Loading...                               ")
			else
				puts(spaces)
		}
		Sleep %delay%
		setConsoleCursorPos(offset_txt,14)
		puts(spaces)	
	}

	HorizontalBar(Text="") {
		if ((l:=StrLen(text))>0) {
			l+=4, w:=((x:=getconsolewidth())-l)//2, z:=(u:="")
			loop % w
				u=%u%_
			fs=%u%
			fm=[ %text% ]
			fe=%u%
			f=%fs%%fm%%fe%
			Loop % abs(x-StrLen(f))
				z=%z%_
			fe=%fe%%z%
			oc:=getcolor()
			setcolor(this.FgColor,this.BgColor)
			print(fs)
			setcolor(this.BgColor,this.FgColor)
			print(fm)
			setcolor(this.FgColor,this.BgColor)
			print(fe)
			setcolor(oc,0)
			return
		} else {
			u:=""
			loop % getconsolewidth()
				u=%u%_
			oc:=getcolor()
			setcolor(this.FgColor,this.BgColor)
			print(u)
			setcolor(oc,0)
			return
		}
	}

	VerticalBar() {
		x:=getconsolewidth()
		oc:=getcolor()
		setcolor(this.FgColor,this.BgColor)
		print("|")
		b:=""
		Loop % (x-2)
			b=%b%%A_space%
		setcolor(this.cBgColor,this.cBgColor)
		print(b)
		setcolor(this.FgColor,this.BgColor)
		print("|")
		setcolor(oc,0)
	}
}

