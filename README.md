# Vim 配置备份

#### By Wang Hsutung

欢迎 __喜欢 Vim 的同学__ 与我交流 Vim 使用中的一些小技巧, 亦或是一些非常 awesome 的插件 :-)  

## 安装方法
1. 克隆本配置到本地:
2. 安装 [Vundle](https://github.com/VundleVim/Vundle.vim), 一个 Vim 插件管理器;
3. 下栽 Debian 8 源里已经编译好的 Ycm 插件 (Ubuntu 14.04以后的版本也有)
4. 用 Vim-addon-manager 把 Ycm 链接到 .Vim 目录下
5. 运行 `:PluginInstall` 安装所有插件 (Github 在中国网速慢, 请耐心等待)

各步骤对应命令如下：
```bash
git clone https://github.com/whst/hsu-vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt-get install vim-addon-manager vim-youcompleteme
vam install youcompleteme
vim -c "execute \"PluginInstall\" | qa"
```

## **SourceCodeMode.vim** 简略说明


* 按 `\\if` 可快速插入 `if() {}` 代码块, `\\fo` 插入 `for(;;) {}`. 其他请见 ~/.vim/myconf/sourceCodeMode.vim 源码;
* 快速编译运行:
 1. 按 `<F5>` 编译当前文件. 如果当前目录下有 Makefile, 直接 make, 否则执行类似 `gcc -Wall -g main.cpp -o main` 的命令.
 可以调用 `:call SetMakeprg()` 设置编译程序的命令和参数
 2. 按 `<F7>` 执行对应可执行文件(比如, 在编辑 main.cpp, 则运行 ./main)
 3. 按 `<F9>` 一键编译运行
 可以调用 `:call SetRunprg()` 设置执行可执行的命令和参数
* 要使用模板功能, 请在 ~/Templates/ 下建立类似以下代码的模板文件, 并更改 ~/.vim/myconf/sourceCodeMode.vim 文件中各模板文件的路经变量。以后建立新的 `*.c` 或 `*.cpp` 或 `*.java` 文件时, 会载入模板文件并在 Author, Date, Locale, Email 后加上你设定的值。(Date自动生成)

模板文件示例:
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
