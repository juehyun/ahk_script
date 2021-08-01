# AHK scripts

- This is AHK (Auto Hot Key) script files for Windows system

# Requirements

- Download and install 'AutoHotkey' from autohotkey.com
- Execute AHK script by double click the script file. That's all
- If you want to run specific AHK script(s) at Windows startup, copy or make link AHK script file to following location
	```
	%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\<yourscript.ahk>
	```
- Refer autohotkey.com for more details about AHK script

# AHK script files and its feature

- Each AHK script file, in this repository, has its own features as described below (each ahk script can be run respectively)
- You can use an AHK file or you can integrate several scripts (using '#include') to combine features (refer. all.ahk)

- Legend (Keys in AHK script)
	```
	^ : Ctrl-Key
	# : Win-Key
	! : Alt-Key
	+ : Shift-Key
	< : Indicate left  side key ( e.g. <+ means left  shift key)
	> : Indicate right side key ( e.g. >^ means right ctrl  key)
	```

## libFunctions.ahk

- AHK function library for all other scripts

- This file is commonly #included to all other AHK scripts

## all.ahk

- Integrate all AHK files in a single script
- Simply use all.ahk file to use all features

## moveReiszeSetWindowsWithMouse.ahk

- Use mouse to move, reisze window (as like Ubuntu linux)

	```
	#Enter                     ;;;; Win+Enter, and then use mouse to Move windows
	+#Enter                    ;;;; Shift+Win+Enter, and then use mouse to Resize windows
	#LButton                   ;;;; Win+LButton and drag mouse to Move windows
	#RButton:                  ;;;; Win+RButton and drag mouse to resize windows
	```

- Use mouse gesture for (taskSwitcher, go prev/next tab, close tab, close window, etc.,)
	| Gesture                      | Action      
	|------------------------------|------------ 
	| RButton/LButton dual click   | drag -> move window
	| RButton double click         | drag -> resize window
	| RButton (short) swipe  ⬆️     | taskSwitcher
	| RButton (long ) swipe  ↑     | taskSwitcher
	| RButton (short) swipe  ↓     | lowerCurrentActiveWindow()
	| RButton (long ) swipe  ↓     | #{Down}   , minimize
	| RButton (short) swipe  ←     | !{Left}   , browser go back
	| RButton (long ) swipe  ←     | ^#{Right} , change virtual desktop
	| RButton (short) swipe  →     | !{Right}  , browser go forward
	| RButton (long ) swipe  →      | ^#{Left } , change virtual desktop
	| RButton (short) swipe  ↖     | ^+{Tab}   , prev tab
	| RButton (long ) swipe  ↖     | none      , reserved
	| RButton (short) swipe  ↗     | ^{Tab}    , next tab
	| RButton (long ) swipe  ↗     | maxRestoreWindow()
	| RButton (short) swipe  ↙     | ^w        , close tab
	| RButton (long ) swipe  ↙     | !{F4}     , close window
	| RButton (short) swipe  ↘     | Send {F5} , reload web browser
	| RButton (long ) swipe  ↘     | none      , reserved
	--------------------------------------------

## moveReiszeSetWindowsWithKeyboard.ahk

- move, resize, raise, lower, set always on top (using keyboard)

	```
	   Numpad Arrow          ;;;; move   current window
	 + Numpad Arrow          ;;;; reisze current window
	 ! Numpad Arrow          ;;;; move   current window to other monitor (i.e. multi monitor)
	 ^ Numpad Arrow          ;;;; change to other virtual desktop (Win+Ctrl+Left/Right)
	   Numpad Home           ;;;; set AlwaysOnTop
	   NumpadPgUp            ;;;; raise Window
	   NumpadPgDn            ;;;; lower Window

	#  h/j/k/l               ;;;; move   current window
	#+ h/j/k/l               ;;;; reisze current window
	#! h/j/k/l               ;;;; move   current window to other monitor (i.e. multi monitor)
	#^ h/l                   ;;;; change to other virtual desktop (Win+Ctrl+Left/Right)
	#  t                     ;;;; set AlwaysOnTop
	   Mouse Click           ;;;; raise Window
	#  Space                 ;;;; lower Window
	```
	
## reloadScript.ahk

- If you modify AHK script file, you can reload it with hot-key
	```
	^!+#R                            ;;;; Reload this AHK script
	```

## highlightAlwaysOnTopWindow.ahk

- highlight the windows which is set "AlwaysOnTop" attribute
- You can set "alwaysOnTop" attribute with the hotkey in "moveResizeSetWindowsWithKeyboard.ahk" script

## macCapslock.ahk

- Emulate Mac's capslock key
	```
	Capslock key short press         ;;;; switch Hangul/Eng
	Capslock key long  press         ;;;; toggle Capslock
	```
	
## totalCommander.ahk

- I love totalcommander program
- Use number key as func key (especially for function-key-less-keyboard or small-function-key-laptop
	- Ex)
	    1~9,0   -> F1~F9,F10
	    Alt+4   -> Alt+F4
	    Shift+6 -> Shift+F6
	      ... and so on.,

- Use 'h/j/k/l' (as like vim) key as 'left/right/up/down' arrow key in file list pane
	- Also use 'h/j/k/l' with Shift/Ctrl/Alt key as if it is arrow key

- Use '/<letters>' to search file in current file list pane
	- set totalcommander 'Quick Search' with 'Letters - with search dialog'

- Others
	```
	=        ;;;; selection, mark
	-        ;;;; unselect , clear mark
	\        ;;;; invert selection
	^=       ;;;; select all
	^-       ;;;; unselect all
	!5::     ;;;; archive (copy) files
	!+5::    ;;;; archive (move) files
	+2::     ;;;; compare files and directorys (cm_CompareDirsWithSubdirs)
	^PgUp    ;;;; move to prev tab
	^PgDn    ;;;; move to next tab
	+g       ;;;; go to end of list
	^+c      ;;;; copy file name to clipboard (as text string)
	^+v      ;;;; rename file name with the text in clipboard (use with ^+c)
	+Enter   ;;;; rename (edit) file name 
	... and so on., (see totalCommander.ahk)
	```

## vncViewer.ahk

- Hotkeys only for vnc viewer (RealVNC, TightVNC, TigerVNC) 

## windowsCommon.ahk

- Close windows
	```
	!4      ;;;; Close window (for laptop)
	#q      ;;;; Close window (as like Mac Cmd+Q)
	```

## mediaControl.ahk
- Windows media control (PlayPause/Next/Prev/VolumeUp/VolumeDown/Rating)
	```
	>+Up       Send {Volume_Up}          ;;;; Media Control
	>+Down     Send {Volume_Down}        ;;;; Media Control
	>+Right    Send {Media_Next}         ;;;; Media Control
	>+Left     Send {Media_Play_Pause}   ;;;; Media Control
	
	^!0                                  ;;;; Media Rating (MusicBee)
	^!1                                  ;;;; Media Rating (MusicBee)
	^!2                                  ;;;; Media Rating (MusicBee)
	^!3                                  ;;;; Media Rating (MusicBee)
	^!4                                  ;;;; Media Rating (MusicBee)
	^!5                                  ;;;; Media Rating (MusicBee)
	```

# License 

```
;********************************************************************************
; COPYRIGHT (C) 2017 Joohyun Lee (juehyun@etri.re.kr)
; 
; MIT License
; 
; Permission is hereby granted, free of charge, to any person obtaining
; a copy of this software and associated documentation files (the
; "Software"), to deal in the Software without restriction, including
; without limitation the rights to use, copy, modify, merge, publish,
; distribute, sublicense, and/or sell copies of the Software, and to
; permit persons to whom the Software is furnished to do so, subject to
; the following conditions:
; 
; The above copyright notice and this permission notice shall be
; included in all copies or substantial portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
;********************************************************************************
```
