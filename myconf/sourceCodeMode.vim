" SourceCodeMode.vim
" Author: Wang Hsutung
" Date: 2015/07/24 重构
" Locale: 武汉，国软实验室
" Email: hsu[AT]whu.edu.cn
" 载入源文件模板、括号补全、快速插入常用结构、快速构建程序

let s:timestr = strftime("%Y\\/%m\\/%d")
let s:author = "Wang Hsutung"
let s:locale = "Wuhan, Hubei"
let s:email = "hsu[AT]whu.edu.cn"

let s:headerTemplate= "~/Templates/C头文件.h"
let s:cTemplate = "~/Templates/C源代码.c"
let s:cppTemplate = "~/Templates/C++源代码.cpp"
let s:makeTemplate = "~/Templates/Makefile"
let s:javaTemplate = "~/Templates/Java类样本.java"
let s:htmlTemplate = "~/Templates/HTML文档.html"
let s:shTemplate = "~/Templates/Shell脚本.sh"
let s:pyTemplate = "~/Templates/Python样本.py"
let s:hsTemplate = "~/Templates/Haskell样本.hs"

autocmd BufNewFile *.h,*.hpp call HeaderTemplate()
autocmd BufNewFile *.c,*.cpp,*.sh,*.py,*.html,*akefile,*.java,*.hs call LoadTemplate()
autocmd Filetype c,cpp,sh,python,html,vim,java,cs,haskell call SourceCodeMode()
" 检查可执行文本文档
autocmd BufWritePost * if getline(1) =~ "^#!" | call system("chmod +x " . expand("%")) | let g:runprg="./" . expand("%") | endif

function! SourceCodeMode()
    "inoremap ' ''<Esc>i
    "inoremap " ""<Esc>i
    inoremap <C-Enter> <Esc>A;<CR>
    inoremap <S-Space> <Esc>la

    call QuickBuild()

    if &filetype == "c"
        inoremap ;; <Esc>A;<CR>
        if search('[\"<]cv\.h[\">]', 'n') > 0
            let g:ycm_global_ycm_extra_conf = '~/.vim/myconf/ycm_extra_conf_c_opencv.py'
            let &makeprg = "gcc -g -Wall `pkg-config --libs --cflags opencv` % -o %<"
        else
            let g:ycm_global_ycm_extra_conf = '~/.vim/myconf/ycm_extra_conf_c.py'
            setlocal makeprg=gcc\ -g\ -Wall\ %\ -o\ %<
        endif
        let g:runprg = expand("./%<")
        call QuickInsertion()
    elseif &filetype == "cpp"
        inoremap ;; <Esc>A;<CR>
        if search('[\"<]opencv2/opencv\.hpp[\">]', 'n') > 0
            let &makeprg = "g++ -g -Wall `pkg-config --libs --cflags opencv` % -o %<"
        else
            setlocal makeprg=g++\ -g\ -Wall\ -std=c++11\ %\ -o\ %<
        endif
        let g:runprg = expand("./%<")
        let g:ycm_global_ycm_extra_conf = '~/.vim/myconf/ycm_extra_conf_cpp.py'
        call QuickInsertion()
    elseif &filetype == "java"
        inoremap ;; <Esc>A;<CR>
        setlocal makeprg=javac\ %
        let g:runprg= expand("java %<")
        call QuickInsertion()
    elseif &filetype == "cs"
        inoremap ;; <Esc>A;<CR>
        setlocal makeprg=gmcs\ %
        let g:runprg= expand("./%<.exe")
    elseif &filetype == "html"
        setlocal makeprg=echo\ -n
        let g:runprg = expand("xdg-open %")
    elseif executable("./" . expand("%"))
        setlocal makeprg=echo\ -n
        let g:runprg = "./" . expand("%")
    elseif &filetype == "python"
        setlocal makeprg=echo\ -n
        let g:runprg = expand("python3 %")
    elseif &filetype == "sh"
        setlocal makeprg=bash\ -n\ %
        let g:runprg = expand("bash %")
    elseif &filetype == "haskell"
        setlocal makeprg=ghc\ %\ -o\ %<\ &&\ rm\ -f\ %<.o\ %<.hi
        let g:runprg = expand("./%<")
    endif
    " *.h 是特殊情况，由于默认它被识别为 cpp 文件
    if expand('%:e') == "h" || expand('%:e') == "hpp"
        setlocal makeprg=make
    endif
    if filereadable("Makefile") || filereadable("makefile") || filereadable("GNUmake")
        setlocal makeprg=make
    endif
endfunction

function! LoadTemplate()
    if &filetype == "c" && filereadable(expand(s:cTemplate))
        execute "0r " . s:cTemplate
    elseif &filetype == "cpp" && filereadable(expand(s:cppTemplate))
        execute "0r " . s:cppTemplate
    elseif &filetype == "make" && filereadable(expand(s:makeTemplate))
        execute "0r " . s:makeTemplate
    elseif &filetype == "java" && filereadable(expand(s:javaTemplate))
        execute "0r " . s:javaTemplate
        let l:classname = expand('%:t:r')
        execute "%s/ClassName/" . l:classname . "/g"
    elseif &filetype == "html" && filereadable(expand(s:htmlTemplate))
        execute "0r " . s:htmlTemplate
    elseif &filetype == "sh" && filereadable(expand(s:shTemplate))
        execute "0r " . s:shTemplate
    elseif &filetype == "python" && filereadable(expand(s:pyTemplate))
        execute "0r " . s:pyTemplate
    elseif &filetype == "haskell" && filereadable(expand(s:hsTemplate))
        execute "0r " . s:hsTemplate
    endif
    silent! execute "%s/Author:/Author: " . s:author . "/g"
    silent! execute "%s/Date:/Date: " . s:timestr . "/g"
    silent! execute "%s/Locale:/Locale: " . s:locale . "/g"
    silent! execute "%s/Email:/Email: " . s:email . "/g"
    0
endfunction

function! HeaderTemplate()
    if filereadable(expand(s:headerTemplate))
        execute "0r " . s:headerTemplate
        let l:macroname = toupper(expand('%:t'))
        let l:macroname = tr(l:macroname, ".", "_")
        execute "%s/FILE_H/" . l:macroname . "/g"
        execute "%s/Author:/Author: " . s:author . "/g"
        execute "%s/Date:/Date: " . s:timestr . "/g"
        execute "%s/Locale:/Locale: " . s:locale . "/g"
        execute "%s/Email:/Email: " . s:email . "/g"
    endif
    echo "已载入模板"
endfunction

function! QuickInsertion()
    inoremap \\cl class<Space><Space>{<CR>};<Esc>k^whi
    inoremap \\st struct<Space><Space>{<CR>};<Esc>k^whi
    inoremap \\if if<Space>()<Space>{<CR>}<Esc>k^wa
    inoremap \\ie if<Space>()<Space>{<CR>}<Space>else<Space>{<CR>}<Esc>2k^wa
    inoremap \\ei <Space>else<Space>if<Space>()<Space>{<CR>}<Esc>k^3wa
    inoremap \\el <Space>else<Space>{<CR>}<Esc>O
    inoremap \\fo for<Space>(;;)<Space>{<CR>}<Esc>k^wa
    inoremap \\wh while<Space>()<Space>{<CR>}<Esc>k^wa
    inoremap \\dw do<Space>{<CR>}<Space>while<Space>();<Esc>^2wa
    inoremap \\sw switch<Space>()<Space>{<CR>case<Space>1:<CR>break;
                \<CR>case<Space>2:<CR>break;<CR>default:<CR>}<Esc>6k^wa
endfunction

function! QuickBuild()
    map <F9> :call BuildAndRun()<CR>
    map <F7> :make<CR>
    map <F5> :call RunProgram()<CR>
    inoremap <F9> <esc>:call BuildAndRun()<CR>
    inoremap <F7> <esc>:make<CR>
    inoremap <F5> <esc>:call RunProgram()<CR>
endfunction

function! BuildAndRun()
    let l:err_cnt = 0
    w
    make
    for err in getqflist()
        if err.valid
            let l:err_cnt = l:err_cnt + 1
        endif
    endfor
    if l:err_cnt == 0
        call RunProgram()
    endif
endfunction

function! RunProgram()
    execute "!" . g:runprg
endfunction

command! SetMakeprg call SetMakeprg()
function! SetMakeprg()
    let &makeprg = input("Compile Command --- $ ", &makeprg, "shellcmd")
endfunction

command! SetRunprg call SetRunprg()
function! SetRunprg()
    let g:runprg = input("Run Command --- $ ", g:runprg, "shellcmd")
endfunction

