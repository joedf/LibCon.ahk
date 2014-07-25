LibCon : Documentation
=====================================

##Table of Contents##
- [Library Global Variables](#global-vars)
    - [Defaults](#defaults)
    - [Predefined Variables & Objects](#predefined-variables--objects)
    - [Console Color Constants](#console-color-constants)
- Library Functions
    - Showing and Hiding the Console
        - [SmartStartConsole()](#smartstartconsole)
        - [StartConsole()](#startconsole)
        - [AttachConsole( cPID:=-1 )](#attachconsole-cpid-1-)
        - [FreeConsole()](#freeconsole)
    - Input and Output Functions
        - User Interface
            - [NewLine( x=1 )](#newline-x1-)
            - [Puts( string="" )](#puts-string-)
            - [Print( string="" )](#print-string-)
            - [Printf( msg, vargs* )](#printf-msg-vargs-)
            - [Putsf( msg, vargs* )](#putsf-msg-vargs-)
            - [Gets( ByRef var="" )](#gets-byref-var-)
            - [Getch( ByRef keyname )](#getch-byref-keyname-)
            - [ReadConsoleInput()](#readconsoleinput)
            - [ClearScreen()](#clearscreen)
            - [FillConsoleOutputCharacter( cCharacter, nLength, x, y, ByRef lpNumberOfCharsWritten="" )](#fillconsoleoutputcharacter-ccharacter-nlength-x-y-byref-lpnumberofcharswritten-)
            - [ReadConsoleOutput( x, y, w, h )](#readconsoleoutput-x-y-w-h-)
            - [ReadConsoleOutputCharacter( x, y )](#readconsoleoutputcharacter-x-y-)
        - File I/O
            - [SetCurrentDirectory( dir )](#setcurrentdirectory-dir-)
            - [GetCurrentDirectory()](#getcurrentdirectory)
        - Other
            - [FlushInput()](#flushinput)
            - [SetConsoleInputCP( codepage )](#setconsoleinputcp-codepage-)
            - [GetConsoleInputCP()](#getconsoleinputcp)
            - [SetConsoleOutputCP( codepage )](#setconsoleoutputcp-codepage-)
            - [GetConsoleOutputCP()](#getconsoleoutputcp)
    - Console Properties & Settings
        - Color Functions
            - [SetColor( FG="", BG="" )](#setcolor-fg-bg-)
            - [SetFgColor( c )](#setfgcolor-c-)
            - [SetBgColor( c )](#setbgcolor-c-)
            - [SetColorPos( c, x, y )](#setcolorpos-c-x-y-)
            - [GetColor( ByRef FgColor="", ByRef BgColor="" )](#getcolor-byref-fgcolor-byref-bgcolor-)
            - [GetFgColor()](#getfgcolor)
            - [GetBgColor()](#getbgcolor)
            - [GetColorPos( x, y )](#getcolorpos-x-y-)
            - [PrintColorTable()](#printcolortable)
            - [FillConsoleOutputAttribute( wAttribute, nLength, x, y, ByRef lpNumberOfAttrsWritten="" )](#fillconsoleoutputattribute-wattribute-nlength-x-y-byref-lpnumberofattrswritten-)
            - [ReadConsoleOutputAttribute( ByRef lpAttribute, nLength, x, y, ByRef lpNumberOfAttrsRead="" )](#readconsoleoutputattribute-byref-lpattribute-nlength-x-y-byref-lpnumberofattrsread-)
        - Size
            - [GetFontSize( Byref fontwidth, ByRef fontheight )](#getfontsize-byref-fontwidth-byref-fontheight-)
            - [GetFontWidth()](#getfontwidth)
            - [GetFontHeight()](#getfontheight)
            - [GetConsoleSize( ByRef bufferwidth, ByRef bufferheight )](#getconsolesize-byref-bufferwidth-byref-bufferheight-)
            - [GetConsoleWidth()](#getconsolewidth)
            - [GetConsoleHeight()](#getconsoleheight)
            - [SetConsoleSize( width, height, SizeHeight=0 )](#setconsolesize-width-height-sizeheight0-)
            - [SetConsoleWidth( w )](#setconsolewidth-w-)
            - [SetConsoleHeight( h )](#setconsoleheight-h-)
            - [GetConsoleClientSize( ByRef width, ByRef height )](#getconsoleclientsize-byref-width-byref-height-)
            - [GetConsoleClientWidth()](#getconsoleclientwidth)
            - [GetConsoleClientHeight()](#getconsoleclientheight)
        - Cursor
            - [GetConsoleCursorPosition( ByRef x, ByRef y )](#getconsolecursorposition-byref-x-byref-y-)
            - [SetConsoleCursorPosition( x="", y="" )](#setconsolecursorposition-x-y-)
            - [SetConsoleCursorInfo( Size="", Shown="" )](#setconsolecursorinfo-size-shown-)
            - [GetConsoleCursorInfo( ByRef Size="", ByRef Shown="" )](#getconsolecursorinfo-byref-size-byref-shown-)
        - Other
            - [GetConsoleOriginalTitle( byRef Title )](#getconsoleoriginaltitle-byref-title-)
            - [GetConsoleTitle( byRef Title )](#getconsoletitle-byref-title-)
            - [SetConsoleTitle( title="" )](#setconsoletitle-title-)
            - [SetConsoleMode( Mode )](#setconsolemode-mode-)
            - [GetConsoleMode( ByRef Mode )](#getconsolemode-byref-mode-)
    - Miscellaneous Functions
        - [GetConsoleHandle()](#getconsolehandle)
        - [LibConError( fname:="", ByRef arg1:="", ByRef arg2:="", arg3:="", arg4:="", ByRef arg5:="" )](#libconerror-fname-byref-arg1-byref-arg2-arg3-arg4-byref-arg5-)
        - [Wait( timeout=0 )](#wait-timeout0-)
        - [Pause( show=1 )](#pause-show1-)
        - [Dec2Hex( var )](#dec2hex-var-)
        - [ToBase( n, b )](#tobase-n-b-)
        - [sProgressBar( Length, Current, Max, Unlock = 0, fixed=1, lp="|", lba="[", lbb="]" )](#sprogressbar-length-current-max-unlock--0-fixed1-lp-lba-lbb-)

##Library Functions##

<a id="smartstartconsole"></a>
####**_SmartStartConsole()_**####

----
```
Description: Runs StartConsole() if the script was launched run from "Explorer.exe" or
             if the script is not compiled, otherwise it will use AttachConsole on its 
             parent process.
     Notice: This is the usual and recommended way to start a console.
      Input: None  
     Output: Success is Non-Zero, Failure is Zero
```
<a id="startconsole"></a>
####**_StartConsole()_**####

----
```
Description: Opens up a New/Seperate Console Window that 'belongs' (attached) to the current
             AutoHotkey Thread. Also, Sets the Library's Global variables:
             Stdout (Object) and Stdin (Object)
       Note: Only one console is allowed per process.
      Input: None  
     Output: Success is Non-Zero, Failure is Zero
```
<a id="attachconsole-cpid-1-"></a>
####**_AttachConsole( cPID:=-1 )_**####

----
```
Description: Attach to a Console that is currently running. Although, it is suggested to use
             'StartConsole()' when possible. (Since this mode is for console 
             applications, it is suggested to compile your script as console a 
             application. SmartStartConsole() is Recommended.)
      Input: cPID - The target Console's PID 
             Default: Defaults to calling process. ATTACH_PARENT_PROCESS = (DWORD)-1
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
<a id="newline-x1-"></a>
####**_NewLine( x=1 )_**####

----
```
Description: Prints (empty) new lines. Number of new lines varies
             on the input value.
             Default: Prints an empty new line.
      Input: Number of (empty) new lines to print
     Output: None
```
<a id="puts-string-"></a>
####**_Puts( string="" )_**####

----
```
Description: Prints a String with a new line. (has Unicode Support)
             Default: Prints an empty new line.
             Fallback Method: Unicode Support not guaranteed
      Input: The String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="print-string-"></a>
####**_Print( string="" )_**####

----
```
Description: Prints a String without a new line. Same as 'puts()' except
             without a new line. (has Unicode Support)
             Default: Prints Nothing. 'Flushes' Stdout.
             Fallback Method: Unicode Support not guaranteed
      Input: The String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="printf-msg-vargs-"></a>
####**_Printf( msg, vargs* )_**####

----
```
Description: Synonym for 'print("hello" . Name . "!")' except that in this funtion
             it is used like so 'printf("hello %s!",Name)'. This function is
             essentially the same as in the 'printf' in C/C++, except here, the
             only format specifier is '%s', since almost everything in AutoHotkey
             can be treated as a string.
             Default: Prints Nothing. 'Flushes' Stdout. (Same behaviour as 'print()'
      Input: The 'format' String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="putsf-msg-vargs-"></a>
####**_Putsf( msg, vargs* )_**####

----
```
Description: Synonym for 'puts("hello" . Name . "!")' except that in this funtion
             it is used like so 'putsf("hello %s!",Name)'. Same as 'printf()'
             execept without a new line.
             Default: Prints a new line. (Same behaviour as 'puts()')
      Input: The String to be printed
     Output: Success is Non-Zero, Failure is Zero
```
<a id="gets-byref-var-"></a>
####**_Gets( ByRef var="" )_**####

----
```
Description: Gets/Obtains input from the console user, until a carriage return '`r'
             has been received. The carriage return is trimmed off (not recorded).
             (has Unicode Support)
             Fallback Method: Unicode Support not guaranteed
      Input: The Varible in which to store the inputed/obtained string (Optional)
     Output: The inputed/obtained string
```
<a id="getch-byref-keyname-"></a>
####**_Getch( ByRef keyname )_**####

----
```
Description: Gets/Obtains a single key from the user. This may be used for something
             like "Press any key to continue" or "press Q to quit".
             Note: This function is "case sensitive" (Capture)
             (has Unicode Support)
      Input: The Varible in which to store the Key Name (string) (Optional)
     Output: The Key Code
```
<a id="readconsoleinput"></a>
####**_ReadConsoleInput()_**####

----
```
Description: Gets/Obtains a single input (Captures Everything: mouse move, key press,
             etc...) from the user. This may be used for something
             like "Press any key to continue" or "Mouse Click to quit".
   MSDN URL: http://msdn.microsoft.com/library/ms684961
Event types: http://msdn.microsoft.com/library/ms683499
      Input: None
     Output: Event Object, having members 'EventType' and 'EventInfo[]'
     Credit: by Nick McCoy (Ronins)
```
<a id="clearscreen"></a>
####**_ClearScreen()_**####
 
----
```
Description: Clears the Current Console's Screen.
             Fallback Method: Small Performance Drop
   Synonyms: 'cls()' and 'Clear()'
   MSDN URL: http://msdn.microsoft.com/library/ms682022
      Input: None
     Output: Success is Non-Zero, Failure is Zero
```
<a id="fillconsoleoutputcharacter-ccharacter-nlength-x-y-byref-lpnumberofcharswritten-"></a>
####**_FillConsoleOutputCharacter( cCharacter, nLength, x, y, ByRef lpNumberOfCharsWritten="" )_**####

----
```
Description: Writes a character to the console screen buffer a specified number of times,
             beginning at the specified coordinates.
   MSDN URL: http://msdn.microsoft.com/library/ms682663
      Input: cCharacter - The character to be written to the console screen buffer.
             nLength    - The number of character cells to which the character
                          should be written.
             x          - The x coordinate of the COORD structure that specifies
                          the character coordinates of the first cell to which the
                          character is to be written.
             y          - The y coordinate of the COORD structure.
             lpNumberOfCharsWritten - The Varible in which to store the number of characters
                                      to the console screen buffer.
     Output: Success is Non-Zero, Failure is Zero
```
<a id="readconsoleoutput-x-y-w-h-"></a>
####**_ReadConsoleOutput( x, y, w, h )_**####

----
```
Description: Reads a number of characters located in a specified rectangle.
   MSDN URL: http://msdn.microsoft.com/library/ms684965
      Input: x           - The x coordinate of upper left corner of the rectangle.
             y           - The x coordinate of upper left corner of the rectangle.
             w           - The width of the rectangle.
             w           - The height of the rectangle.
     Output: On failure, an empty string is returned.
```
<a id="readconsoleoutputcharacter-x-y-"></a>
####**_ReadConsoleOutputCharacter( x, y )_**####

----
```
Description: Reads a single character from the specified coordinates of a console screen buffer.
   MSDN URL: http://msdn.microsoft.com/library/ms684969
      Input: x           - The x coordinate of the character to read.
             y           - The y coordinate of the character to read.
     Output: On failure, an empty string is returned.
```
<a id="flushinput"></a>
####**_FlushInput()_**####

----
```
Description: Flushes the console input buffer. All input records currently in the  
             input buffer are discarded.  
   MSDN URL: http://msdn.microsoft.com/library/ms683147  
      Input: None  
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsoleinputcp-codepage-"></a>
####**_SetConsoleInputCP( codepage )_**####

----
```
Description: Sets the input code page used by the console. A console uses its
             input code page to translate keyboard input into the corresponding
             character value.
   MSDN URL: http://msdn.microsoft.com/library/ms686013
      Input: codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoleinputcp"></a>
####**_GetConsoleInputCP()_**####

----
```
Description: Retrieves the input code page used by the console. A console uses its
             input code page to translate keyboard input into the corresponding
             character value.
   MSDN URL: http://msdn.microsoft.com/library/ms683162
      Input: None
     Output: codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
```
<a id="setconsoleoutputcp-codepage-"></a>
####**_SetConsoleOutputCP( codepage )_**####

----
```
Description: Sets the output code page used by the console. A console uses its
             output code page to translate the character values written by the
             various output functions into the images displayed in the console window.
   MSDN URL: http://msdn.microsoft.com/library/ms686036
      Input: codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoleoutputcp"></a>
####**_GetConsoleOutputCP()_**####

----
```
Description: Retrieves the output code page used by the console. A console uses its
             output code page to translate the character values written by the 
             various output functions into the images displayed in the console window.
   MSDN URL: http://msdn.microsoft.com/library/ms683169
      Input: None
     Output: codepage - (Number) see "Code Page Identifiers" : http://msdn.microsoft.com/library/dd317756
```
<a id="setcurrentdirectory-dir-"></a>
####**_SetCurrentDirectory( dir )_**####

----
```
Description: Changes the current working directory for the current process.
   MSDN URL: http://msdn.microsoft.com/library/aa365530
      Input: dir - The path to the new current working directory.
                   Note: Absolute, Relative, Drives and UNC Path are all accepted.
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getcurrentdirectory"></a>
####**_GetCurrentDirectory()_**####

----
```
Description: Retrieves the current working directory for the current process.
   MSDN URL: http://msdn.microsoft.com/library/aa364934
      Input: None  
     Output: The Current working directory (Absolute Path). (String)
```
<a id="setcolor-fg-bg-"></a>
####**_SetColor( FG="", BG="" )_**####

----
```
Description: Sets the Current Console's Foreground and Background Colors.
             (A.K.A. Text color and Text Background color)
     Notice: To set the color that received from getColor(), set FG to that
             value, and BG to '0' (zero).
      Input: FG (Foreground) - Set the Foreground color (Hexadecimal Value)
             BG (Background) - Set the Background color (Hexadecimal Value)
             Note: The 'Console Color Constants' may be used here.
             Default: No change to current color
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setfgcolor-c-"></a>
####**_SetFgColor( c )_**####

----
```
Description: Sets the Foreground color.
             Shorthand for setColor()
      Input: FG (Foreground) - Set the Foreground color (Hexadecimal Value)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setbgcolor-c-"></a>
####**_SetBgColor( c )_**####

----
```
Description: Sets the Background color.
             Shorthand for setColor()
      Input: BG (Background) - Set the Background color (Hexadecimal Value)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setcolorpos-c-x-y-"></a>
####**_SetColorPos( c, x, y )_**####

----
```
Description: Sets the color at the specified cursor position.
             Meant to be used with GetColorPos()
             Shorthand for FillConsoleOutputAttribute()
      Input: c - A color value returned by GetColorPos()
             x - The desired Cursor's x pos. (Number)
             y - The desired Cursor's y pos. (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getcolor-byref-fgcolor-byref-bgcolor-"></a>
####**_GetColor( ByRef FgColor="", ByRef BgColor="" )_**####

----
```
Description: Returns the current color (Hexadecimal Value)
             Note: The color returned is both the background and foreground
             colors combined. One may use 'getFgColor()' or 'getBgColor()'
             functions instead get only one of the two colors.
             See 'Console Color Constants' for all possible color values.
     Notice: Later, to set a "combined" color, use: SetColor(YourValueHere,0)
      Input: FgColor - The Varible in which to store the Foreground color (Hex Value)
             BgColor - The Varible in which to store the Background color (Hex Value)
     Output: Success is Non-Zero, Failure is Undefined
```
<a id="getfgcolor"></a>
####**_GetFgColor()_**####

----
```
Description: Returns the current Foreground color (Hexadecimal Value)
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: Success is Non-Zero, Failure is Undefined
```
<a id="getbgcolor"></a>
####**_GetBgColor()_**####

----
```
Description: Returns the current Background color (Hexadecimal Value)
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: Success is Non-Zero, Failure is Undefined
```
<a id="getcolorpos-x-y-"></a>
####**_GetColorPos( x, y )_**####

----
```
Description: Gets the color at the specified cursor position.
             Meant to be used with SetColorPos()
             Shorthand for ReadConsoleOutputAttribute()
      Input: x - The desired Cursor's x pos. (Number)
             y - The desired Cursor's y pos. (Number)
     Output: The color value to be used with SetColorPos()
```
<a id="printcolortable"></a>
####**_PrintColorTable()_**####

----
```
Description: Prints a Color table with all the Color Constants.
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: None
```
<a id="fillconsoleoutputattribute-wattribute-nlength-x-y-byref-lpnumberofattrswritten-"></a>
####**_FillConsoleOutputAttribute( wAttribute, nLength, x, y, ByRef lpNumberOfAttrsWritten="" )_**####

----
```
Description: Sets the character attributes for a specified number of character cells,
             beginning at the specified coordinates in a screen buffer.
   MSDN URL: http://msdn.microsoft.com/library/ms682662
      Input: wAttribute - The "Character attributes" to use when writing to the console screen
                          buffer. Basically, the Color : GetColor() is applicable here.
             nLength    - The number of character cells to be set to the specified
                          color attributes.
             x          - The x coordinate of the COORD structure that specifies the character
                          coordinates of the first cell whose attributes are to be set.
             y          - The y coordinate of the COORD structure.
             lpNumberOfAttrsWritten - The Varible in which to store the number of character
                                      cells whose attributes were actually set.
     Output: Success is Non-Zero, Failure is Zero
```
<a id="readconsoleoutputattribute-byref-lpattribute-nlength-x-y-byref-lpnumberofattrsread-"></a>
####**_ReadConsoleOutputAttribute( ByRef lpAttribute, nLength, x, y, ByRef lpNumberOfAttrsRead="" )_**####

----
```
Description: Gets the character attributes for a specified number of character cells,
             beginning at the specified coordinates in a screen buffer.
   MSDN URL: http://msdn.microsoft.com/library/ms684968
      Input: lpAttribute - The variable in which to store the "Character attributes" to used by console
                           at the specified position.
             nLength     - The number of screen buffer character cells from which to read.
             x           - The x coordinate of the COORD structure that specifies the character
                           coordinates of the first cell from which to read.
             y           - The y coordinate of the COORD structure.
             lpNumberOfAttrsRead - The Varible in which to store the number of attributes actually read.
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getfontsize-byref-fontwidth-byref-fontheight-"></a>
####**_GetFontSize( Byref fontwidth, ByRef fontheight )_**####

----
```
Description: the width and height of each character in the font, in logical units.
       The X member contains the width, while the Y member contains the height.
      Input: fontwidth - The Varible in which to store the font's width (Number)
             fontheight - The Varible in which to store the font's height (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getfontwidth"></a>
####**_GetFontWidth()_**####

----
```
Description: Get the current font's width. Shorthand for getFontSize()
      Input: None
     Output: The Font's width (in pixels)
```
<a id="getfontheight"></a>
####**_GetFontHeight()_**####

----
```
Description: Get the current font's height. Shorthand for getFontSize()
      Input: None
     Output: The Font's height (in pixels)
```
<a id="getconsolesize-byref-bufferwidth-byref-bufferheight-"></a>
####**_GetConsoleSize( ByRef bufferwidth, ByRef bufferheight )_**####

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
####**_GetConsoleWidth()_**####

----
```
Description: Shorthand for 'getConsoleSize()'. Get the Console's buffer's Width.
      Input: None
     Output: The buffer's Width (Number)
```
<a id="getconsoleheight"></a>
####**_GetConsoleHeight()_**####

----
```
Description: Shorthand for 'getConsoleSize()'. Get the Console's buffer's Height.
      Input: None
     Output: The buffer's Height (Number)
```
<a id="setconsolesize-width-height-sizeheight0-"></a>
####**_SetConsoleSize( width, height, SizeHeight=0 )_**####

----
```
Description: Set the Console's buffer size, No need to worry about the window size,
             this function does automatic resizing of the console's window if necessary.
             the size is in columns and lines (rows), meaning one line height is a
             character's height, and the column's width is a character's width.
   MSDN URL: http://msdn.microsoft.com/library/ms686044
      Input: width      - The console's width (Number)
             height     - The console's height (Number)
             SizeHeight - (Boolean) if true, it will try to size the window to
                          its original window height that was before resizing.
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsolewidth-w-"></a>
####**_SetConsoleWidth( w )_**####

----
```
Description: Shorthand for 'SetConsoleSize()'. Set the Console's buffer's Width.
      Input: w - The buffer's Width (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsoleheight-h-"></a>
####**_SetConsoleHeight( h )_**####

----
```
Description: Shorthand for 'SetConsoleSize()'. Set the Console's buffer's Height.
      Input: h - The buffer's Height (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoleclientsize-byref-width-byref-height-"></a>
####**_GetConsoleClientSize( ByRef width, ByRef height )_**####

----
```
Description: Get the Console's Client Area size in pixels.
      Input: width  - The Varible in which to store the console's client width (Number)
             height - The Varible in which to store the console's client height (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsoleclientwidth"></a>
####**_GetConsoleClientWidth()_**####

----
```
Description: Shorthand for 'GetConsoleClientSize()'. Get the Console's buffer's Width.
      Input: None
     Output: The console's client (Area) width (Number)
```
<a id="getconsoleclientheight"></a>
####**_GetConsoleClientHeight()_**####

----
```
Description: Shorthand for 'GetConsoleClientSize()'. Get the Console's buffer's Width.
      Input: None
     Output: The console's client (Area) height (Number)
```
<a id="getconsolecursorposition-byref-x-byref-y-"></a>
####**_GetConsoleCursorPosition( ByRef x, ByRef y )_**####

----
```
Description: Get the Cursor's (or caret) current position.
       Note: The origin is (0,0)
   MSDN URL: http://msdn.microsoft.com/library/ms683171
      Input: x - The Varible in which to store the cursor's x pos. (Number)
             y - The Varible in which to store the cursor's y pos. (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsolecursorposition-x-y-"></a>
####**_SetConsoleCursorPosition( x="", y="" )_**####

----
```
Description: Sets the cursor position.
       Note: The origin is (0,0)
   MSDN URL: http://msdn.microsoft.com/library/ms686025
      Input: x - The desired Cursor's x pos. (Number)
             y - The desired Cursor's y pos. (Number)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="setconsolecursorinfo-size-shown-"></a>
####**_SetConsoleCursorInfo( Size="", Shown="" )_**####

----
```
Description: Sets the cursor height (size) and visibility.
   MSDN URL: http://msdn.microsoft.com/library/ms686019
      Input: Size  - The percentage of a character cell that is filled by the
                     cursor. (Range 1 - 100)
             Shown - The visibility of the cursor. Set to false (zero) to hide
                     the cursor. (Boolean)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsolecursorinfo-byref-size-byref-shown-"></a>
####**_GetConsoleCursorInfo( ByRef Size="", ByRef Shown="" )_**####

----
```
Description: Gets the cursor height (size) and visibility.
   MSDN URL: http://msdn.microsoft.com/library/ms683163
      Input: Size  - The variable in which to store the percentage of a character
                     cell that is filled by the cursor. (Range 1 - 100)
             Shown - The variable in which to store the visibility of the cursor.
                     Set to false (zero), if the cursor is hidden. (Boolean)
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
<a id="setconsolemode-mode-"></a>
####**_SetConsoleMode( Mode )_**####

----
```
Description: Sets the input buffer's mode of the console. (Output not yet supported)
   MSDN URL: http://msdn.microsoft.com/library/ms686033
      Input: Mode - the console mode to be used (Hexadecimal/Number)
             see the Console modes : http://msdn.microsoft.com/library/ms686033
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsolemode-byref-mode-"></a>
####**_GetConsoleMode( ByRef Mode )_**####

----
```
Description: Gets the output buffer's mode of the console. (Input not yet supported)
   MSDN URL: http://msdn.microsoft.com/library/ms683167
      Input: Mode - The variable in which to store the console mode currently used (Hexadecimal/Number)
             see the Console modes : http://msdn.microsoft.com/library/ms686033
     Output: Success is Non-Zero, Failure is Zero
```
<a id="getconsolehandle"></a>
####**_GetConsoleHandle()_**####

----
```
Description: Get the console's window Handle (Hwnd).  
             (usually under the name of hConsole)  
      Input: None
     Output: The Console's window handle (Hwnd)
```
<a id="libconerror-fname-byref-arg1-byref-arg2-arg3-arg4-byref-arg5-"></a>
####**_LibConError( fname:="", ByRef arg1:="", ByRef arg2:="", arg3:="", arg4:="", ByRef arg5:="" )_**####

----
```
Description: Explicit Error Handling towards the user. Msgboxes for Errors (DebugMode Only)
             (Abort, Retry, Ignore). See source for usage... Used for Basic ErrorHandling.
             See "Windows Error Codes" : http://msdn.microsoft.com/library/ms681381
             See "A_LastError" : http://l.autohotkey.net/docs/commands/DllCall.htm#LastError
      Input: fname - the function's callname
             arg1  - the 1st which the function was called with.
             arg.. - etc...
     Output: Success is Non-Zero, Failure is Zero
```
<a id="wait-timeout0-"></a>
####**_Wait( timeout=0 )_**####

----
```
Description: Gets/Obtains a single key from the user. This may be used for something
             like "Press any key to continue" or "press Q to quit" with a timeout.
       Note: 'wait()' triggers persistence, meaning the script will not exit
             automatically when the end of the script has been reached.
      Input: The number of seconds until timeout (Optional)
     Output: The Key Code
```
<a id="pause-show1-"></a>
####**_Pause( show=1 )_**####
 
----
```
Description: Wait until the user presses a key. This may be used for something
             like "Press any key to continue".
             Default: Displays "Press any key to continue..." translated in
             the system's default language.
      Input: Display the default message (Boolean) (Optional)
     Output: Success is Non-Zero, Failure is Zero
```
<a id="dec2hex-var-"></a>
####**_Dec2Hex( var )_**####

----
```
Description: Converts a decimal value to a hexadecimal value.
      Input: The Decimal value to be converted (Number) (Optional)
     Output: The converted Hexadecimal value (Number)
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
<a id="global-vars"></a>
##Global Vars##

<a id="defaults"></a>
###Defaults###
----

```
SetKeyDelay, 0
SetWinDelay, 0
SetBatchLines,-1
```
<a id="predefined-variables--objects"></a>
###Predefined Variables & Objects###
----
**_LibConVersion_** is a string that is set to the current version of LibCon used.  
*Definition (example):* `LibConVersion := "1.0.6.1" ;Library Version`
 
**_LibConDebug_** is either set 1 (true) or 0 (false) to enable/disable LibConDebug Mode.  
*Definition (default):* `LibConDebug := 0 ;Enable/Disable DebugMode`

**_LibConErrorLevel_** is a variable that is used internally for LibConDebug Mode.  
*Definition:* `LibConErrorLevel := 0 ;Used For DebugMode`

**_sType_** is an Object that is used when coding with structures and DllCalls.  
It contains a few type sizes (Bytes). See "[Windows Data Types](http://msdn.microsoft.com/library/aa383751)" : http://msdn.microsoft.com/library/aa383751  
*Definition:*  
`sType := Object("SHORT", 2, "COORD", 4, "WORD", 2, "SMALL_RECT", 8, "DWORD", 4, "LONG", 4, "BOOL", 4, "RECT", 16, "CHAR", 1)`

**_Stdin_** is an Object that is used to reference the currently attached console's Input buffer.  
*Definition:* ```Stdin := FileOpen(DllCall("GetStdHandle", "int", -10, "ptr"), "h `n")```

**_Stdout_** is an Object that is used to reference the currently attached console's Output buffer.  
*Definition:* ```Stdout := FileOpen(DllCall("GetStdHandle", "int", -11, "ptr"), "h `n")```

**_args_** is an Object that is used to reference the arguments the script has received.  
The object is created only when the number of arguments is greater than zero.  
Note: `if (args)` will return true, if the object exists, otherwise, it will return false.

- **_args.CSV_** (or args["CSV"]) - Contains the arguments in [CSV](http://en.wikipedia.org/w/index.php?title=Comma-separated_values&oldid=574459319) format.
- **_args[n]_** - where '**_n_**' (n>0) is the **_n_**'th argument
- **_args[0]_** - is equal to **_argc_**

**_argc_** exists only if the args Object exists. It is set to the number of arguments received.  
*Definition:* `argc=%0%`

<a id="console-color-constants"></a>
###Console Color Constants###
----
```AutoHotkey
Black:=0x0
DarkBlue:=0x1
DarkGreen:=0x2
Turquoise:=0x3
DarkRed:=0x4
Purple:=0x5
Brown:=0x6
Gray:=0x7
DarkGray:=0x8
Blue:=0x9
Green:=0xA
Cyan:=0xB
Red:=0xC
Magenta:=0xD
Pink:=0xD
Yellow:=0xE
White:=0xF
```
