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
; Hot Key List (Search ';;;;')
;################################################################################
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
; OUTLOOK.EXE                                        ;;;; Outlook : move mail to specific folder

;################################################################################
; Auto and Initial Execution Section
;################################################################################
; {{{
; AHK, After the script has been loaded, it begins executing at the top line,
;      continuing until a Return, Exit, hotkey/hotstring label,
;      or the physical end of the script is encountered (whichever comes first).
;      This top portion of the script is referred to as the auto-execute section.

;--------------------------------------------------------------------------------
; initialize global variables (store IME state)
;--------------------------------------------------------------------------------
global g_ime_status    := % IME_CHECK("A")
global g_ime_changed   := 0
global g_res_mvresize  := 10

;--------------------------------------------------------------------------------
setTimer, drawRect, 50 ;;;; Highlight (Draw Box) the windows "Always On Top" set
;--------------------------------------------------------------------------------
drawRect:
	WinGet, st, Style, A
	if( isWindowAlwaysOnTop() && isWindowNormalApp(st) ) {
		b = 5 ; border thickness
		t = 0 ; title bar thickness
		g = 10 ; gap

		b_color = 00FF00 ; border color
		WinGetPos, x, y, w, h, A
		Gui, +Lastfound +AlwaysOnTop +Toolwindow  +LabelTitle
		; outer boundary of box
		olt :=        "0-0"
		ort := w+2*b+2*g . "-0"
		orb := w+2*b+2*g . "-" . h+2*b+t+2*g
		olb :=            "0-" . h+2*b+t+2*g
		; inner boundary of box
		ilt :=    b . "-" . b+t
		irt :=  w+b+2*g . "-" . b+t
		irb :=  w+b+2*g . "-" . h+b+t+2*g
		ilb :=    b . "-" . h+b+t+2*g
		; shift amout of box
		sx  := x- b -g
		sy  := y- b -t -g
		ww  := w+2*b+2*g
		hh  := h+2*b+t+2*g
		Gui,  Color, %b_color%  ; set background color for the window and its controls
		if(t == 0) {
		Gui, -Caption
		}
		WinSet, Region, %olt% %ort% %orb% %olb% %olt%   %ilt% %irt% %irb% %ilb% %ilt%
		Gui, Show, w%ww% h%hh% x%sx% y%sy% NoActivate, This Window Set AlwaysOnTOp by juehyun@etri.re.kr
	} else {
		Gui, Hide
	}
Return

;--------------------------------------------------------------------------------
^!+#R:: ;;;; Reload this AHK script
;--------------------------------------------------------------------------------
	MsgBox, 4,, The script will be reloaded
	Reload 
	Sleep 1000 ; If successful, the 'Reload' will close this instance during the Sleep, so the line below will never be reached.
	Return

;}}}

;################################################################################
; Functions
;################################################################################
; {{{
set_ime_A( ) ; check IME status 
{
	global g_ime_status
	global g_ime_changed
	WinGetActiveTitle, ExplorerTitle 
	g_ime_status := % IME_CHECK("A") 
	if (g_ime_status = "0") { 
		g_ime_changed := 0
	} else {
		Send {vk15sc138}
		g_ime_changed := 1
	}
}

restore_ime( ) ; restore IME status
{
	global g_ime_changed
	if (g_ime_changed) { 
		g_ime_changed := 0
		Send {vk15sc138}
	}
}

; return value = 0, means key state is "A"
; return value = 1, means key state is "ÇÑ"
IME_CHECK(WinTitle) 
{
	WinGet,hWnd,ID,%WinTitle% 
	Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"") 
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam) 
{
	DetectSave := A_DetectHiddenWindows 
	DetectHiddenWindows,ON 
	SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd% 
	if (DetectSave <> A_DetectHiddenWindows) 
		DetectHiddenWindows,%DetectSave% 
	return ErrorLevel 
} 

ImmGetDefaultIMEWnd(hWnd) 
{ 
	return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint) 
}


tc_isFocusInEditCtrl() ; total cmannder, check if cursor is on "*Edit*" control box
{
	ControlGetFocus, focusedCtrl, ahk_class TTOTAL_CMD
	;IfNotInString, focusedCtrl, Edit
	IfInString, focusedCtrl, Edit
	{
		return true
	} else {
		return false
	}
}

tc_sendFnKey(inKey) ; total commander, if not in "Edit" control, change number keys to corresponding Fn keys
{
	if ( tc_isFocusInEditCtrl() )
	{
		outKey := inKey
	} else {
		inKey  := RegExReplace(inKey,"(0)","10" ) ; take care for F0 -> F10
		outKey := RegExReplace(inKey,"([0-9]+)","{F$1}" )
	}
	Send %outKey%
}

tc_sendNumpadKey(inKey) ; total commander, if not in "Edit" control, change = - 8 to Numpad's + - *
{
	if(tc_isFocusInEditCtrl()) {
		Send %inKey%
	} else {
		if(inKey = "=") {
			Send  {NumpadAdd}    ; select mark
		} else if(inKey = "-") {
			Send  {NumpadSub}    ; un-select, clear mark
		} else if(inKey = "\") {
			Send  {NumpadMult}   ; invert selection
		} else if(inKey = "^=") {
			Send ^{NumpadAdd}    ; select all
		} else if(inKey = "^-") {
			Send ^{NumpadSub}    ; un-select all, select none
		} else {
			Send  %inKey%
		}
	}
}

isWindowNormalApp(style) ; is current window is normal application window
{
	; refer https://www.autohotkey.com/docs/misc/Styles.htm
	; WS_VISIBLE          : 0x1000_0000
	; WS_DLGFRAME         : 0x0400_0000
	; WS_VSCROLL          : 0x0200_0000
	; WS_OVERLAPPEDWINDOW : 0x00CF_0000 = WS_OVERLAPPED, WS_CAPTION, WS_SYSMENU, WS_THICKFRAME, WS_MINIMIZEBOX, and WS_MAXIMIZEBOX
	if( (style & 0x00CF0000) = 0x00CF0000)
	{
		return true
	}
	else{
		return false
	}
}

isWindowAlwaysOnTop() ; is current window is set with "AlwaysOnTop"
{
	WinGet, outVal, ExStyle, A ; get extended style from current focused "Active" window

	;if(outVal & WS_EX_TOPMOST) ; WS_EX_TOPMOST = 0x8, AlwaysOnTop extended window style bit <- not work
	if(outVal & 0x8) ; WS_EX_TOPMOST = 0x8, AlwaysOnTop extended window style bit
		return true
	else
		return false
}

isWindowAlwaysOnTopHwnd(hwnd) ; is current window is set with "AlwaysOnTop"
{
	WinGet, outVal, ExStyle, ahk_id %hwnd% ; get extended style from current focused "Active" window

	;if(outVal & WS_EX_TOPMOST) ; WS_EX_TOPMOST = 0x8, AlwaysOnTop extended window style bit <- not work
	if(outVal & 0x8) ; WS_EX_TOPMOST = 0x8, AlwaysOnTop extended window style bit
		return true
	else
		return false
}

isWindowOverapped(hwnd) ; return the list of overlpped windows with the 'hwnd' (which is below the mouse)
{
	;MsgBox,,, The window below mouse : %hwnd%, 1
	if(getListOfOverlapWindow(hwnd) = "")
		Return false
	else
		Return true
}

getListOfOverlapWindow(hwnd) ; return the list of overlpped windows with the 'hwnd' (which is below the mouse)
{
	getTaskBarSz(tbSz_up, tbSz_dn)
	WinGet, wlst, List  ; get list of windows, Windows are retrieved in order from topmost to bottommost (according to how they are stacked on the desktop)
	Loop, %wlst%
	{
		iter_id := wlst%A_Index%
		
		if (iter_id == hwnd)
			break ; stop if reach current active window, only search windows above current window
		
		if( isWindowAlwaysOnTopHwnd(iter_id) )
			continue ; ignore the window 'AlwaysOnTop' is set
		
		WinGetPos, iter_x, iter_y, iter_w, iter_h, ahk_id %iter_id%
		WinGetPos, hwnd_x, hwnd_y, hwnd_w, hwnd_h, ahk_id %hwnd%
		if ( ((iter_x >= hwnd_x) && (iter_x <= hwnd_x + hwnd_w) && (iter_y >= hwnd_y) && (iter_y <= hwnd_y + hwnd_h))                      ; iter(left,top)  is inside of hwnd
			|| ((hwnd_x >= iter_x) && (hwnd_x <= iter_x + iter_w) && (hwnd_y >= iter_y) && (hwnd_y <= iter_y + iter_h))                      ; hwnd(left,top)  is inside of iter
			|| ((iter_x + iter_w >= hwnd_x) && (iter_x + iter_w <= hwnd_x + hwnd_w) && (iter_y >= hwnd_y) && (iter_y <= hwnd_y + hwnd_h))    ; iter(right,top) is inside of hwnd
			|| ((hwnd_x + hwnd_w >= iter_x) && (hwnd_x + hwnd_w <= iter_x + iter_w) && (hwnd_y >= iter_y) && (hwnd_y <= iter_y + iter_h)) )  ; hwnd(right,top) is inside of iter
		{
			if (overlapping_hwnds != "")
				overlapping_hwnds := overlapping_hwnds . "," . iter_id
			else
				overlapping_hwnds := iter_id
			
			;MsgBox,,, Yes overlapped : %iter_x% %iter_y% %iter_w% %iter_h% "|" %hwnd_x% %hwnd_y% %hwnd_w% %hwnd_h%
		}
		else 
		{
			;MsgBox,,, Nop overlapped : %iter_x% %iter_y% %iter_w% %iter_h% "|" %hwnd_x% %hwnd_y% %hwnd_w% %hwnd_h%
		}
	}
	;MsgBox,,, List of overlapped window : %overlapping_hwnds%, 1
	return overlapping_hwnds
}

raiseLowerCurrentActiveWindow()
{
	;MouseGetPos,,, hwnd   ; raise/lower for the window below mouse -> not working (I dont know why)
	hwnd := WinExist("A") ; riase/lower currently active window 
	if(isWindowOverapped(hwnd)) {
		;MsgBox,,, Raise %hwnd%, 1
		WinSet,    Top, , ahk_id %hwnd%
	} else {
		;MsgBox,,, Lower %hwnd%, 1
		WinSet, Bottom, , ahk_id %hwnd%
	}
	Return
}

lowerCurrentActiveWindow()
{
	hwnd := WinExist("A") 
	WinSet, Bottom, , ahk_id %hwnd%
	Return
}

getTaskBarSz(byref tbSz_up, byref tbSz_dn)
{
	WinGetPos tbx, tby, tbw, tbh, ahk_class Shell_TrayWnd
	;ListVars
	;Pause

	if( tby > 100 ) {
		tbSz_up := 0
		tbSz_dn := tbh
		;MsgBox,,, TaskBar is Bottom %tbSz_up% - %tbSz_dn% : %tbx% %tby% %tbw% %tbh%, 1
	} else {
		tbSz_up := tbh
		tbSz_dn := 0
		;MsgBox,,, TaskBar is Upside %tbSz_up% - %tbSz_dn% : %tbx% %tby% %tbw% %tbh%, 1
	}
}

moveWindowToOtherMonitor( dir )
{
	CoordMode,Mouse
	MouseGetPos, mx, my
	WinGet,win_id,ID,A
	WinGetPos, wx, wy, ww, wh, ahk_id %win_id%
	
	; no change for vertical
	win_y := wy
	my    := my

	; change for horizontal
	if     ( dir = "Left" ) {
		win_x := wx - A_ScreenWidth
		mx    := mx - A_ScreenWidth 
	}
	else if( dir = "Right") {
		win_x := wx + A_ScreenWidth
		mx    := mx + A_ScreenWidth 
	}
	else{
		return
	}
	; check valid screen
	if( isValidMonitor( win_x , win_x+ww ) ){
		MouseMove, mx, my
		WinMove,ahk_id %win_id%, , win_x, win_y, ww, wh
	}
}

; does the window is in-side of vitual desktop
isValidMonitor( x_left , x_right )
{
	SysGet, desktop_w        , 78 ; SM_CXVIRTUALSCREEN
	SysGet, desktop_topleft_x, 76 ; SM_XVIRTUALSCREEN

	x_min := desktop_topleft_x
	x_max := desktop_topleft_x + desktop_w
	margin := 50 ; margin to check

	if( x_left > x_max-margin || x_right < x_min+margin ) {
		MsgBox,,,Can not move to screen because it results window invisible, 1
		return 0  ; invalid
	} else {
		return 1  ; valid
	}
}

maxRestoreWindow() {
	MouseGetPos,,,KDE_id
	; Toggle between maximized and restored state.
	WinGet,KDE_Win,MinMax,ahk_id %KDE_id% ; retrieve window min or max state (-1:minimized, +1:maximized, 0:neither minimized or maximized)
	If KDE_Win
		WinRestore,ahk_id %KDE_id%
	Else
		WinMaximize,ahk_id %KDE_id%
}

waitKeysReleased()
{
	KeyWait, LWin
	KeyWait, RWin
	KeyWait, LAlt
	KeyWait, RAlt
	KeyWait, LControl
	KeyWait, RControl
}


; get monitor work area (x,y,w,h) which the center of current active window is beloging
getCurrentMonitorWorkArea(byref x, byref y, byref w, byref h)
{
	WinGetPos, wx, wy, ww, wh, A ; active window position
	winCenter_x := wx+ww/2
	winCenter_y := wy+wh/2
	SysGet, monCnt, MonitorCount ; get monitor count
	Loop, %monCnt%
	{
		SysGet, m, MonitorWorkArea, %A_Index% ; get monitr work area (exclude taskbar area if exist)
		left   := mLeft
		top    := mTop
		right  := mRight
		bottom := mBottom
		if(winCenter_x > left && winCenter_x < right && winCenter_y > top && winCenter_y < bottom)
		{
			x := left
			y := top
			w := right - left
			h := bottom - top
			return
		}
	}
	MsgBox Error during getCurrentMonitorWorkArea()
}

setWindowMaximizeVertical()
{
	WinGet, st, Style, A
	if( !isWindowNormalApp(st) )
		Return

	; getCurrentMonitorWorkArea() will exclude taskbar area
	getCurrentMonitorWorkArea(mx, my, mw, mh)

	; get current active window geometry
	WinGetPos, wx, wy, ww, wh, A
	WinMove, A, , wx, 0, ww, mh
}

setWindowMaximizeHorizontal()
{
	WinGet, st, Style, A
	if( !isWindowNormalApp(st) )
		Return

	; getCurrentMonitorWorkArea() will exclude taskbar area
	getCurrentMonitorWorkArea(mx, my, mw, mh)

	; get current active window geometry
	WinGetPos, wx, wy, ww, wh, A
	WinMove, A, , 0, wy, mw, wh
}

; Fit (move and resize) window to pre-defined area
setWindowToPredefinedArea(num) 
{
	WinGet, st, Style, A
	if( !isWindowNormalApp(st) )
		Return

	getCurrentMonitorWorkArea(mx, my, mw, mh) ; getCurrentMonitorWorkArea() will exclude taskbar area

	x := []
	y := []
	w := []
	h := []

	; w4                     w3                     w2                     
	; +--------+--------+    +-----+-----+-----+    +--------+--------+    +-----------------+
	; |   #1   |   #2   |    |     |     |     |    |        |        |    | +-------------+ |
	; +--------+--------+    | #5  |  #6 |  #7 |    |   #8   |   #9   |    | |      #0     | |
	; |   #3   |   #4   |    |     |     |     |    |        |        |    | +-------------+ |
	; +--------+--------+    +-----+-----+-----+    +--------+--------+    +-----------------+

	w4_w := floor(mw/2)
	w4_h := floor(mh/2)
	w3_w := floor(mw/3)
	w3_h := mh
	w2_w := floor(mw/2)
	w2_h := mh

	x[0] := 300
	y[0] := 100
	w[0] := mw - 600
	h[0] := mh - 200

	x[1] := w4_w * 0
	y[1] := w4_h * 0
	w[1] := w4_w
	h[1] := w4_h

	x[2] := w4_w * 1
	y[2] := w4_h * 0
	w[2] := w4_w
	h[2] := w4_h

	x[3] := w4_w * 0
	y[3] := w4_h * 1
	w[3] := w4_w
	h[3] := w4_h

	x[4] := w4_w * 1
	y[4] := w4_h * 1
	w[4] := w4_w
	h[4] := w4_h

	x[5] := w3_w * 0
	y[5] := 0
	w[5] := w3_w
	h[5] := w3_h

	x[6] := w3_w * 1
	y[6] := 0
	w[6] := w3_w
	h[6] := w3_h

	x[7] := w3_w * 2
	y[7] := 0
	w[7] := w3_w
	h[7] := w3_h

	x[8] := w2_w * 0
	y[8] := 0
	w[8] := w2_w
	h[8] := w2_h

	x[9] := w2_w * 1
	y[9] := 0
	w[9] := w2_w
	h[9] := w2_h

	wx   := mx + x[num]
	wy   := my + y[num]
	ww   := w[num]
	wh   := h[num]

	WinGet, win_id, ID, A
	WinMove, ahk_id %win_id%, , wx, wy, ww, wh
	CoordMode,Mouse
	MouseMove, wx+ww/2, wy+wh/2
}

moveWindow( dir )
{
	getTaskBarSz(tbSz_up, tbSz_dn)

	m_px_reloc := 200 ; mouse relocate pixel size
	mvStep_hor := floor((A_ScreenWidth                    )/g_res_mvresize) ; split desktop in horizontal direction
	mvStep_ver := floor((A_ScreenHeight -tbSz_up -tbSz_dn )/g_res_mvresize) ; split desktop in vertical direction ( 40 pixel means taskbar area )

	CoordMode,Mouse
	MouseGetPos, mx, my
	WinGet,win_id,ID,A
	WinGetPos, wx, wy, ww, wh, ahk_id %win_id%

	; align to pre-specified grid (start at 0,0)
	win_x   := (floor(wx/mvStep_hor+0.5)) * mvStep_hor ; +0.5: to get nearest integer value
	win_y   := (floor(wy/mvStep_ver+0.5)) * mvStep_ver ; +0.5: to get nearest integer value

	; shift-down if taskbar is upside
	win_y := win_y + tbSz_up

	; if current window is not fit to grid, fit to grid is enough
	; and if current window is already fit to grid, execute move 
;	if(win_x = wx && win_y = wy) {
	; or move window directly after fit to grid position
		; adjust window position to move
		if     ( dir = "Left" ) {
			win_x := win_x - mvStep_hor
		}
		else if( dir = "Right") {
			win_x := win_x + mvStep_hor
		}
		else if( dir = "Up"   ) {
			win_y := win_y - mvStep_ver
		}
		else if( dir = "Down" ) {
			win_y := win_y + mvStep_ver
		}
;	}

	; adjust mouse (not to lose focus after resize or move)
	if(mx > win_x + ww)
		mx := win_x + ww -m_px_reloc
	if(mx < win_x )
		mx := win_x      +m_px_reloc
	if(my > win_y + wh)
		my := win_y + wh -m_px_reloc
	if(my < win_y )
		my := win_y      +m_px_reloc

	; if resultant position and size of window is not valid, then do not change
	if( isValidWindow( win_x, win_y, ww, wh ) ){
		MouseMove, mx, my
		WinMove,ahk_id %win_id%, , win_x, win_y, ww, wh
	}
}

resizeWindow( dir )
{
	getTaskBarSz(tbSz_up, tbSz_dn)

	m_px_reloc := 200 ; mouse relocate pixel size
	szStep_hor := floor((A_ScreenWidth                    )/g_res_mvresize)
	szStep_ver := floor((A_ScreenHeight -tbSz_up -tbSz_dn )/g_res_mvresize)

	CoordMode,Mouse
	MouseGetPos, mx, my
	WinGet,win_id,ID,A
	WinGetPos, wx, wy, ww, wh, ahk_id %win_id%

	; align to pre-specified grid
	win_w := (floor(ww/szStep_hor+0.5)) * szStep_hor ; +0.5: to get nearest integer value
	win_h := (floor(wh/szStep_ver+0.5)) * szStep_ver ; +0.5: to get nearest integer value

	; consider the case that window is already too small
	if(win_w == 0) 
		win_w := szStep_hor
	if(win_h == 0) 
		win_h := szStep_ver

	; if current window is not fit to grid, fit to grid is enough
	; and if current window is already fit to grid, execute resize 
	;if(win_w = ww && win_h = wh) {
		; adjust window size to resize
		if     ( dir = "Left" ) {
			win_w := win_w - szStep_hor
		}
		else if( dir = "Right") {
			win_w := win_w + szStep_hor
		}
		else if( dir = "Up"   ) {
			win_h := win_h - szStep_ver
		}
		else if( dir = "Down" ) {
			win_h := win_h + szStep_ver
		}
	;}

	; adjust mouse (not to lose focus after resize or move)
	if(mx > wx + win_w)
		mx := wx + win_w -m_px_reloc
	if(mx < wx )
		mx := wx         +m_px_reloc
	if(my > wy + win_h)
		my := wy + win_h -m_px_reloc
	if(my < wy )
		my := wy         +m_px_reloc

	; if resultant position and size of window is not valid, then do not change
	if( isValidWindow( wx, wy, win_w, win_h ) ){
		MouseMove, mx, my
		WinMove,ahk_id %win_id%, , wx, wy, win_w, win_h
	}
}

; does the window is in-side of curent desktop, not hided by taskbar
isValidWindow( x, y, w, h )
{
	SysGet, desktop_w        , 78 ; SM_CXVIRTUALSCREEN
	SysGet, desktop_h        , 79 ; SM_CYVIRTUALSCREEN
	SysGet, desktop_topleft_x, 76 ; SM_XVIRTUALSCREEN
	SysGet, desktop_topleft_y, 77 ; SM_YVIRTUALSCREEN

	;MsgBox % "Vitual Screen " desktop_w "/" desktop_h "/" desktop_topleft_x "/" desktop_topleft_y

	getTaskBarSz(tbSz_up, tbSz_dn)

	x_min := desktop_topleft_x
	x_max := desktop_topleft_x + desktop_w
	y_min := desktop_topleft_y             +tbSz_up
	y_max := desktop_topleft_y + desktop_h -tbSz_dn
	width := desktop_w
	;height:= desktop_h-tbSz_dn-tbSz_up
	height:= desktop_h

	margin := 50 ; to prevent very small area of window is on desktop

	if( x >= x_max-margin)
	{
		MsgBox,,, Can not move or reisze: left side will be disappeared`n(%x% >= %x_max%-%margin%), 2
		return 0  ; results invalid window
	}

	if( y >= y_max-margin)
	{
		MsgBox,,, Can not move or reisze: bottom side will be disappeared`n(%y% >= %y_max%-%margin%), 2
		return 0  ; results invalid window
	}

	if( x+w <= x_min+margin)
	{
		MsgBox,,, Can not move or reisze: width is too small`n(%x%+%w% <= %x_min%+%margin%), 2
		return 0  ; results invalid window
	}

	if( y+h <= y_min+margin )
	{
		MsgBox,,, Can not move or reisze: height is too small`n(%y%+%h% <= %y_min%+%margin%), 2
		return 0  ; results invalid window
	}

;	if( h > height )
;	{
;		MsgBox,,, Can not move or reisze: height is too big`n(%h% > %height%), 2
;		return 0  ; results invalid window
;	}
;
;	if( w > width )
;	{
;		MsgBox,,, Can not move or reisze: width is too big`n(%w% > %width%), 2
;		return 0  ; results invalid window
;	}

	if( w < margin || h < margin )
	{
		MsgBox,,, Can not move or reisze: window is too small`n(%w% < %margin% || %h% < %margin%), 2
		return 0  ; results invalid window
	}
	
;	if( x >= x_max-10 || y >= y_max-10 || x+w <= x_min+10 || y+h <= y_min+10 || h > height || w > width || w < 10 || h < 10) { 
;		MsgBox,,, Can not move or reisze because it results invalid postion or size (%x% %y% %w% %h%), 1
;		return 0  ; invalid
;	} else {
;		return 1  ; valid
;	}

	return 1   ; valid window
}


removeLineFeed(str)
{
	StringReplace, str, str, `r,,All
	StringReplace, str, str, `n,,All
	return str
}

restoreSession() ; Retreive windows size, postion from file (refer : https://www.autohotkey.com/docs/commands/FileOpen.htm )
{
	winPosCfgFile := "_ahk_session"
	file := FileOpen(winPosCfgFile, "r-d") ; read the file ("r"), share all access except for delete ("-d")
	if !IsObject(file)
	{
		MsgBox Can't open "%winPosCfgFile%" for reading.
		return
	}
	else
	{
		WinGet windows, List
		while(!File.AtEOF)
		{
			winClass  := file.ReadLine()
			x         := file.ReadLine()
			y         := file.ReadLine()
			width     := file.ReadLine()
			height    := file.ReadLine()
			winClass  := removeLineFeed(winClass)
			x         := removeLineFeed(x)
			y         := removeLineFeed(y)
			width     := removeLineFeed(width)
			height    := removeLineFeed(height)
			 
			WinMove, ahk_class %winClass%, , x, y, width, height
			restored .= winClass . "`n"
		}
		file.Close()
		MsgBox,,,[Session Restored]`n%restored%
	}
}

saveSession() ; Save windows size, postion from file (refer : https://www.autohotkey.com/docs/commands/FileOpen.htm )
{
	winPosCfgFile := "_ahk_session"
	file := FileOpen(winPosCfgFile, "w")
	if !IsObject(file)
	{
			MsgBox Can't open "%winPosCfgFile%" for reading.
			return
	}
	else
	{
		WinGet windows, List
		Loop %windows%
		{
			id := windows%A_Index%
			WinGetClass wc, ahk_id %id%
			WinGetPos, wx, wy, ww, wh, ahk_id %id%
			WinGet, st, Style, ahk_id %id%
			if ( isWindowNormalApp(st) )
			{
				file.WriteLine(wc)
				file.WriteLine(wx)
				file.WriteLine(wy)
				file.WriteLine(ww)
				file.WriteLine(wh)
				;savedLines .= wc . "`n" . wx . "`n" . wy . "`n" . ww . "`n" . wh . "`n"
				savedLines .= wc . "`n"
			}
		}
		file.Close()
		MsgBox,,,[Session Saved]`n%savedLines%`nsaved to %A_ScriptDir%/%winPosCfgFile%, 3
	}
}


; Show fixed Task Manager and use NumpadKey (NumpadClear, NumpadLeft/Right/Up/Down, NumpadClear) or  use vim keys (hjkl)
taskSwitcher() ; Currently unused
{
	;waitKeysReleased() ; confirm all keys are released before suspend
	Suspend, On ; Suspends all hotkeys and hotstrings (to prevent the confliction with NumpadLRUD to move windows)
	;Hotkey, xxxx, Off
	Send ^!{Tab}
	Loop{
		input, key, L1, {NumpadLeft}{NumpadRight}{NumpadUp}{NumpadDown}{NumpadClear}{NumpadEnter}{Enter}{Esc}
		;MsgBox,,, %ErrorLevel%
		;MsgBox,,, %key%
		if(ErrorLevel != "Max") {
			StringReplace, key, ErrorLevel, EndKey:      , , All
			StringReplace, key, key       ,        Numpad, , All
		}
		;MsgBox,,, %key%, 1
		if(key = "Escape" ) {
			Send {Esc}
			Break
		} else if(key = "Clear" or key = "Enter" ) {
			Send {Enter}
			Break
		} else if(key = "Left" or key = "h") {
			Send {Left}
		} else if(key = "Right" or key = "l") {
			Send {Right}
		} else if(key = "Up" or key = "k") {
			Send {Up}
		} else if(key = "Down" or key = "j") {
			Send {Down}
		}
		Sleep 50
	}
	Suspend, Off ; Re-enable
	;Hotkey, xxxx, On
}
; label 
SendLButtonEsc:
	Send {LButton}
	Send {Esc}
	MsgBox "Send LButton, Esc"
	Return
SendLButton:
	Send {LButton}
	MsgBox "Send LButton"
	Return


controlWindowUseVimKeys() ; Currently unused function
{
	;waitKeysReleased() ; confirm all keys are released before suspend
	Suspend, On ; Suspends all hotkeys and hotstrings (e.g. conflict with total command key)
	;CtrlH := Chr(8)
	;CtrlL := Chr(12)
	Loop{
		input, key, L1 C M, {Enter}{Esc}
		;MsgBox,,, %ErrorLevel% - %key%
		; =  : case insensitive compare
		; == : case   sensitive compare
		if(ErrorLevel = "Max") {
			if(key == "h") {
				                       moveWindow("Left")
			} else if(key == "l") {
				                       moveWindow("Right")
			} else if(key == "k") {
				                       moveWindow("Up")
			} else if(key == "j") {
				                       moveWindow("Down")
			} else if(key == "H") {
				                       resizeWindow("Left")
			} else if(key == "L") {
				                       resizeWindow("Right")
			} else if(key == "K") {
				                       resizeWindow("Up")
			} else if(key == "J") {
				                       resizeWindow("Down")
			;} else if(key = CtrlH) {
			;	                       moveWindowToOtherMonitor("Left")
			;} else if(key = CtrlL) {
			;	                       moveWindowToOtherMonitor("Right")
			;} else if(key == "t") {
			;	                       WinSet, AlwaysOnTop, On, A
			;} else if(key == "m") {
			;	                       maxRestoreWindow()
			}
		} else {
			;StringReplace, key, ErrorLevel, EndKey:      , , All
			Suspend, Off ; Re-enable
			return
		}
	}
}

obsolete(inkey) ; Currently unused function. Remain here for reference purpose
{
	StringReplace, key, inkey,      #, , All
	StringReplace, key,   key, Numpad, , All
	;MsgBox % "pressed :" key
	IfInString, key, !
	{
		StringReplace, key, key, !, , All
		IfInString, key, ^
		{
			StringReplace, key, key, ^, , All
			moveWindowToOtherMonitor( key )
		}
		else{
			moveWindow( key )
		}
	}
	else
	{
		IfInString, key, +
		{
			StringReplace, key, key, +, , All
			resizeWindow( key )
		}
	}
}
; }}}

;################################################################################
; Windows Common Features
;################################################################################
; {{{
;--------------------------------------------------------------------------------
Capslock:: ;;;; Mapping CapsLock to Han/Eng, Long press is 'Capslock' (as like Mac )
;--------------------------------------------------------------------------------
t_capslock_start := A_TickCount
s_capslock := GetKeyState("CapsLock","T")
loop
{
	t_capslock_duration := A_TickCount - t_capslock_start

	if( t_capslock_duration >= 250 ) 
		SetCapsLockState, % s_capslock ? "OFF" : "ON"

	if(GetKeyState("CapsLock","P") = 0) {
		if( t_capslock_duration < 250 ) 
			Send {vk15sc138}
		break
	}
}
Return

;--------------------------------------------------------------------------------
!4::Send !{F4} ;;;; Close window (for laptop)
#q::Send !{F4} ;;;; Close window (as like Mac Cmd+Q)
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
#f:: Run "C:\Everything\Everything.exe" ;;;; Searching "Everything" (as like Mac finder)
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
>+Up::     Send {Volume_Up}          ;;;; Media Control
>+Down::   Send {Volume_Down}        ;;;; Media Control
>+Right::  Send {Media_Next}         ;;;; Media Control
;>+Left::  Send {Media_Prev}         ;;;; Media Control
>+Left::   Send {Media_Play_Pause}   ;;;; Media Control
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
^!0::       ;;;; Media Rating (MusicBee)
^!1::       ;;;; Media Rating (MusicBee)
^!2::       ;;;; Media Rating (MusicBee)
^!3::       ;;;; Media Rating (MusicBee)
^!4::       ;;;; Media Rating (MusicBee)
^!5::       ;;;; Media Rating (MusicBee)
;--------------------------------------------------------------------------------
	wndId := WinExist("ahk_exe MusicBee.exe")
	ControlSend,, %A_ThisHotKey%, ahk_id %wndId%
	Return

;--------------------------------------------------------------------------------
;~Esc::                                           ; Double press 'ESC'
;	if (A_PriorHotkey = "~Esc" AND A_TimeSincePriorHotkey < 200) 
;	{
;		;raiseLowerCurrentActiveWindow() 
;		;lowerCurrentActiveWindow() 
;		;WinSet, Bottom, , A  ; lower windows
;		;Send, !{Esc}
;		controlWindowUseVimKeys()
;		;Sleep 0
;		KeyWait Esc  ; Wait key released ... prevents keyboard auto-repeat
;	}
;	Return
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
#u::           WinSet, Top   , , A                ;;;; Windows Raise (or use mouse click)
#n::           WinSet, Bottom, , A                ;;;; Windows Lower (override windows hotkey)
+Esc::         raiseLowerCurrentActiveWindow()    ;;;; Windows Raise or Lower (as like linux)
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

;--------------------------------------------------------------------------------
#^+s::saveSession()      ;;;; Save Sessions (Visible Windows Position and Size)
#^+r::restoreSession()   ;;;; Restore Sessions (Visible Windows Position and Size)
;--------------------------------------------------------------------------------
; }}}

;################################################################################
; Move/Reisze windows using Mouse 
;################################################################################
; {{{

; ;--------------------------------------------------------------------------------
; ; VNC Related Clients (Change RCtrl to LAlt for VNC)
; ;--------------------------------------------------------------------------------
; #If (WinActive("ahk_class vwr::CDesktopWin") || WinActive("ahk_class TvnWindowClass") || WinActive("ahk_class vncviewer") || WinActive("ahk_class VNCviewer")) 
; ;                      tightvnc 1.3.10                         tightvnc 2.x.xx                          tigervnc                             realvnc
; SC11D::LAlt                              ;;;; change RCtrl to LAlt for VNC (RCtrl+MouseL(R)Click move(resize) windows in VNCclient(Linux)
; ;^!=::WinMove, , ,   -8, 0,  7700, 2160  ;;;; VNC client extend to dual monitor (SAMSUNG 3840x2160 x dual)
; ;^!=::WinMove, , , -3840, 0, 11520, 2160 ;;;; VNC client extend to dual monitor (SAMSUNG 3840x2160 x triple)
; #If
; ;--------------------------------------------------------------------------------
; 
; ;--------------------------------------------------------------------------------
; ; Non-VNC windows, Swap RWin and RCtrl
; ;--------------------------------------------------------------------------------
; #If (!WinActive("ahk_class vwr::CDesktopWin") && !WinActive("ahk_class TvnWindowClass") && ~WinActive("ahk_class vncviewer") && !WinActive("ahk_class VNCviewer")) 
; SC11D::LWin            ;;;; {RCtrl or Win}+MouseL(R)Click move(resize) windows
; RWin::Send {VK19SC11D} ;;;; RWin is RCtrl/ÇÑÀÚ
; #If
; ;--------------------------------------------------------------------------------



; Code from Jonny, http://www.autohotkey.com

;SetWinDelay,10   ; delay after each windowing command, miliseconds, 100(def), -1(noDely), 0(smallest possible delay)
;CoordMode,Mouse
;return

;--------------------------------------------------------------------------------
#LButton:: ;;;; Move windows (DoubleAlt : minimize)
;--------------------------------------------------------------------------------
SetWinDelay,10
CoordMode,Mouse
If DoubleAlt
{
	MouseGetPos,,,KDE_id
	; This message is mostly equivalent to WinMinimize,
	; but it avoids a bug with PSPad.
	PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
	DoubleAlt := false
	return
}
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
	return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
	GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
	If KDE_Button = U
		break
	MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
	KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
	KDE_Y2 -= KDE_Y1
	KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
	KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
	WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
return

;--------------------------------------------------------------------------------
#RButton:: ;;;; Resize windows (DoubleAlt : maximize)
;--------------------------------------------------------------------------------
SetWinDelay,10
CoordMode,Mouse
If DoubleAlt
{
	MouseGetPos,,,KDE_id
	; Toggle between maximized and restored state.
	WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
	If KDE_Win
		WinRestore,ahk_id %KDE_id%
	Else
		WinMaximize,ahk_id %KDE_id%
	DoubleAlt := false
	return
}
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
	return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
	KDE_WinLeft := 1
Else
	KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
	KDE_WinUp := 1
Else
	KDE_WinUp := -1
Loop
{
	GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
	If KDE_Button = U
		break
	MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
	; Get the current window position and size.
	WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
	KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
	KDE_Y2 -= KDE_Y1
	; Then, act according to the defined region.
	WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
	                        , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
	                        , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
	                        , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
	KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
	KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return

;--------------------------------------------------------------------------------
#MButton:: ;;;; DoubleAlt : Close Window 
;--------------------------------------------------------------------------------
SetWinDelay,10
CoordMode,Mouse
If DoubleAlt
{
	MouseGetPos,,,KDE_id
	WinClose,ahk_id %KDE_id%
	DoubleAlt := false
	return
}
return

;--------------------------------------------------------------------------------
~Alt:: ; This detects "double-clicks" of the alt key.
;--------------------------------------------------------------------------------
DoubleAlt := A_PriorHotkey = "~Alt" AND A_TimeSincePriorHotkey < 400
Sleep 0
KeyWait Alt  ; This prevents the keyboard's auto-repeat feature from interfering.
return
; }}}

;################################################################################
;;;; Total Commander (Use number key instead of Fn key, for small-sized-fn-key-laptop)
;################################################################################
; {{{
^#t::Run "C:\Pgm\totalcmd\TOTALCMD64.EXE"

#IfWinActive ahk_class TTOTAL_CMD  ;;;; Total Commander (Use number key instead of Fn key)
	; ---------------------------------------------------
	; Normal Function Keys for Total Commander
	; ---------------------------------------------------
	; Fn ----------------------
	1::      ; help               
	2::      ; refresh
	3::      ; view file (RO)
	4::      ; edit file (RW)
	5::      ; copy
	6::      ; move
	7::      ; create folder
	8::      ; delete file
	9::
	0::

	; Alt+Fn ------------------
	!1::     ; drive select
	!2::     ; drive select
	!3::
	!4::
	;!5::     ; zip (customized)
	!6::
	!7::     ; search
	!8::
	!9::
	!0::

	; Shift+Fn ----------------
	+1::
	;+2::     ; compare files (customized)
	+3::     ; 
	+4::     ; create (edit) file
	+5::     ; copy to current folder
	+6::     ; rename filename
	+7::     ; new folder
	+8::     ; 
	+9::     ; 
	+0::     ; context menu           

	; Ctrl+Fn -----------------
	^1::
	^2::
	^3::
	^4::
	^5::
	^6::
	^7::
	^8::
	^9::
	^0::

	; Alt+Shift_Fn ------------
	!+1::
	!+2::
	!+3::
	!+4::
	;!+5::     ; (customized)
	!+6::
	!+7::
	!+8::
	!+9::
	!+0::

	; Ctrl+Shift+Fn -----------
	^+1::
	^+2::
	^+3::
	^+4::
	^+5::     ; create link
	^+6::
	^+7::
	^+8::
	^+9::
	^+0::
		key := tc_sendFnKey(A_ThisHotKey)
		Return

	; ---------------------------------------------------
	; replace num pad keys
	; ---------------------------------------------------
	=::  ; selection, mark
	-::  ; unselect , clear mark
	\::  ; invert selection
	^=:: ; select all
	^-:: ; unselect all
		tc_sendNumpadKey(A_ThisHotKey)
		Return

	; ---------------------------------------------------
	; specialized Fn keys 
	; ---------------------------------------------------
	!5::
	+2::
	!+5::
		if ( tc_isFocusInEditCtrl() ) {
			Send %A_ThisHotKey%
		} else {
			set_ime_A()
			if(A_ThisHotKey = "!5") {
				Send       !{F5}zip:"archive.zip"{Enter} ; archive (preserve files)
			} else if(A_ThisHotKey = "+2") {
				Send ^{Down}cm_CompareDirsWithSubdirs{Enter} ; compare folder and files in current folder
			} else if(A_ThisHotKey = "!+5") {
				Send     !+{F5}zip:"archive.zip"{Enter} ; archive (move files)
			} else {
				Send %A_ThisHotKey%
			}
			restore_ime()
		}
		Return

	; ---------------------------------------------------
	; misc commands 
	; ---------------------------------------------------

	^PgUp:: Send ^+{Tab}  ; move to next tab
	^PgDn:: Send ^{Tab}   ; move to prev tab
	
	+g:: Send {End}  ; go to end of list

	+h::
	+l::
	+j::
	+k::
	!h::
	!l::
	!j::
	!k::
	^h::
	^j::
	^k::
	^l::
	h::
	j::
	k::
	l::
		if ( tc_isFocusInEditCtrl() ) {
			Send %A_ThisHotKey%
		} else {
			if InStr(A_ThisHotKey, "l") {
				StringReplace, key, A_ThisHotKey, l, {Right}, All
			} else if InStr(A_ThisHotKey, "h") {
				StringReplace, key, A_ThisHotKey, h, {Left} , All
			} else if InStr(A_ThisHotKey, "k") {
				StringReplace, key, A_ThisHotKey, k, {Up}   , All
			} else if InStr(A_ThisHotKey, "j") {
				StringReplace, key, A_ThisHotKey, j, {Down} , All
			}
			Send %key%
			;MsgBox,,, %key%
		}
		Return

	^+c:: ; copy, paste, modify file name
	^+v::
	+Enter::
		if ( tc_isFocusInEditCtrl() ) {
			Send %A_ThisHotKey%
		} else {
			if       (A_ThisHotKey = "^+c") {
				Send  +{F6}^c{Enter} ; copy filename as text
			} else if(A_ThisHotKey = "^+v") {
				Send  +{F6}^v{Enter} ; rename filename from clipboard
			} else if(A_ThisHotKey = "+Enter") {
				Send  +{F6}          ; renmae filename (in-place)
			} else {
				Send %A_ThisHotKey%
			}
		}
		Return

	^+Enter::
	^Enter::
	!g::
	!v::
	!t::
	!i::
	!e::
	!w::
	!r::
	^+p::
	^+h::
		if ( tc_isFocusInEditCtrl() ) {
			Send %A_ThisHotKey%
		} else {
			set_ime_A()
			if       (A_ThisHotKey = "^+Enter") {
				Send ^{Down}em_gvv{Enter}  ; open file to existing gvim instance as vertical split
			} else if(A_ThisHotKey = "^Enter") {
				Send ^{Down}em_gvt{Enter}  ; open file to existing gvim instance as new tab
			} else if(A_ThisHotKey = "!g") {
				Send ^{Down}em_gv{Enter}  ; open vim session file
			} else if(A_ThisHotKey = "!v") {
				Send ^{Down}em_hv{Enter}   ; view file using honeyview (as like quick view)
			} else if(A_ThisHotKey = "!t") {
				Send ^{Down}em_irfv{Enter} ; irfanview, open thumbnail view
			} else if(A_ThisHotKey = "!i") {
				Send ^{Down}em_im{Enter} ; imagine, open thumbnail browse
			} else if(A_ThisHotKey = "!e") {
				Send ^{Down}em_ce{Enter} ; run consoleEmu
			} else if(A_ThisHotKey = "!w") {
				Send ^{Down}em_wsl{Enter} ; run wsl, ubuntu
			} else if(A_ThisHotKey = "!r") {
				Send ^{Down}em_cmd{Enter} ; run cmd
			} else if(A_ThisHotKey = "^+p") {
				Send ^{Down}magick clipboard: clipboard.png{Enter} ; paste clipboard's image to file (clipboard.png) at current folder
			} else if(A_ThisHotKey = "^+h") {
				Send ^{Down}cm_SwitchHidSys{Enter} ; toggle turn on/off show hidden/system files
			} else {
				Send %A_ThisHotKey%
			}
			restore_ime()
		}
		Return

;   <+Left::
;   <+Right::
;   ;+Left::
;   ;+Right::
;       Send           {F5}          ; copy file(s)
;       Return
;   >+Left::
;   >+Right::
;   ;^+Left::
;   ;^+Right::
;       Send           {F6}          ; move file(s)
;       Return

	!+d::Send %A_YYYY%%A_MM%%A_DD%

#IfWinActive ; endif TTOTAL_CMD
; }}}

;################################################################################
; Outlook : move mail to specific folder
;################################################################################
; {{{
; you can get "ahk_class" using "windows spy". ("window spy" has been installed with AHK)
#IfWinActive ahk_exe OUTLOOK.EXE  ;;;; Outlook : move mail to specific folder
;^!+m::
;    ;MsgBox, "Move selected mail msg to folder"
;    ; move mail message to 0-**** folder
;    Send !hmvo
;Return

^+Alt::
;    MsgBox, "Key Pressed" . %A_ThisHotKey%
	set_ime_A()
	input, destChar, L1

	if destChar is alnum
		mvMessage(destChar)
	else
		MsgBox, "non-alpha,numeric key has been pressed" . %destChar%

	restore_ime()
Return

mvMessage( dest_folder_char )
{
; move message to destination folder
	Send !hmvo
	Send %dest_folder_char%
;    Send %dest_folder_char%{ENTER}
}
#IfWinActive
; }}}

