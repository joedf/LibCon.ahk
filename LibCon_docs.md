Console Functions & More...
=====================================

##Table of Contents##
- [Library Global Variables](#GlobalVars)
    - [Predefined Variables](#PreDefVar)
    - [Console Color Constants](#ConsoleColors)
- [Library Functions](#library-functions)
    - [StartConsole()](#StartConsole)
    - [AttachConsole( cPID )](#AttachConsole)
    - [FreeConsole()](#FreeConsole)
    - [setColor( FG="", BG="" )](#setColor)
    - [setFgColor( c )](#setFgColor)
    - [setBgColor( c )](#setBgColor)
    - [getColor()](#getColor)
    - [getFgColor()](#getFgColor)
    - [getBgColor()](#getBgColor)
    - [printcolortable()](#printcolortable)
    - [newline( x=1 )](#newline)
    - [puts( string="" )](#puts)
    - [print( string="" )](#print)
    - [printf( msg, vargs* )](#printf)
    - [putsf( msg, vargs* )](#putsf)
    - [ClearScreen()](#ClearScreen)
    - [gets( ByRef var="" )](#gets)
    - [getch( ByRef keyname )](#getch)
    - [wait( timeout=0 )](#wait)
    - [WaitAction()](#WaitAction)
    - [pause(show=1)](#pause)
    - [dec2hex(var)](#dec2hex)
    - [ToBase(n,b)](#ToBase)
    - [sProgressBar( Length, Current, Max, Unlock = 0, fixed=1, lp="|", lba="[", lbb="]" )](#sProgressBar)
    - [getConsoleSize( ByRef bufferwidth, ByRef bufferheight )](#getConsoleSize)
    - [getConsoleWidth()](#getConsoleWidth)
    - [getConsoleHeight()](#getConsoleHeight)

<a id="LibraryFunctions"/>
###Library Functions###
-----

<a id="StartConsole"/>
**_StartConsole()_**

----
```
Description: Opens up a New Console Window that 'belongs' (attached) to the current
             AutoHotkey Thread. Also, Sets the Library's Global variables:
             Stdout (Object) and Stdin (Object)
      Input: None  
     Output: Success is Non-Zero, Failure is Zero
```
 
<a id="AttachConsole"/>
**_AttachConsole( cPID )_**

----
```
Description: Attach to a Console was already running. Although, it is suggested to use
             'StartConsole()' when possible. (Since this mode is still experimental
             and rarely used anyways)
      Input: The target Console's PID 
     Output: Success is Non-Zero, Failure is Zero
```
 
<a id="FreeConsole"/>
**_FreeConsole()_**

----
```
Description: Detach/Terminate current Console and keeps AutoHotkey running
             till the script exits.
      Input: None
     Output: Success is Non-Zero, Failure is Zero
```
 
<a id="setColor"/>
**_setColor( FG="", BG="" )_**

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
 
<a id="setFgColor"/>
**_setFgColor( c )_**

----
```
Description: Synonym for 'setColor(FG)' - see 'setColor()' for details.
      Input: FG (Foreground) - Set the Foreground color (Hexadecimal Value)
     Output: Success is Non-Zero, Failure is Zero
```
 
<a id="setBgColor"/>
**_setBgColor( c )_**

----
```
Description: Synonym for 'setColor("",BG)' - see 'setColor()' for details.
      Input: BG (Background) - Set the Background color (Hexadecimal Value)
     Output: Success is Non-Zero, Failure is Zero
```
 
<a id="getColor"/>
**_getColor()_**

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
 
<a id="getFgColor"/>
**_getFgColor()_** 

----
```
Description: Returns the current Foreground color (Hexadecimal Value)
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: Success is Non-Zero, Failure is Undefined
```
 
<a id="getBgColor"/>
**_getBgColor()_** 

----
```
Description: Returns the current Background color (Hexadecimal Value)
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: Success is Non-Zero, Failure is Undefined
```
 
<a id="printcolortable"/>
**_printcolortable()_**

----
```
Description: Prints a Color table with all the Color Constants.
             See 'Console Color Constants' for all possible color values.
      Input: None
     Output: None
```
 
<a id="newline"/>
**_newline( x=1 )_**

----
```
Description: Prints (empty) new lines. Number of new lines varies
             on the input value.
             Default: Prints an empty new line.
      Input: Number of (empty) new lines to print
     Output: None
```
 
<a id="puts"/>
**_puts( string="" )_**

----
```
Description: Prints a String with a new line.
             Default: Prints an empty new line.
      Input: The String to be printed
     Output: None
```
 
<a id="print"/>
**_print( string="" )_**

----
```
Description: Prints a String without a new line. Same as 'puts()' except
             without a new line.
             Default: Prints Nothing. 'Flushes' Stdout.
      Input: The String to be printed
     Output: None
```
 
<a id="printf"/>
**_printf( msg, vargs* )_**

----
```
Description: Synonym for 'print("hello" . Name . "!")' except that in this funtion
             it is used like so 'printf("hello %s!",Name)'. This function is
             essentially the same as in the 'printf' in C/C++, except here, the
             only format specifier is '%s', since almost everything in AutoHotkey
             can be treated as a string.
             Default: Prints Nothing. 'Flushes' Stdout. (Same behaviour as 'print()'
      Input: The String to be printed
     Output: None
```
 
<a id="putsf"/>
**_putsf( msg, vargs* )_**

----
```
Description: Synonym for 'puts("hello" . Name . "!")' except that in this funtion
             it is used like so 'putsf("hello %s!",Name)'. Same as 'printf()'
             execept without a new line.
             Default: Prints a new line. (Same behaviour as 'puts()')
      Input: The String to be printed
     Output: None
```
 
<a id="ClearScreen"/>
**_ClearScreen()_**
 
----
```
Description: Clears the Current Console's Screen.
   Synonyms: 'cls()' and 'Clear()'
      Input: None
     Output: None
```
 
<a id="gets"/>
**_gets( ByRef var="" )_**

----
```
Description: Gets/Obtains input from the console user, until a carriage return '`r'
             has been received. The carriage return is trimmed off (not recorded).
      Input: The Varible in which to store the inputed/obtained string (Optional)
     Output: The inputed/obtained string
```
 
<a id="getch"/>
**_getch( ByRef keyname )_**

----
```
Description: Gets/Obtains a single key from the user. This may be used for something
             like "Press any key to continue" or "press Q to quit".
             Note: This function is "case sensitive" (Capture)
      Input: The Varible in which to store the Key Name (string) (Optional)
     Output: The Key Code
```
 
<a id="wait"/>
**_wait( timeout=0 )_**

----
```
Description: Gets/Obtains a single key from the user. This may be used for something
             like "Press any key to continue" or "press Q to quit" with a timeout.
      Input: The number of seconds until timeout (Optional)
     Output: The Key Code
```
 
<a id="WaitAction"/>
**_WaitAction()_**

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
 
<a id="pause"/>
**_pause(show=1)_**
 
----
```
Description: Wait until the user presses a key. This may be used for something
             like "Press any key to continue".
             Default: Displays "Press any key to continue".
      Input: Display the default message (Boolean) (Optional)
     Output: None
```
 
<a id="dec2hex"/>
**_dec2hex(var)_**

----
```
Description: Converts a decimal value to a hexadecimal value.
      Input: The Decimal value to be converted (Number) (Optional)
     Output: The convert value Hexadecimal value (Number)
```
 
<a id="ToBase"/>
**_ToBase(n,b)_**

----
```
Description: Converts a decimal value to a specified base value. The base is
             between 10 to 36 inclusive.
      Input: The Decimal value to be converted (Number) (Optional)
     Output: The convert value in the specified base value (Number)
     Credit: by Laszlo
```
 
<a id="sProgressBar"/>
**_sProgressBar( Length, Current, Max, Unlock = 0, fixed=1, lp="|", lba="[", lbb="]" )_**

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
 
<a id="getConsoleSize"/>
**_getConsoleSize( ByRef bufferwidth, ByRef bufferheight )_**

----
```
Description: Get the Console's buffer size in columns and lines (rows),
             meaning one line height is a character's height, and the
             column's width is a character's width.
      Input: bufferwidth - The Varible in which to store the buffer's width (Number)
             bufferheight - The Varible in which to store the buffer's height (Number)
     Output: Success is Non-Zero, Failure is Zero
```
 
<a id="getConsoleWidth"/>
**_getConsoleWidth()_**

----
```
Description: Shorthand for 'getConsoleSize()'. Get the Console's buffer's Width.
      Input: None
     Output: The buffer's Width (Number)
```
 
<a id="getConsoleHeight"/>
**_getConsoleHeight()_**

----
```
Description: Shorthand for 'getConsoleSize()'. Get the Console's buffer's Height.
      Input: None
     Output: The buffer's Height (Number)
```

<a id="GlobalVars"/>
##GlobalVars##
----

<a id="PreDefVar"/>
###Predefined Variables###
----
 
**_sType_** is an Object that is used when coding with structures and DllCalls.  
*Definition:*
```
sType := Object("SHORT", 2, "COORD", 4, "WORD", 2, "SMALL_RECT", 8, "DWORD", 4)
```

**_Stdin_** is an Object that is used to reference the currently attached console's Input buffer.  
*Definition:*
```
Stdin := FileOpen(DllCall("GetStdHandle", "int", -10, "ptr"), "h `n")
```

**_Stdout_** is an Object that is used to reference the currently attached console's Output buffer.  
*Definition:*
```
Stdout :=FileOpen(DllCall("GetStdHandle", "int", -11, "ptr"), "h `n")
```


<a id="ConsoleColors"/>
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