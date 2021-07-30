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
; Auto and Initial Execution Section
;################################################################################
; AHK, After the script has been loaded, it begins executing at the top line,
;      continuing until a Return, Exit, hotkey/hotstring label,
;      or the physical end of the script is encountered (whichever comes first).
;      This top portion of the script is referred to as the auto-execute section.

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

#include libFunctions.ahk
