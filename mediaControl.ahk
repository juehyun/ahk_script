;/**********************************************************************
; * COPYRIGHT (C) 2017 Joohyun Lee (juehyun@etri.re.kr)
; * 
; * MIT License
; * 
; * Permission is hereby granted, free of charge, to any person obtaining
; * a copy of this software and associated documentation files (the
; * "Software"), to deal in the Software without restriction, including
; * without limitation the rights to use, copy, modify, merge, publish,
; * distribute, sublicense, and/or sell copies of the Software, and to
; * permit persons to whom the Software is furnished to do so, subject to
; * the following conditions:
; * 
; * The above copyright notice and this permission notice shall be
; * included in all copies or substantial portions of the Software.
; * 
; * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
; * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
; * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
; * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
; * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
; * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
; * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
; *********************************************************************/

#include libFunctions.ahk

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


