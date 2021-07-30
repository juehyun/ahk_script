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



;################################################################################
; Features
;################################################################################
#include highlightAlwaysOnTopWindow.ahk
#include macCapslock.ahk
#include mediaControl.ahk
#include moveResizeSetWindowsWithKeyboard.ahk
#include moveResizeSetWindowsWithMouse.ahk
#include reloadScript.ahk
#include totalCommander.ahk
#include vncViewer.ahk
#include windowsCommon.ahk

;################################################################################
; Hot Key List ($ grep --exclude etri.ahk -h ";;;;" *.ahk | sed -e 's/\t//g' | grep -v -e "^;" |  column -t -s ";" | sed -e "s/^/;/"
;################################################################################
;setTimer, drawRect, 50                               Highlight (Draw Box) the windows "Always On Top" set
;^!+#R::                                              Reload this AHK script
;moveResizeWindow(0,1)                                RButton Gesture : double click
;moveResizeWindow(1,0)                                RButton Gesture : dual click (RButton+LButton)
;Send ^+{Tab}                                         RButton Gesture : (short) diagonal swipe ↖
;Send ^{Tab}                                          RButton Gesture : (short) diagonal swipe ↗
;Send ^w                                              RButton Gesture : (short) diagonal swipe ↙
;                                                     RButton Gesture : (short) diagonal swipe ↘
;Send !{Left}                                         RButton Gesture : (short) horizontal swipe-left-to-right →
;Send !{Right}                                        RButton Gesture : (short) horizontal swipe-right-to-left ←
;Send ^!{Tab}                                         RButton Gesture : (short) vertical swipe-down-to-up ↑
;lowerCurrentActiveWindow()                           RButton Gesture : (short) vertical swipe-up-to-down ↓   
;                                                     RButton Gesture : (long) diagonal swipe ↖
;maxRestoreWindow()                                   RButton Gesture : (long) diagonal swipe ↗
;Send !{F4}                                           RButton Gesture : (long) diagonal swipe ↙
;                                                     RButton Gesture : (long) diagonal swipe ↘
;Send ^#{Left}                                        RButton Gesture : (long) horizontal swipe-left-to-right →
;Send ^#{Right}                                       RButton Gesture : (long) horizontal swipe-right-to-left ←
;Send #{Tab}                                          RButton Gesture : (long) vertical swipe-down-to-up ↑
;Send #{Down}                                         RButton Gesture : (long) vertical swipe-up-to-down ↓         
;Capslock::                                           Mapping CapsLock to Han/Eng, Long press is 'Capslock' (as like Mac )
;>+Up::     Send {Volume_Up}                          Media Control
;>+Down::   Send {Volume_Down}                        Media Control
;>+Right::  Send {Media_Next}                         Media Control
;>+Left::   Send {Media_Play_Pause}                   Media Control
;^!0::                                                Media Rating (MusicBee)
;^!1::                                                Media Rating (MusicBee)
;^!2::                                                Media Rating (MusicBee)
;^!3::                                                Media Rating (MusicBee)
;^!4::                                                Media Rating (MusicBee)
;^!5::                                                Media Rating (MusicBee)
;#Enter::   moveResizeWindow(1, 0)                    Move windows
;+#Enter::  moveResizeWindow(0, 1)                    Resize windows
;#LButton:: moveResizeWindow(1, 0)                    Move windows (mouse)
;#RButton:: moveResizeWindow(0, 1)                    Move windows (mouse)
;RButton:: mouseGestureWithRButton()                  Mouse Gesture with RButton, double RButton click, RButton Swipe Up/Dn/Left/Right, both LButton+RButton click
;#IfWinActive ahk_exe OUTLOOK.EXE                     Outlook : move mail to specific folder
;#IfWinActive ahk_class TTOTAL_CMD                    Total Commander (Use number key instead of Fn key)
;SC11D::RCtrl                                         change Ctrl/Hanja(SC11D) to RCtrl for VNC (RCtrl+MouseL(R)Click move(resize) windows in VNCclient(Linux)
;!4::Send !{F4}                                       Close window (for laptop)
;#q::Send !{F4}                                       Close window (as like Mac Cmd+Q)
;#f:: Run "C:\Everything\Everything.exe"              Searching "Everything" (as like Mac finder)
;#t::           WinSet, AlwaysOnTop, On, A            Windows Always On Top (Set)
;#Space::       raiseLowerCurrentActiveWindow()       Windows Raise or Lower (as like linux)
;!Tab::         Send ^!{Tab}                          Show fixed task manager, and select widdow using numpad key
;#k::           moveWindow("Up")                      Move window (to up)
;#j::           moveWindow("Down")                    Move window (to down)
;#h::           moveWindow("Left")                    Move window (to left)
;#l::           moveWindow("Right")                   Move window (to right) (to use #l, disable window lock using 'gpedit.msc', User Config > Admin Template > System > Ctrl+Alt+Del options / Remove Lock Computer 'Use')
;#+k::          resizeWindow("Up")                    Resize window (reduce height)
;#+j::          resizeWindow("Down")                  Resize window (enlarge height)
;#+h::          resizeWindow("Left")                  Resize window (reduce width)
;#+l::          resizeWindow("Right")                 Reisze window (enlarge width)
;#!h::          moveWindowToOtherMonitor("Left")      Move current window to left  multi-monitor
;#!l::          moveWindowToOtherMonitor("Right")     Move current window to right multi-monitor
;#^h::          Send ^#{Left}                         Change to left virtual desktop
;#^l::          Send ^#{Right}                        Change to right virtual desktop
;h:: Send {Left}                                      Selct window in task-switcher (after Ctrl+Alt+Tab)
;j:: Send {Down}                                      Selct window in task-switcher (after Ctrl+Alt+Tab)
;k:: Send {Up}                                        Selct window in task-switcher (after Ctrl+Alt+Tab)
;l:: Send {Right}                                     Selct window in task-switcher (after Ctrl+Alt+Tab)
;NumpadUp::     moveWindow("Up")                      Move window (to up)
;NumpadDown::   moveWindow("Down")                    Move window (to down)
;NumpadLeft::   moveWindow("Left")                    Move window (to left)
;NumpadRight::  moveWindow("Right")                   Move window (to right)
;NumpadHome::   WinSet, AlwaysOnTop, On , A           Windows Always On Top (Set)
;NumpadEnd::    WinSet, AlwaysOnTop, Off, A           Windows Always On Top (Clear)
;NumpadPgUp::   WinSet, Top   , , A                   Windows Raise
;NumpadPgDn::   WinSet, Bottom, , A                   Windows Lower
;+NumpadUp::    resizeWindow("Up")                    Resize window (reduce height)
;+NumpadDown::  resizeWindow("Down")                  Resize window (enlarge height)
;+NumpadLeft::  resizeWindow("Left")                  Resize window (reduce width)
;+NumpadRight:: resizeWindow("Right")                 Reisze window (enlarge width)
;!NumpadLeft::  moveWindowToOtherMonitor("Left")      Move current window to left  multi-monitor
;!NumpadRight:: moveWindowToOtherMonitor("Right")     Move current window to right multi-monitor
;^NumpadLeft::  Send ^#{Left}                         Change to left virtual desktop
;^NumpadRight:: Send ^#{Right}                        Change to right virtual desktop
;#0::setWindowToPredefinedArea(0)                     set position and size of active window as #0 area
;#1::setWindowToPredefinedArea(1)                     set position and size of active window as #1 area
;#2::setWindowToPredefinedArea(2)                     set position and size of active window as #2 area
;#3::setWindowToPredefinedArea(3)                     set position and size of active window as #3 area
;#4::setWindowToPredefinedArea(4)                     set position and size of active window as #4 area
;#5::setWindowToPredefinedArea(5)                     set position and size of active window as #5 area
;#6::setWindowToPredefinedArea(6)                     set position and size of active window as #6 area
;#7::setWindowToPredefinedArea(7)                     set position and size of active window as #7 area
;#8::setWindowToPredefinedArea(8)                     set position and size of active window as #8 area
;#9::setWindowToPredefinedArea(9)                     set position and size of active window as #9 area
;#-::setWindowMaximizeHorizontal()                    maximize horizontal
;#=::setWindowMaximizeVertical()                      maximize vertical
;#^+s::saveSession()                                  Save Sessions (Visible Windows Position and Size)
;#^+r::restoreSession()                               Restore Sessions (Visible Windows Position and Size)
;SC11D::LWin                                          {RCtrl or Win}+MouseL(R)Click move(resize) windows
;RWin::Send {VK19SC11D}                               RWin is RCtrl/한자
