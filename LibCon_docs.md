LibCon : Documentation
=====================================

#Table of Contents#
- [Library Global Variables](#global-vars)
    - [Defaults](#defaults)
    - [Predefined Variables](#predefined-variables)
    - [Console Color Constants](#console-color-constants)
- [Library Functions](#library-functions)
    - [StartConsole()](#startconsole)
    - [AttachConsole( cPID )](#attachconsole-cpid-)
    - [FreeConsole()](#freeconsole)
    - [setColor( FG="", BG="" )](#setcolor-fg-bg-)
    - [setFgColor( c )](#setfgcolor-c-)
    - [setBgColor( c )](#setbgcolor-c-)
    - [getColor()](#getcolor)
    - [getFgColor()](#getfgcolor)
    - [getBgColor()](#getbgcolor)
    - [printcolortable()](#printcolortable)
    - [newline( x=1 )](#newline-x1-)
    - [puts( string="" )](#puts-string-)
    - [print( string="" )](#print-string-)
    - [printf( msg, vargs* )](#printf-msg-vargs-)
    - [putsf( msg, vargs* )](#putsf-msg-vargs-)
    - [printW( string="" )](#printw-str-)
    - [printWf( msg, vargs* )](#printwf-msg-vargs-)
    - [putsW( string="" )](#putsw-str-)
    - [putsWf( msg, vargs* )](#putswf-msg-vargs-)
    - [ClearScreen()](#clearscreen)
    - [gets( ByRef var="" )](#gets-byref-var-)
    - [getch( ByRef keyname )](#getch-byref-keyname-)
    - [wait( timeout=0 )](#wait-timeout0-)
    - [WaitAction()](#waitaction)
    - [pause( show=1 )](#pause-show1-)
    - [dec2hex( var )](#dec2hex-var-)
    - [ToBase( n, b )](#tobase-n-b-)
    - [sProgressBar( Length, Current, Max, Unlock = 0, fixed=1, lp="|", lba="[", lbb="]" )](#sprogressbar-length-current-max-unlock--0-fixed1-lp-lba-lbb-)
    - [getConsoleSize( ByRef bufferwidth, ByRef bufferheight )](#getconsolesize-byref-bufferwidth-byref-bufferheight-)
    - [getConsoleWidth()](#getconsolewidth)
    - [getConsoleHeight()](#getconsoleheight)
    - [getConsoleHandle()](#getconsolehandle)
    - [flushInput()](#flushinput)
    - [getFontSize( Byref fontwidth, ByRef fontheight )](#getfontsize-byref-fontwidth-byref-fontheight-)
    - [getFontWidth()](#getfontwidth)
    - [getFontHeight()](#getfontheight)
    - [setConsoleSize( width, height, SizeHeight=0 )](#setconsolesize-width-height-sizeheight0-)
    - [getConsoleCursorPosition( ByRef x, ByRef y )](#getconsolecursorposition-byref-x-byref-y-)
    - [SetConsoleCursorPosition( x="", y="" )](#setconsolecursorposition-x--y--)
    - [GetConsoleOriginalTitle( byRef Title )](#getconsoleoriginaltitle-byref-title-)
    - [GetConsoleTitle( byRef Title )](#getconsoletitle-byref-title-)
    - [SetConsoleTitle( title="" )](#setconsoletitle-title-)
    - [SetConsoleInputCP( codepage )](#setconsoleinputcp-codepage-)
    - [GetConsoleInputCP()](#getconsoleinputcp)
    - [SetConsoleOutputCP( codepage )](#setconsoleoutputcp-codepage-)
    - [GetConsoleOutputCP()](#getconsoleoutputcp)
    - [LibConError( fname:="", arg1:="", arg2:="", arg3:="", arg4:="" )](#libconerror-fname-arg1-arg2-arg3-arg4-)

<a id="library-functions"></a>
##Library Functions##
-----
<a id="startconsole"></a>
####**_StartConsole()_**####

----
```
Description: Opens up a New Console Window that 'belongs' (attached) to the current
             AutoHotkey Thread. Also, Sets the Library's Global variables:
             Stdout (Object) and Stdin (Object)
      Input: None  
     Output: Success is Non-Zero, Failure is Zero
```
<a id="attachconsole-cpid-"></a>
####**_AttachConsole( cPID )_**####

----
```
Description: Attach to a Console was already running. Although, it is suggested to use
             'StartConsole()' when possible. (Since this mode is still experimental
             and rarely used anyways)
      Input: The target Console's PID 
     Output: Success is Non-Zero, Failure is Zero
```
<a id="freeconsole"></a>
####**_FreeConsole()_**####

----
```
Description: Detach/Terminate current Console and keeps AutoHotkey running
             till the script exits.
      Input: None
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setcolor-fg-bg-"></a>
####**_setColor( FG="", BG="" )_**####

----
```
Description: Sets the Current Console's Foreground and Background Colors.
             (A.K.A. Text color and Text Background color)
      Input: FG (Foreground) - Set the Foreground color (Hexadecimal Value)
             BG (Background) - Set the Background color (Hexadecimal Value)
             Note: The 'Console Color Constants' may be used here.
             Default: No change to current color
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setfgcolor-c-"></a>
####**_setFgColor( c )_**####

----
```
Description: Synonym for 'setColor(FG)' - see 'setColor()' for details.
      Input: FG (Foreground) - Set the Foreground color (Hexadecimal Value)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setbgcolor-c-"></a>
####**_setBgColor( c )_**####

----
```
Description: Synonym for 'setColor("",BG)' - see 'setColor()' for details.
      Input: BG (Background) - Set the Background color (Hexadecimal Value)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getcolor"></a>
####**_getColor()_**####

----
```
Description: Returns the current color (Hexadecimal Value)
             Note: It may be suggest to simply use the 'getFgColor()'
             and the 'getBgColor()' functions instead since they are
             more user friendly. See 'Console Color Constants' for all
             possible color values.
      Input: None
     Output: Success is Non-Zero, Failure is Undefined
```
<a id="getfgcolor"></a>
####**_getFgColor()_**####

----
```
Description: Returns the current Foreground color (Hexadecimal Value)
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: Success is Non-Zero, Failure is Undefined
```
<a id="getbgcolor"></a>
####**_getBgColor()_**####

----
```
Description: Returns the current Background color (Hexadecimal Value)
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: Success is Non-Zero, Failure is Undefined
```
<a id="printcolortable"></a>
####**_printcolortable()_**####

----
```
Description: Prints a Color table with all the Color Constants.
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: None
```
<a id="newline-x1-"></a>
####**_newline( x=1 )_**####

----
```
Description: Prints (empty) new lines. Number of new lines varies
             on the input value.
             Default: Prints an empty new line.
      Input: Number of (empty) new lines to print
     Output: None
```
<a id="puts-string-"></a>
####**_puts( string="" )_**####

----
```
Description: Prints a String with a new line.
             Default: Prints an empty new line.
      Input: The String to be printed
     Output: None
```
<a id="print-string-"></a>
####**_print( string="" )_**####

----
```
Description: Prints a String without a new line. Same as 'puts()' except
             without a new line.
             Default: Prints Nothing. 'Flushes' Stdout.
      Input: The String to be printed
     Output: None
```
<a id="printf-msg-vargs-"></a>
####**_printf( msg, vargs* )_**####

----
```
Description: Synonym for 'print("hello" . Name . "!")' except that in this funtion
             it is used like so 'printf("hello %s!",Name)'. This function is
             essentially the same as in the 'printf' in C/C++, except here, the
             only format specifier is '%s', since almost everything in AutoHotkey
             can be treated as a string.
             Default: Prints Nothing. 'Flushes' Stdout. (Same behaviour as 'print()'
      Input: The 'format' String to be printed
     Output: None
```
<a id="putsf-msg-vargs-"></a>
####**_putsf( msg, vargs* )_**####

----
```
Description: Synonym for 'puts("hello" . Name . "!")' except that in this funtion
             it is used like so 'putsf("hello %s!",Name)'. Same as 'printf()'
             execept without a new line.
             Default: Prints a new line. (Same behaviour as 'puts()')
      Input: The String to be printed
     Output: None
```
<a id="printw-str-"></a>
####**_printW( str )_**####

----
```
Description: "Writes a character string to a console screen buffer beginning at the current cursor location". This function is used for Unicode Printing Support. Otherwise, same as print()
       Note: Fails (with SetConsoleInputCP(65001) = Unicode (UTF-8) ), if the current (console) font does not have Unicode support, seems to function otherwise...
   MSDN URL: http://msdn.microsoft.com/library/ms687401
      Input: The Unicode/other String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="printwf-msg-vargs-"></a>
####**_printWf( msg, vargs* )_**####

----
```
Description: A 'printf()' version of printW(). see 'printf()'
      Input: The Unicode/other 'format' String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="putsw-str-"></a>
####**_putsW( str )_**####

----
```
Description: Same as 'printfW()' with a new line.
   MSDN URL: http://msdn.microsoft.com/library/ms687401
      Input: The Unicode/other String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="putswf-msg-vargs-"></a>
####**_putsWf( msg, vargs* )_**####

----
```
Description: A 'printf()' version of putsW(). see 'printf()'
      Input: The Unicode/other 'format' String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="clearscreen"></a>
####**_ClearScreen()_**####
 
----
```
Description: Clears the Current Console's Screen.
   Synonyms: 'cls()' and 'Clear()'
      Input: None
     Output: None
```
<a id="gets-byref-var-"></a>
####**_gets( ByRef var="" )_**####

----
```
Description: Gets/Obtains input from the console user, until a carriage return '`r'
             has been received. The carriage return is trimmed off (not recorded).
      Input: The Varible in which to store the inputed/obtained string (Optional)
     Output: The inputed/obtained string
```
<a id="getch-byref-keyname-"></a>
####**_getch( ByRef keyname )_**####

----
```
Description: Gets/Obtains a single key from the user. This may be used for something
             like "Press any key to continue" or "press Q to quit".
             Note: This function is "case sensitive" (Capture)
      Input: The Varible in which to store the Key Name (string) (Optional)
     Output: The Key Code
```
<a id="wait-timeout0-"></a>
####**_wait( timeout=0 )_**####

----
```
Description: Gets/Obtains a single key from the user. This may be used for something
             like "Press any key to continue" or "press Q to quit" with a timeout.
       Note: 'wait()' triggers persistence, meaning the script will not exit automatically when the end of the script has been reached.
      Input: The number of seconds until timeout (Optional)
     Output: The Key Code
```
<a id="waitaction"></a>
####**_WaitAction()_**####

----
```
Description: Gets/Obtains a single input (Captures Everything: mouse move, key press,
             etc...) from the user. This may be used for something
             like "Press any key to continue" or "Mouse Click to quit".
             IMPORTANT Note: This function is still experimental!
      Input: None
     Output: The Key Code (vk or sc - Undefined for the moment...)
     Credit: by gwarble
```
<a id="pause-show1-"></a>
####**_pause( show=1 )_**####
 
----
```
Description: Wait until the user presses a key. This may be used for something
             like "Press any key to continue".
             Default: Displays "Press any key to continue".
      Input: Display the default message (Boolean) (Optional)
     Output: None
```
<a id="dec2hex-var-"></a>
####**_dec2hex( var )_**####

----
```
Description: Converts a decimal value to a hexadecimal value.
      Input: The Decimal value to be converted (Number) (Optional)
     Output: The convert value Hexadecimal value (Number)
```
<a id="tobase-n-b-"></a>
####**_ToBase( n, b )_**####

----
```
Description: Converts a decimal value to a specified base value. The base is
             between 10 to 36 inclusive.
      Input: The Decimal value to be converted (Number) (Optional)
     Output: The convert value in the specified base value (Number)
     Credit: by Laszlo
```
<a id="sprogressbar-length-current-max-unlock--0-fixed1-lp-lba-lbb-"></a>
####**_sProgressBar( Length, Current, Max, Unlock = 0, fixed=1, lp="|", lba="[", lbb="]" )_**####

----
```
Description: Displays an 'ASCII' progress bar.
      Input: Length  - The total lenght of the progress bar (strlen)
             Current - The current progress value
             Max     - The maximum value possible of progress
             Unlock  - Remove Length limitations, default: Minimum of 4,
                       Maximum of 97.
             fixed   - Forces the progress bar to grow (instead of fixed size)
                       Example: |||||| 60% Completed
                                ||||||||| 90% Completed
                                etc..
             lp      - Progress Indicator Charater (Line progress)
             lba     - Start Progress Border Character (Line Border A)
             lbb     - End Progress Border Character (Line Border B)
     Output: The 'ASCII' progress bar (String)
     Credit: by Bugz000 with assistance from tidbit, Chalamius and Bigvent /
             forked by joedf
```
<a id="getconsolesize-byref-bufferwidth-byref-bufferheight-"></a>
####**_getConsoleSize( ByRef bufferwidth, ByRef bufferheight )_**####

----
```
Description: Get the Console's buffer size in columns and lines (rows),
             meaning one line height is a character's height, and the
             column's width is a character's width.
      Input: bufferwidth - The Varible in which to store the buffer's width (Number)
             bufferheight - The Varible in which to store the buffer's height (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsolewidth"></a>
####**_getConsoleWidth()_**####

----
```
Description: Shorthand for 'getConsoleSize()'. Get the Console's buffer's Width.
      Input: None
     Output: The buffer's Width (Number)
```
<a id="getconsoleheight"></a>
####**_getConsoleHeight()_**####

----
```
Description: Shorthand for 'getConsoleSize()'. Get the Console's buffer's Height.
      Input: None
     Output: The buffer's Height (Number)
```
<a id="getconsolehandle"></a>
####**_getConsoleHandle()_**####

----
```
Description: Get the console's window Handle (Hwnd).  
        	 (usually under the name of hConsole)  
      Input: None
     Output: The Console's window handle (Hwnd)
```
<a id="flushinput"></a>
####**_flushInput()_**####

----
```
Description: Flushes the console input buffer. All input records currently in the input buffer are discarded.  
   MSDN URL: http://msdn.microsoft.com/library/ms683147  
      Input: None  
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getfontsize-byref-fontwidth-byref-fontheight-"></a>
####**_getFontSize( Byref fontwidth, ByRef fontheight )_**####

----
```
Description: the width and height of each character in the font, in logical units. The X member contains the width, while the Y member contains the height.
      Input: fontwidth - The Varible in which to store the font's width (Number)
             fontheight - The Varible in which to store the font's height (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getfontwidth"></a>
####**_getFontWidth()_**####

----
```
Description: Get the current font's width. Shorthand for getFontSize()
      Input: None
     Output: The Font's width (in pixels)
```
<a id="getfontheight"></a>
####**_getFontHeight()_**####

----
```
Description: Get the current font's height. Shorthand for getFontSize()
      Input: None
     Output: The Font's height (in pixels)
```
<a id="setconsolesize-width-height-sizeheight0-"></a>
####**_setConsoleSize( width, height, SizeHeight=0 )_**####

----
```
Description: Set the Console's buffer size, No need to worry about the window size, this function does automatic resizing of the console's window if necessary. the size is in columns and lines (rows),
             meaning one line height is a character's height, and the
             column's width is a character's width.
   MSDN URL: http://msdn.microsoft.com/library/ms686044
      Input: width  - The console's width (Number)
			 height - The console's height (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsolecursorposition-byref-x-byref-y-"></a>
####**_getConsoleCursorPosition( ByRef x, ByRef y )_**####

----
```
Description: Get the Cursor's (or caret) current position. The origin is (0,0)
   MSDN URL: http://msdn.microsoft.com/library/ms683171
      Input: x - The Varible in which to store the cursor's x pos. (Number)
             y - The Varible in which to store the cursor's y pos. (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsolecursorposition-x--y--"></a>
####**_SetConsoleCursorPosition( x="", y="" )_**####

----
```
Description: Sets the cursor position in the specified console screen buffer.
   MSDN URL: http://msdn.microsoft.com/library/ms686025
      Input: x - The desired Cursor's x pos. (Number)
			 y - The desired Cursor's y pos. (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoleoriginaltitle-byref-title-"></a>
####**_GetConsoleOriginalTitle( byRef Title )_**####

----
```
Description: Retrieves the original title for the current console window.
      Input: Title - The variable in which to store the original title. (String)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoletitle-byref-title-"></a>
####**_GetConsoleTitle( byRef Title )_**####

----
```
Description: Retrieves the title for the current console window.
   MSDN URL: http://msdn.microsoft.com/library/ms683174
      Input: Title - The variable in which to store the current title. (String)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsoletitle-title-"></a>
####**_SetConsoleTitle( title="" )_**####

----
```
Description: Sets the title for the current console window.
   MSDN URL: http://msdn.microsoft.com/library/ms686050
      Input: title - The desired title for the current console window.
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsoleinputcp-codepage-"></a>
####**_SetConsoleInputCP( codepage )_**####

----
```
Description: Sets the input code page used by the console. A console uses its input code page to translate keyboard input into the corresponding character value.
   MSDN URL: http://msdn.microsoft.com/library/ms686013
      Input: codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoleinputcp"></a>
####**_GetConsoleInputCP()_**####

----
```
Description: Retrieves the input code page used by the console. A console uses its input code page to translate keyboard input into the corresponding character value.
   MSDN URL: http://msdn.microsoft.com/library/ms683162
      Input: None
     Output: codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
```
<a id="setconsoleinputcp-codepage-"></a>
####**_SetConsoleOutputCP( codepage )_**####

----
```
Description: Sets the output code page used by the console. A console uses its output code page to translate the character values written by the various output functions into the images displayed in the console window.
   MSDN URL: http://msdn.microsoft.com/library/ms686036
      Input:  codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoleoutputcp"></a>
####**_GetConsoleOutputCP()_**####

----
```
Description: Retrieves the output code page used by the console. A console uses its output code page to translate the character values written by the various output functions into the images displayed in the console window.
   MSDN URL: http://msdn.microsoft.com/library/ms683169
      Input: None
     Output: codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
```
<a id="libconerror-fname-arg1-arg2-arg3-arg4-"></a>
####**_LibConError( fname:="", arg1:="", arg2:="", arg3:="", arg4:="" )_**####

----
```
Description: Explicit Error Handling towards the user. Msgboxes for Errors (DebugMode Only) (Abort, Retry, Ignore). See source for usage... Used for Basic ErrorHandling.
      Input: fname - the function's callname
    		 arg1  - the 1st which the function was called with.
			 arg.. - etc...
     Output: Success is Non-Zero, Failure is Zero
```
<a id="global-vars"></a>
##Global Vars##
----
<a id="defaults"></a>
###Defaults###
----

```
SetWinDelay, 0
SetBatchLines,-1
```
<a id="predefined-variables"></a>
###Predefined Variables###
----
 
**_LibConDebug_** is either set 1 (true) or 0 (false) to enable/disable LibConDebug Mode.  
*Definition (default):* ```LibConDebug := 0 ;Enable/Disable DebugMode```

**_LibConErrorLevel_** is a variable that is used internally for LibConDebug Mode.  
*Definition:* ```LibConErrorLevel := 0 ;Used For DebugMode```

**_sType_** is an Object that is used when coding with structures and DllCalls.  
*Definition:*  
```;Type sizes (Bytes) // http://msdn.microsoft.com/library/aa383751.aspx```   
```sType := Object("SHORT", 2, "COORD", 4, "WORD", 2, "SMALL_RECT", 8, "DWORD", 4, "LONG", 4)```

**_Stdin_** is an Object that is used to reference the currently attached console's Input buffer.  
*Definition:* ```Stdin := FileOpen(DllCall("GetStdHandle", "int", -10, "ptr"), "h `n")```

**_Stdout_** is an Object that is used to reference the currently attached console's Output buffer.  
*Definition:* ```Stdout :=FileOpen(DllCall("GetStdHandle", "int", -11, "ptr"), "h `n")```

<a id="console-color-constants"></a>
###Console Color Constants###
----

    Black:=0x0
	DarkBlue:=0x1
	DarkGreen:=0x2
	Turquoise:=0x3
	DarkGreenBlue:=0x3
	GreenBlue:=0x3
	DarkRed:=0x4
	Purple:=0x5
	Brown:=0x6
	Gray:=0x7
	Grey:=0x7
	DarkGray:=0x8
	DarkGrey:=0x8
	Blue:=0x9
	Green:=0xA
	Cyan:=0xB
	Red:=0xC
	Magenta:=0xD
	Pink:=0xD
	Yellow:=0xE
	White:=0xF