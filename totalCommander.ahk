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

#include libFunctions.ahk

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

