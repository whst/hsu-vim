# Hsu-Vim Configuration

#### By Wang Hsutung

欢迎 __喜欢 Vim 的同学__ 与我交流 Vim 使用中的一些小技巧, 亦或是一些非常棒的插件 :-)  
*P.s.* I've been interested in Emacs recently. But still, I mostly use Vim.

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

* When editing C/C++, Javar, Python source code file, you can press `<F3>` for semantic completion:
![Ycm Completion](https://raw.githubusercontent.com/whst/hsu-vim/master/gitfiles/auto.png) <br>
YouCompleteMe is very powerful. As you can see from the sreenshot above, features in **C++11** such as type deduction are supported.
* Simple code snippet insertions:
 * Press `\\if` to insert `if () {}`
 * Press `\\ie` to insert `if () {} else {}`
 * Press `\\ei` to insert `else if () {}`
 * Press `\\el` to insert `else {}`
 * Press `\\fo` to insert `for (;;) {}`
 * Press `\\wh` to insert `while () {}`
 * Press `\\dw` to insert `do {} while ();`
 * Press `\\cl` to insert `class X{};`
 * Press `\\st` to insert `struct X{};`
* 插入状态下，快速地按两次分号，可在行尾追加「；」并跳转到下一行；
* Fast Build:
 1. 按 `<F5>` 编译当前文件. 如果当前目录下有 Makefile, 直接 make, 否则执行类似 `gcc -Wall -g main.cpp -o main` 的命令.
 可以调用 `:call SetMakeprg()` 设置编译程序的命令和参数
 2. 按 `<F7>` 执行对应可执行文件(比如, 在编辑 main.cpp, 则运行 ./main)
 3. 按 `<F9>` 一键编译运行
 可以调用 `:call SetRunprg()` 设置执行可执行的命令和参数
* Vim 默认剪贴板和系统剪贴板关联；
* 若用 Vim 编辑了没有写权限的文件，比如某些需要 root 权限的系统配置文件，可使用命令 `w!!` 强制写入 (需要输入 Root 密码)；
* 更友好的补全方式：对于在按下 `Tab` 键后补全有歧义的情况，给出所有可能输入的选项列表，不断按下 `Tab` 键可在这些选项中循环。如图：
![Tab Completion](https://raw.githubusercontent.com/whst/hsu-vim/master/gitfiles/tab_completion.png) <br>
* And more to be discovered...
