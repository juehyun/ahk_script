;/**********************************************************************
; * copyright (c) 2017 joohyun lee (juehyun@etri.re.kr)
; * 
; * mit license
; * 
; * permission is hereby granted, free of charge, to any person obtaining
; * a copy of this software and associated documentation files (the
; * "software"), to deal in the software without restriction, including
; * without limitation the rights to use, copy, modify, merge, publish,
; * distribute, sublicense, and/or sell copies of the software, and to
; * permit persons to whom the software is furnished to do so, subject to
; * the following conditions:
; * 
; * the above copyright notice and this permission notice shall be
; * included in all copies or substantial portions of the software.
; * 
; * the software is provided "as is", without warranty of any kind,
; * express or implied, including but not limited to the warranties of
; * merchantability, fitness for a particular purpose and
; * noninfringement. in no event shall the authors or copyright holders be
; * liable for any claim, damages or other liability, whether in an action
; * of contract, tort or otherwise, arising from, out of or in connection
; * with the software or the use or other dealings in the software.
; *********************************************************************/

#include libFunctions.ahk

;--------------------------------------------------------------------------------
; keep in mind MS-windows's default hot-keys to arrange windows
;--------------------------------------------------------------------------------
;  # Left/Right/Up/Down  : arrange windows
; +# Left/Right/Up/Down  : move another virtual desktop
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
;    Scheme              :   NumpadKeys  :   VimKeys
;--------------------------------------------------------------------------------
; always on top (on)     :   NumpadHome  :  # t
; always on top (off)    :   NumpadEnd   :   
; Raise                  :   NumpadPgUp  :  # u
; Lower                  :   NumpadPgDn  :  # n
; taskSwitcher           :   NumpadClear :  ! Tab  (taskSwitcher())
; maximizeRestore        :   NumpadEnter :  # Enter
; move                   :   NumpadLRUD  :  # hjkl (to use #l, disable window lock using 'gpedit.msc', User Config > Admin Template > System > Ctrl+Alt+Del options / Remove Lock Computer 'Use')
; resize                 : + NumpadLRUD  : +# hjkl
; moveToOtherMonitor     : ! NumpadLR    : !# hl
; change virtual desktop : ^ NumpadLR    : ^# hl
; move resize menu loop  : -n/a-         : -n/a- (controlWindowUseVimKeys())
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
#t::           WinSet, AlwaysOnTop, On, A         ;;;; Windows Always On Top (Set)
#Space::       raiseLowerCurrentActiveWindow()    ;;;; Windows Raise or Lower (as like linux)
!Tab::         Send ^!{Tab}                       ;;;; Show fixed task manager, and select widdow using numpad key
#k::           moveWindow("Up")                   ;;;; Move window (to up)
#j::           moveWindow("Down")                 ;;;; Move window (to down)
#h::           moveWindow("Left")                 ;;;; Move window (to left)
#l::           moveWindow("Right")                ;;;; Move window (to right) (to use #l, disable window lock using 'gpedit.msc', User Config > Admin Template > System > Ctrl+Alt+Del options / Remove Lock Computer 'Use')
#+k::          resizeWindow("Up")                 ;;;; Resize window (reduce height)
#+j::          resizeWindow("Down")               ;;;; Resize window (enlarge height)
#+h::          resizeWindow("Left")               ;;;; Resize window (reduce width)
#+l::          resizeWindow("Right")              ;;;; Reisze window (enlarge width)
#!h::          moveWindowToOtherMonitor("Left")   ;;;; Move current window to left  multi-monitor
#!l::          moveWindowToOtherMonitor("Right")  ;;;; Move current window to right multi-monitor
#^h::          Send ^#{Left}                      ;;;; Change to left virtual desktop
#^l::          Send ^#{Right}                     ;;;; Change to right virtual desktop
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
;#IfWinActive ahk_class TaskSwitcherWnd ; windows 7
#IfWinActive ahk_class MultitaskingViewFrame ; windows 10
h:: Send {Left}                                   ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
j:: Send {Down}                                   ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
k:: Send {Up}                                     ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
l:: Send {Right}                                  ;;;; Selct window in task-switcher (after Ctrl+Alt+Tab)
NumpadClear::  Send {Enter} 
#IfWinActive ; MultitaskingViewFrame

#IfWinNotActive ahk_class MultitaskingViewFrame   ; windows 10
NumpadUp::     moveWindow("Up")                   ;;;; Move window (to up)
NumpadDown::   moveWindow("Down")                 ;;;; Move window (to down)
NumpadLeft::   moveWindow("Left")                 ;;;; Move window (to left)
NumpadRight::  moveWindow("Right")                ;;;; Move window (to right)
NumpadClear::  Send ^!{Tab} 
#IfWinNotActive
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
NumpadHome::   WinSet, AlwaysOnTop, On , A        ;;;; Windows Always On Top (Set)
NumpadEnd::    WinSet, AlwaysOnTop, Off, A        ;;;; Windows Always On Top (Clear)
NumpadPgUp::   WinSet, Top   , , A                ;;;; Windows Raise
NumpadPgDn::   WinSet, Bottom, , A                ;;;; Windows Lower
;NumpadEnter::  maxRestoreWindow()                ;;;; Windows Maximize or Restore ( #{Up}, #{Down} ), Conflict when Numlock ON
+NumpadUp::    resizeWindow("Up")                 ;;;; Resize window (reduce height)
+NumpadDown::  resizeWindow("Down")               ;;;; Resize window (enlarge height)
+NumpadLeft::  resizeWindow("Left")               ;;;; Resize window (reduce width)
+NumpadRight:: resizeWindow("Right")              ;;;; Reisze window (enlarge width)
!NumpadLeft::  moveWindowToOtherMonitor("Left")   ;;;; Move current window to left  multi-monitor
!NumpadRight:: moveWindowToOtherMonitor("Right")  ;;;; Move current window to right multi-monitor
^NumpadLeft::  Send ^#{Left}                      ;;;; Change to left virtual desktop
^NumpadRight:: Send ^#{Right}                     ;;;; Change to right virtual desktop
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
#NumpadIns::
#0::setWindowToPredefinedArea(0)   ;;;; set position and size of active window as #0 area
#NumpadEnd::
#1::setWindowToPredefinedArea(1)   ;;;; set position and size of active window as #1 area
#NumpadDown::
#2::setWindowToPredefinedArea(2)   ;;;; set position and size of active window as #2 area
#NumpadPgDn::
#3::setWindowToPredefinedArea(3)   ;;;; set position and size of active window as #3 area
#NumpadLeft::
#4::setWindowToPredefinedArea(4)   ;;;; set position and size of active window as #4 area
#NumpadClear::
#5::setWindowToPredefinedArea(5)   ;;;; set position and size of active window as #5 area
#NumpadRight::
#6::setWindowToPredefinedArea(6)   ;;;; set position and size of active window as #6 area
#NumpadHome::
#7::setWindowToPredefinedArea(7)   ;;;; set position and size of active window as #7 area
#NumpadUp::
#8::setWindowToPredefinedArea(8)   ;;;; set position and size of active window as #8 area
#NumpadPgUp::
#9::setWindowToPredefinedArea(9)   ;;;; set position and size of active window as #9 area
#-::setWindowMaximizeHorizontal()  ;;;; maximize horizontal
#=::setWindowMaximizeVertical()    ;;;; maximize vertical
;--------------------------------------------------------------------------------

