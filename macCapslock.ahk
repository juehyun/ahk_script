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
