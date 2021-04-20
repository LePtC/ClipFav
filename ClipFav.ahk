; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


:*:]d::  ; 需先输入空格，再输入 "]d" 会被立刻替换成日期
FormatTime, CurrentDateTime,, yyyy年M月d日 h:mm tt  ; It will look like 9/1/2005 3:53 PM
SendInput %CurrentDateTime%
return


; ^f1::
; MsgBox 开始粘贴
; InputBox, UserInput, Phone Number, Please enter a phone number., , 640, 480

pface(filename)
{
    Sleep 1
    FileRead, Clipboard, *c %A_ScriptDir%/cache/fav/%filename%.avc
    ClipWait
    Send ^v
    Sleep 1
    return
}

:*:]hmdt::
pface("黑猫点头")
return

:*:]hjbz::
pface("滑稽杯中")
return



