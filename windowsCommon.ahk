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
!4::Send !{F4} ;;;; Close window (for laptop)
#q::Send !{F4} ;;;; Close window (as like Mac Cmd+Q)
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
#f:: Run "C:\Everything\Everything.exe" ;;;; Searching "Everything" (as like Mac finder)
;--------------------------------------------------------------------------------

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
;		KeyWait, Esc  ; Wait key released ... prevents keyboard auto-repeat
;	}
;	Return
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
#^+s::saveSession()      ;;;; Save Sessions (Visible Windows Position and Size)
#^+r::restoreSession()   ;;;; Restore Sessions (Visible Windows Position and Size)
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
; Non-VNC windows, Swap RWin and RCtrl
;--------------------------------------------------------------------------------
#If (!WinActive("ahk_class vwr::CDesktopWin") && !WinActive("ahk_class TvnWindowClass") && ~WinActive("ahk_class vncviewer") && !WinActive("ahk_class VNCviewer")) 
SC11D::LWin            ;;;; {RCtrl or Win}+MouseL(R)Click move(resize) windows
RWin::Send {VK19SC11D} ;;;; RWin is RCtrl/한자
#If
;--------------------------------------------------------------------------------
