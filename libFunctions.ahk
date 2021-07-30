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
; Functions
;################################################################################
; {{{
global g_ime_status
global g_ime_changed
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
; return value = 1, means key state is "��"
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

isOnTaskBarArea(x, y)
{
	WinGetPos tbx, tby, tbw, tbh, ahk_class Shell_TrayWnd
	if( x >= tbx and x <= tbx+tbw and y >= tby and y <= tby+tbh )
		Return 1
	else 
		Return 0
}

moveWindowToOtherMonitor( dir )
{
	CoordMode, Mouse
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
	MouseGetPos,,,winid
	; Toggle between maximized and restored state.
	WinGet, max, MinMax, ahk_id %winid% ; retrieve window min or max state (-1:minimized, +1:maximized, 0:neither minimized or maximized)
	If max
		WinRestore,ahk_id %winid%
	Else
		WinMaximize,ahk_id %winid%
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
	CoordMode, Mouse
	MouseMove, wx+ww/2, wy+wh/2
}

moveWindow( dir )
{
	res_mvresize := 10
	getTaskBarSz(tbSz_up, tbSz_dn)

	m_px_reloc := 200 ; mouse relocate pixel size
	mvStep_hor := floor((A_ScreenWidth                    )/res_mvresize) ; split desktop in horizontal direction
	mvStep_ver := floor((A_ScreenHeight -tbSz_up -tbSz_dn )/res_mvresize) ; split desktop in vertical direction ( 40 pixel means taskbar area )

	CoordMode, Mouse
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
	res_mvresize := 10
	getTaskBarSz(tbSz_up, tbSz_dn)

	m_px_reloc := 200 ; mouse relocate pixel size
	szStep_hor := floor((A_ScreenWidth                    )/res_mvresize)
	szStep_ver := floor((A_ScreenHeight -tbSz_up -tbSz_dn )/res_mvresize)

	CoordMode, Mouse
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
;; label 
;SendLButtonEsc:
;	Send {LButton}
;	Send {Esc}
;	MsgBox "Send LButton, Esc"
;	Return
;SendLButton:
;	Send {LButton}
;	MsgBox "Send LButton"
;	Return


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


global g_en_moveresizeloop
moveResizeLoop_End()
{
	g_en_moveresizeloop := 0
}
moveResizeWindow(move, resize)
{
	;MsgBox,,,moveResizeWindows %move% %resize%, 1
	GetKeyState, mlb, LButton, P
	GetKeyState, mrb, RButton, P
	ih := InputHook("L0")
	ih.KeyOpt("{Enter}{Esc}" , "N")
	ih.OnKeyDown := Func("moveResizeLoop_End")
	ih.Start()
	g_en_moveresizeloop := 1
	CoordMode, Mouse
	MouseGetPos, mx, my, curwin  ; get origin mouse position
	WinGetPos, wx, wy, ww, wh, ahk_id %curwin%

	; decide which quater rectangle the mouse is located on
	if(mx<=(wx+ww/2) and my<=(wy+wh/2))
		mouse_pos := 1                        ; update x, y, width, height
	else if(mx> (wx+ww/2) and my<=(wy+wh/2))
		mouse_pos := 2                        ; update    y, width, height
	else if(mx<=(wx+ww/2) and my> (wy+wh/2))
		mouse_pos := 3                        ; update x,    width, height
	else if(mx> (wx+ww/2) and my> (wy+wh/2))
		mouse_pos := 4                        ; update       width, height
	else
		Msgbox,,, Error to determine mouse_pos at moveResizeLoop(), 1

	Loop
	{
		GetKeyState, rb, RButton, P
		GetKeyState, lb, LButton, P
		if(g_en_moveresizeloop=0 or mlb!=lb or mrb!=rb) ; loop is ended or mouse button state is different
			break
		
		; get delta of mouse position
		MouseGetPos, new_mx, new_my
		d_mx := new_mx - mx
		d_my := new_my - my
		
		if(move = 1)
		{
			new_wx := wx + d_mx
			new_wy := wy + d_my
			WinMove, ahk_id %curwin%, , new_wx, new_wy
		}
		if(resize = 1)
		{
			if(mouse_pos=1) {
				new_wx := wx + d_mx
				new_wy := wy + d_my
				new_ww := ww - d_mx
				new_wh := wh - d_my
				WinMove, ahk_id %curwin%, , new_wx, new_wy, new_ww, new_wh
			}
			else if(mouse_pos=2) {
				new_wx := wx
				new_wy := wy + d_my
				new_ww := ww + d_mx
				new_wh := wh - d_my
				WinMove, ahk_id %curwin%, , new_wx, new_wy, new_ww, new_wh
			}
			else if(mouse_pos=3) {
				new_wx := wx + d_mx
				new_wy := wy 
				new_ww := ww - d_mx
				new_wh := wh + d_my
				WinMove, ahk_id %curwin%, , new_wx, new_wy, new_ww, new_wh
			}
			else if(mouse_pos=4) {
				new_wx := wx
				new_wy := wy 
				new_ww := ww + d_mx
				new_wh := wh + d_my
				WinMove, ahk_id %curwin%, , new_wx, new_wy, new_ww, new_wh
			}
			else {
				MsgBox,,, Error - Unknown mouse_pos %mouse_pos%, 1
			}
		}
	}
	ih.Stop()
}


; --------------------------------------------
; - Gesture                      | Action
; --------------------------------------------
; - RButton/LButton dual click   | moveResizeWindow(move)
; - RButton double click         | moveResizeWindow(resize)
; - RButton (short) swipe  up    | ^!{Tab}
; - RButton (long ) swipe  up    | #{Tab}
; - RButton (short) swipe  dn    | lowerCurrentActiveWindow()
; - RButton (long ) swipe  dn    | #{Down}   , minimize
; - RButton (short) swipe  left  | !{Left}   , browser go back
; - RButton (long ) swipe  left  | ^#{Right} , change virtual desktop
; - RButton (short) swipe  right | !{Right}  , browser go forward
; - RButton (long ) swipe  right | ^#{Left } , change virtual desktop
; - RButton (short) swipe  ↖     | ^+{Tab}   , prev tab
; - RButton (long ) swipe  ↖     |
; - RButton (short) swipe  ↗     | ^{Tab}    , next tab
; - RButton (long ) swipe  ↗     | maxRestoreWindow()
; - RButton (short) swipe  ↙     | ^w        , close tab
; - RButton (long ) swipe  ↙     | !{F4}     , close window
; - RButton (short) swipe  ↘     | Send {F5} , reload web browser
; - RButton (long ) swipe  ↘     |
; --------------------------------------------

mouseGestureWithRButton()
{
	; Check double click
	if (A_PriorHotkey="RButton" and A_ThisHotKey="RButton" and A_TimeSincePriorHotkey < 500) {
		Send {Esc} ; to cancel popup menu
		moveResizeWindow(0,1)                     ;;;; RButton Gesture : double click
		Return
	}

	; Check dual click (wait LButton only Txxx second timeout)
	KeyWait, LButton, D, T0.05
	if(!ErrorLevel) {
		moveResizeWindow(1,0)                     ;;;; RButton Gesture : dual click (RButton+LButton)
		Return
	}

	; Get mouse click position (click down, click up)
	CoordMode, Mouse
	MouseGetPos, s_mx, s_my
	KeyWait, RButton, U
	MouseGetPos, e_mx, e_my

	; Click
	if( s_mx = e_mx and s_my = e_my ) { 
		Send {RButton}
		Return
	}
	; Drag (swipe)
	else {
		cfg_short_swipe_min_x := 50
		cfg_short_swipe_min_y := 20
		cfg_long_swipe_min_x  := 400
		cfg_long_swipe_min_y  := 400

		swipe_left  := false
		swipe_right := false
		swipe_up    := false
		swipe_down  := false
		swipe_wide  := false
		swipe_tall  := false
		if((e_mx - s_mx) < -cfg_short_swipe_min_x)
			swipe_left  := true
		if((e_mx - s_mx) >  cfg_short_swipe_min_x)
			swipe_right := true
		if((e_my - s_my) < -cfg_short_swipe_min_y)
			swipe_up    := true
		if((e_my - s_my) >  cfg_short_swipe_min_y)
			swipe_down  := true
		if(abs(e_mx - s_mx) > cfg_long_swipe_min_x)
			swipe_wide := true
		if(abs(e_my - s_my) > cfg_long_swipe_min_y)
			swipe_tall := true

		; --------------
		; short swipe
		; --------------
		if( !swipe_wide and !swipe_tall ) {
			if       (swipe_up   and swipe_left  ) { 
				Send ^+{Tab}                            ;;;; RButton Gesture : (short) diagonal swipe ↖
			} else if(swipe_up   and swipe_right ) {
				Send ^{Tab}                             ;;;; RButton Gesture : (short) diagonal swipe ↗
			} else if(swipe_down and swipe_left  ) {
				Send ^w                                 ;;;; RButton Gesture : (short) diagonal swipe ↙
			} else if(swipe_down and swipe_right ) {
				Send {F5}                               ;;;; RButton Gesture : (short) diagonal swipe ↘
			} else if(swipe_right)                 {
				Send !{Left}                            ;;;; RButton Gesture : (short) horizontal swipe-left-to-right →
			} else if(swipe_left )                 {
				Send !{Right}                           ;;;; RButton Gesture : (short) horizontal swipe-right-to-left ←
			} else if(swipe_up   )                 {
				Send ^!{Tab}                            ;;;; RButton Gesture : (short) vertical swipe-down-to-up ↑
			} else if(swipe_down )                 {
				lowerCurrentActiveWindow()              ;;;; RButton Gesture : (short) vertical swipe-up-to-down ↓   
			}
		}
		; --------------
		; long swipe
		; --------------
		else if( swipe_wide and swipe_tall ) {
			if       (swipe_up   and swipe_left  ) { 
				                                        ;;;; RButton Gesture : (long) diagonal swipe ↖
			} else if(swipe_up   and swipe_right ) {                                                        
				maxRestoreWindow()                      ;;;; RButton Gesture : (long) diagonal swipe ↗
			} else if(swipe_down and swipe_left  ) {                                                        
				Send !{F4}                              ;;;; RButton Gesture : (long) diagonal swipe ↙
			} else if(swipe_down and swipe_right ) {                                                        
				                                        ;;;; RButton Gesture : (long) diagonal swipe ↘
			}
		}
		else if(swipe_wide) {
			if       (swipe_right)                 {                                                        
				Send ^#{Left}                           ;;;; RButton Gesture : (long) horizontal swipe-left-to-right →
			} else if(swipe_left )                 {                                                                
				Send ^#{Right}                          ;;;; RButton Gesture : (long) horizontal swipe-right-to-left ←
			}
		}
		else if(swipe_tall) {
			if       (swipe_up   )                 {                                                        
				Send #{Tab}                             ;;;; RButton Gesture : (long) vertical swipe-down-to-up ↑
			} else if(swipe_down )                 {                                                               
				Send #{Down}                            ;;;; RButton Gesture : (long) vertical swipe-up-to-down ↓         
			}
		}
		;MsgBox,,, %swipe_left% %swipe_right% %swipe_up% %swipe_down%        %swipe_wide% %swipe_tall%, 1
		Return
	}
}
