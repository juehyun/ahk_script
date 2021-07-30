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
; Move/Resize Windows using Mouse (as like Linux)
;--------------------------------------------------------------------------------
#Enter::   moveResizeWindow(1, 0) ;;;; Move windows
+#Enter::  moveResizeWindow(0, 1) ;;;; Resize windows
#LButton:: moveResizeWindow(1, 0) ;;;; Move windows (mouse)
#RButton:: moveResizeWindow(0, 1) ;;;; Resize windows (mouse)
;--------------------------------------------------------------------------------

;--------------------------------------------------------------------------------
; Mouse Gesture
;--------------------------------------------------------------------------------
RButton:: mouseGestureWithRButton() ;;;; Mouse Gesture with RButton, double RButton click, RButton Swipe Up/Dn/Left/Right, both LButton+RButton click
;--------------------------------------------------------------------------------

