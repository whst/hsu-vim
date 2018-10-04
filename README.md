# My Vim Configuration

## How to install

Installation procedures and corresponding commands are as follows:
```
# 0. Backup your previous Vim configuration.

# 1. Clone this repository to ~/.vim directory
git clone https://github.com/whst/hsu-vim.git ~/.vim

# 2. Install vim-plug (a plugin manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 4. Install all plugins with Vundle.
# Note: Accessing GitHub in China may be slow. Be patient.
vim -c "execute \"PlugInstall\" | qa"
```

## Features

* Press `<F3>` for **semantic completion** when editing C/C++, Java, Python source code files:
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
* Press `;` twice in INERT mode, an semicolon will be appended to the end of current line, and the cursor will jump to a new line;
* Fast Build:
 1. Press `<F5>` to compile. The command to execute for compilation is such that: When there's a Makefile in work directory, execute `make`, otherwise execute `gcc -Wall -g main.c -o main`;
    P.s.
    * You may manually set custom command by `:SetMakeprg`;
    * `<F5>` key will not save the file for you, you have to do it manually.
 2. Press `<F7>` will run corresponding executable file. Say you're editing test.cpp, then ./test will be run; If it's test.sh, then `sh test.py` will be run. To set the way to run execrable file, call `:SetRunprg`;
 3. Press `<F9>` to save file and build. If no errors or warnings are encountered, run the program.
* Bind Vim's clipboard to the system's clipboard;
* If you mistakenly edited a file that is not writable, use `:w!!` force to write (Root password required).
* More friendly command completion: For ambiguous prefix, list all possible options. To switch between then, press `Tab` successively.
![Tab Completion](https://raw.githubusercontent.com/whst/hsu-vim/master/gitfiles/tab_completion.png) <br>
* And more to be discovered...
