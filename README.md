
# ClipFav mod for Clipjump by LePtC

Clipjump 是一个很好用的 AHK 脚本，能够记录剪贴板历史并方便地做粘贴，如果你复制的是一个表情（包括动图），它也能记录下动图，并往 QQ、微信、word 等软件里无障碍地粘贴。

我一直想要一个能跨软件地粘贴表情包的工具，所以我研究了 Clipjump 记忆和粘贴表情包的原理，然后在它上面加了个 plugin，使得我能通过打出表情的名字来快速粘贴出表情包。


## 安装方法

对于没用过 AHK 的新人：

先安装或解压缩 AHK 软件，启动 `AutoHotKeyU64.exe`，令它成为 `.ahk` 文件的默认打开程序

- 为了方便群友，我在压缩包里打包了 `AutoHotkey_1.1.33.06` 版本程序
- 想学习 AHK 的话可以读官方说明书 `AutoHotkey.chm` 也在压缩包里

再启动 `Clipjump-master/Clipjump_x64.ahk`

- 原项目地址：[aviaryan/Clipjump](https://github.com/aviaryan/Clipjump)
- 原作者很多年没更新了，我是在一个最新 fork 的基础上加的我的 mod：[sobuj53/Clipjump](https://github.com/sobuj53/Clipjump)

此时 Clipjump 应该可以用了，它的使用说明见 `Clipjump.chm` 教程

启动后 `Clipjump-master/` 目录下会生成 `cache/` 文件夹

- 在 `cache/` 下面新建 `fav/` 文件夹
- 开着 ClipJump，遇到想保存的表情，就复制它
- 然后你会发现 `cache/clips/` 目录下多了一个 `.avc` 文件，把它复制到 `fav` 目录下
- 在 `plugin/ClipFav.ahk` 里按照下面的模版添加你想触发这个表情的快捷键（我是用右中括号作命令开头）
- 在托盘区的 Clipjump 上右键重启即可使用，使用方法就是依次打出 `]hmdt`，AHK 就会自动把它替换成黑猫点头表情

```
:*:]hmdt::
pface("黑猫点头")
return
```


## 如何更新

如果 `.avc` 文件都准备好了的话，`ClipFav.ahk` 可以单独运行，单独更新这个文件就可以了。

但是添加用户想要的表情依赖于 .avc 文件的制作，所以在我这个项目的 release 里，我暂时是把 ClipFav.ahk 作为 plugin include 到 Clipjump 主程序里使用的。

- TODO：也许将来可以做个更方便的收藏表情的功能
- P.S. 我也试过 ClipFav.ahk 和 Clipjump.ahk 作为两个独立的脚本挂着，发现 `Send ^v` 有概率发生冲突，试图把两个脚本的快捷键区分成左Ctrl和右Ctrl也未能成功。所以最后试了下作为 plugin 嵌入，倒是不用做任何事就解决了冲突的问题…

如果以后 Clipjump 项目更新，只需在更新后的 `Clipjump.ahk` 代码最后加上这个：

```
#include %A_ScriptDir%\plugins\ClipFav.ahk  ; LePtC mod
```

如果有大佬有更好的方案欢迎 share \_(:з」∠)\_


## 日志

- 20210420 initial commit v0.1
    - 将 `ClipFav.ahk` include 到 `Clipjump.ahk` 里，实现已保存的表情可通过`】`开头的表情简称粘贴出来

- 20210421
    - 用 `addClipFav.py` 实现自动化地保存刚复制的表情并重启 `Clipjump.ahk`
    - 局限性：并不是每次复制表情包后 clips 文件夹下就能出现正确的表情包 avc 文件，需要人看着该目录有没有复制成功体积够大的表情文件




