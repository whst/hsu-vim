# Vim 配置备份

####By Wang Hsutung

欢迎__喜欢 Vim 的同学__与我交流 Vim 使用中的一些小技巧, 亦或是一些非常 awesome 的插件.  
我不反对用 IDE, 事实上我承认 Vim/Emacs 的局限性很大。而且我也从来不说服已经在使用其他工具的人转到 Vim 上来。
因此请不要说服我_放弃使用编辑器_或对 Vim 使用者进行言语攻击.

## 安装方法

* 使用 Vundle 进行插件管理, 请先安装 Vundle. 请参照 [Vundle 主页](https://github.com/VundleVim/Vundle.vim);
* 克隆本 Vim 配置到本地后, 请运行 `:PluginInstall` 安装所有插件 (Github 在中国网速慢, 请耐心等待);
* Ycm 插件改用 Debian 8.1 源里已经编译好的 (Ubuntu 14.04以后的版本也有)
    具体步骤:
    1. `$ sudo apt-get install vim-addon-manager vim-youcompleteme`
    2. `$ vam install youcompleteme`

## 以下是对我自己写的功能的简略说明, 插件使用方法请参照各插件主页的 README 说明


* 按 `\\if` 可快速插入 `if() {}` 代码块, `\\fo` 插入 `for(;;) {}`. 其他请见 ~/.vim/myconf/sourceCodeMode.vim 源码;
* 快速编译运行:
 1. 按 `<F5>` 编译当前文件. 如果当前目录下有 Makefile, 直接 make, 否则执行类似 `gcc -Wall -g main.cpp -o main` 的命令.
 可以调用 `:call SetMakeprg()` 设置编译程序的命令和参数
 2. 按 `<F7>` 执行对应可执行文件(比如, 在编辑 main.cpp, 则运行 ./main)
 3. 按 `<F9>` 一键编译运行
 可以调用 `:call SetRunprg()` 设置执行可执行的命令和参数
* 要使用模板功能, 请在 ~/Templates/ 下建立类似一下代码的模板文件, 并更改 ~/.vim/myconf/sourceCodeMode.vim 文件中各模板文件的路经变量。以后建立新的 `*.c` 或 `*.cpp` 或 `*.java` 文件时, 会载入模板文件并在 Author, Date, Locale, Email 后加上你设定的值。(Date自动生成)

```C
/*
 * Author:
 * Date:
 * Locale:
 * Email:
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    printf("Hello, world!\n");
    exit(EXIT_SUCCESS);
}
```
