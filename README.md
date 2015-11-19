# Vim Configuration Backup

#### By Wang Hsutung

欢迎 __喜欢 Vim 的同学__ 与我交流 Vim 使用中的一些小技巧, 亦或是一些非常棒的插件 :-)  

## How to install

Installation procedures and corresponding commands are as follows:
```
#0. Backup your previous Vim configuration.

#1. Clone this repository to ~/.vim directory
git clone https://github.com/whst/hsu-vim.git ~/.vim

#2. Install plugin manager *Vundle*
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#3. Install YouCompleteMe plugin for Vim in repository (Debian >= 8.1, Ubuntu >= 14.04.3)
sudo apt-get install vim-addon-manager vim-youcompleteme && vam install youcompleteme

#4. Install all plugins with Vundle.
# Note: Accessing GitHub in China may be slow. Be patient.
vim -c "execute \"PluginInstall\" | qa"

### Following procedures are OPTIONAL: ###

# Edit personal info in  ~/.vim/myconf/sourceCodeMode.vim
vim ~/.vim/myconf/sourceCodeMode.vim

# execute this command if you input Chinese with fcitx
sed -i "s/set timeoutlen=150/set timeoutlen=1000/g" ~/.vim/bundle/fcitx-status/plugin/fcitx.vim
```

## Features

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
