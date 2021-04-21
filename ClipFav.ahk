; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.




; 使用 addClipFav.py 来将最新一次复制结果保存为收藏表情
$#f7::
; MsgBox 开始粘贴
InputBox, UserInput, 收藏刚复制的表情, 请输入刚复制表情的中文名, , 320, 240
if ErrorLevel
    ; MsgBox, 你点了取消
    return
else
    Run %ComSpec% /c ""%A_ScriptDir%\plugins\addClipFav.py" %UserInput% > clip.txt"
    ; MsgBox, 新表情已保存为 "%UserInput%"
    Sleep 3500
    Reload
    return





:*:]time::  ; 输入 "]time" 会被立刻替换成日期
FormatTime, CurrentDateTime,, yyyy年M月d日 h:mm tt
SendInput %CurrentDateTime%
return


pface(filename)
{
    Sleep 1
    FileRead, Clipboard, *c %A_ScriptDir%/cache/fav/%filename%.avc
    ClipWait
    Send ^v
    Sleep 1
    return
}


; 猫系列表情包 ---------

:*:]hmdt::
pface("黑猫点头")
return

:*:]mmm::
pface("猫摸摸")
return

:*:]mhq::
pface("猫好奇")
return

:*:]myt::
pface("猫摇头")
return

:*:]mks::
pface("猫苦涩")
return

:*:]mcl::
pface("猫蹭脸")
return

:*:]mzy::
pface("猫左右")
return

:*:]mwt::
pface("猫歪头")
return


; Pusheen The Cat 系列表情包 ---------

:*:]psmm::
pface("噗信摸摸")
return


; 蜜桃猫系列表情包 ---------

:*:]mtdz::
pface("蜜桃点赞")
return

:*:]mtsh::
pface("蜜桃说好")
return

:*:]mthh::
pface("蜜桃哈哈")
return


; 狗系列表情包 ---------

:*:]gsd::
pface("狗闪电")
return

:*:]gcr::
pface("狗蹭人")
return



; 三团系列表情包 ---------

:*:]sthq::
pface("三团哈欠")
return

:*:]stmm::
pface("三团摸猫")
return





; 滑稽系列表情包 ---------

:*:]hjbz::
pface("滑稽杯中")
return



; 企鹅系列表情包 ---------

:*:]qewk::
pface("企鹅捂哭")
return






:*:]jzj::
pface("姐震惊")
return

:*:]jdy::
pface("姐得意")
return

:*:]jsk::
pface("姐思考")
return

:*:]xmyb::
pface("熊猫一棒")
return

:*:]myll::
pface("猫鹰溜了")
return
