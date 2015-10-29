# Vim 配置备份

#### By Wang Hsutung

欢迎 __喜欢 Vim 的同学__ 与我交流 Vim 使用中的一些小技巧, 亦或是一些非常棒的插件 :-)  

## 安装方法
<del>1. 克隆本配置到本地:<br></del>
<del>2. 安装 [Vundle](https://github.com/VundleVim/Vundle.vim), 一个 Vim 插件管理器;<br></del>
<del>3. 安装 Debian 8 源里已经编译好的 Ycm 插件 (Ubuntu 14.04 以后的版本也有)<br></del>
<del>4. 用 Vim-addon-manager 把 Ycm 链接到 ~/.vim 目录下<br></del>
<del>5. 运行 `:PluginInstall` 安装所有插件 (Github 在中国网速慢, 请耐心等待)<br></del>
1. 执行 `git clone https://github.com/whst/hsu-vim.git ~/.vim && sh ~/.vim/gitfiles/install.sh`
2. 把 ~/.vim/myconf/sourceCodeMode.vim 中的个人信息改成自己的

## Vim 配置功能说明

* 编辑 C/C++、Java、Python 等文件时，按 `<F3>` 进行语义补全；
![Ycm Completion](https://raw.githubusercontent.com/whst/hsu-vim/master/gitfiles/auto.png) <br>
上图可以看出语义补全**支持 C++11** 的 auto 类型推导。
* 简单的代码片段插入：
 * 按 `\\if` 可快速插入 `if () {}`
 * 按 `\\ie` 可快速插入 `if () {} else {}`
 * 按 `\\ei` 可快速插入 `else if () {}`
 * 按 `\\el` 可快速插入 `else {}`
 * 按 `\\fo` 可快速插入 `for (;;) {}`
 * 按 `\\wh` 可快速插入 `while () {}`
 * 按 `\\dw` 可快速插入 `do {} while ();`
 * 按 `\\cl` 可快速插入 `class X{};`
 * 按 `\\st` 可快速插入 `struct X{};`
* 插入状态下，按两次分号，可在行尾追加分号并跳转到下一行；
* 快速编译运行:
 1. 按 `<F5>` 编译当前文件. 如果当前目录下有 Makefile, 直接 make, 否则执行类似 `gcc -Wall -g main.cpp -o main` 的命令.
 可以调用 `:call SetMakeprg()` 设置编译程序的命令和参数
 2. 按 `<F7>` 执行对应可执行文件(比如, 在编辑 main.cpp, 则运行 ./main)
 3. 按 `<F9>` 一键编译运行
 可以调用 `:call SetRunprg()` 设置执行可执行的命令和参数

* Vim 默认剪贴板和系统剪贴板关联
