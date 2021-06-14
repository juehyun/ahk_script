# AHK configuration file 

- This is a AHK script file to configure hot-keys for my Windows system

- This file is configured for private favor, not for general :-)

- My favor is ...
	- move, reisze windows using mouse as like linux (code from Jonny, http://www.autohotkey.com) 
	- move, resize windows using keyboard 
	- raise/lower, set always-on-top windows as like linux
	- arrange windows using keyboard (similar to power-toy FancyZones, but not support GUI configuration :-)
	- use TotalCommander using number key (not Fn key, especially for small-sized-fn-key-laptop)
	- use TotalCommander using vim key (hjkl) instead of arrow key
	- I love TotalCommander, I love Vim

- Refer following hot-key for more details


# The Hotkey list
```
; drawRect                                           ;;;; Highlight (Draw Box) the windows "Always On Top" set
; ^!+#R        ::                                    ;;;; Reload this AHK script
; Capslock     ::                                    ;;;; Mapping CapsLock to Han/Eng, Long press is 'Capslock' (as like Mac )
; !4           :: Send !{F4}                         ;;;; Close window (for laptop)
; #q           :: Send !{F4}                         ;;;; Close window (as like Mac Cmd+Q)
; #f           :: Run "C:\Everything\Everything.exe" ;;;; Searching "Everything" (as like Mac finder)
; >+Up         :: Send {Volume_Up}                   ;;;; Media Control
; >+Down       :: Send {Volume_Down}                 ;;;; Media Control
; >+Right      :: Send {Media_Next}                  ;;;; Media Control
; >+Left       :: Send {Media_Play_Pause}            ;;;; Media Control
; ^!0          ::                                    ;;;; Media Rating (MusicBee)
; ^!1          ::                                    ;;;; Media Rating (MusicBee)
; ^!2          ::                                    ;;;; Media Rating (MusicBee)
; ^!3          ::                                    ;;;; Media Rating (MusicBee)
; ^!4          ::                                    ;;;; Media Rating (MusicBee)
; ^!5          ::                                    ;;;; Media Rating (MusicBee)
; #t           :: WinSet, AlwaysOnTop, On, A         ;;;; Windows Always On Top (Set)
; #u           :: WinSet, Top   , , A                ;;;; Windows Raise (or use mouse click)
; #n           :: WinSet, Bottom, , A                ;;;; Windows Lower (override windows hotkey)
; +Esc         :: raiseLowerCurrentActiveWindow()    ;;;; Windows Raise or Lower (as like linux)
; !Tab         :: Send ^!{Tab}                       ;;;; Show fixed task manager, and select widdow using numpad key
; #=           :: maxRestoreWindow()                 ;;;; Windows Maximize or Restore ( #{Up}, #{Down} )
; #k           :: moveWindow("Up")                   ;;;; Move window (to up)
; #j           :: moveWindow("Down")                 ;;;; Move window (to down)
; #h           :: moveWindow("Left")                 ;;;; Move window (to left)
; #l           :: moveWindow("Right")                ;;;; Move window (to right) (to use #l, disable window lock using 'gpedit.msc', User Config > Admin Template > System > Ctrl+Alt+Del options / Remove Lock Computer 'Use')
; #+k          :: resizeWindow("Up")                 ;;;; Resize window (reduce height)
; #+j          :: resizeWindow("Down")               ;;;; Resize window (enlarge height)
; #+h          :: resizeWindow("Left")               ;;;; Resize window (reduce width)
; #+l          :: resizeWindow("Right")              ;;;; Reisze window (enlarge width)
; #!h          :: moveWindowToOtherMonitor("Left")   ;;;; Move current window to left  multi-monitor
; #!l          :: moveWindowToOtherMonitor("Right")  ;;;; Move current window to right multi-monitor
; #^h          :: Send ^#{Left}                      ;;;; Change to left virtual desktop
; #^l          :: Send ^#{Right}                     ;;;; Change to right virtual desktop
; h            :: Send {Left}                        ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
; j            :: Send {Down}                        ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
; k            :: Send {Up}                          ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
; l            :: Send {Right}                       ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
; NumpadUp     :: moveWindow("Up")                   ;;;; Move window (to up)
; NumpadDown   :: moveWindow("Down")                 ;;;; Move window (to down)
; NumpadLeft   :: moveWindow("Left")                 ;;;; Move window (to left)
; NumpadRight  :: moveWindow("Right")                ;;;; Move window (to right)
; NumpadHome   :: WinSet, AlwaysOnTop, On , A        ;;;; Windows Always On Top (Set)
; NumpadEnd    :: WinSet, AlwaysOnTop, Off, A        ;;;; Windows Always On Top (Clear)
; NumpadPgUp   :: WinSet, Top   , , A                ;;;; Windows Raise
; NumpadPgDn   :: WinSet, Bottom, , A                ;;;; Windows Lower
; +NumpadUp    :: resizeWindow("Up")                 ;;;; Resize window (reduce height)
; +NumpadDown  :: resizeWindow("Down")               ;;;; Resize window (enlarge height)
; +NumpadLeft  :: resizeWindow("Left")               ;;;; Resize window (reduce width)
; +NumpadRight :: resizeWindow("Right")              ;;;; Reisze window (enlarge width)
; !NumpadLeft  :: moveWindowToOtherMonitor("Left")   ;;;; Move current window to left  multi-monitor
; !NumpadRight :: moveWindowToOtherMonitor("Right")  ;;;; Move current window to right multi-monitor
; ^NumpadLeft  :: Send ^#{Left}                      ;;;; Change to left virtual desktop
; ^NumpadRight :: Send ^#{Right}                     ;;;; Change to right virtual desktop
; #0           :: setWindowToPredefinedArea(0)       ;;;; set position and size of active window as #0 area
; #1           :: setWindowToPredefinedArea(1)       ;;;; set position and size of active window as #1 area
; #2           :: setWindowToPredefinedArea(2)       ;;;; set position and size of active window as #2 area
; #3           :: setWindowToPredefinedArea(3)       ;;;; set position and size of active window as #3 area
; #4           :: setWindowToPredefinedArea(4)       ;;;; set position and size of active window as #4 area
; #5           :: setWindowToPredefinedArea(5)       ;;;; set position and size of active window as #5 area
; #6           :: setWindowToPredefinedArea(6)       ;;;; set position and size of active window as #6 area
; #7           :: setWindowToPredefinedArea(7)       ;;;; set position and size of active window as #7 area
; #8           :: setWindowToPredefinedArea(8)       ;;;; set position and size of active window as #8 area
; #9           :: setWindowToPredefinedArea(9)       ;;;; set position and size of active window as #9 area
; #-           :: setWindowMaximizeHorizontal()      ;;;; maximize horizontal
; #=           :: setWindowMaximizeVertical()        ;;;; maximize vertical
; #^+s         :: saveSession()                      ;;;; Save Sessions (Visible Windows Position and Size)
; #^+r         :: restoreSession()                   ;;;; Restore Sessions (Visible Windows Position and Size)
; #LButton     ::                                    ;;;; Move windows (DoubleAlt : minimize)
; #RButton     ::                                    ;;;; Resize windows (DoubleAlt : maximize)
; #MButton     ::                                    ;;;; DoubleAlt : Close Window
; TTOTAL_CMD                                         ;;;; Total Commander (Use number key instead of Fn key, for small-sized-fn-key-laptop)
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
