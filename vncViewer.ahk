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

;--------------------------------------------------------------------------------
; VNC Related Clients (Change Ctrl/Hanja to RCtrl for VNC)
;--------------------------------------------------------------------------------
#If (WinActive("ahk_class vwr::CDesktopWin") || WinActive("ahk_class TvnWindowClass") || WinActive("ahk_class vncviewer") || WinActive("ahk_class VNCviewer")) 
;                      tightvnc 1.3.10                         tightvnc 2.x.xx                          tigervnc                             realvnc
SC11D::RCtrl                             ;;;; change Ctrl/Hanja(SC11D) to RCtrl for VNC (RCtrl+MouseL(R)Click move(resize) windows in VNCclient(Linux)
;^!=::WinMove, , ,   -8, 0,  7700, 2160  ;;;; VNC client extend to dual monitor (SAMSUNG 3840x2160 x dual)
;^!=::WinMove, , , -3840, 0, 11520, 2160 ;;;; VNC client extend to dual monitor (SAMSUNG 3840x2160 x triple)
#If
;--------------------------------------------------------------------------------

