" ycm_simple_conf - ycm_simple_conf.vim

" Created by Thomas Da Costa <tdc.input@gmail.com>

" Copyright (C) 2014 Thomas Da Costa

" This software is provided 'as-is', without any express or implied
" warranty.  In no event will the authors be held liable for any damages
" arising from the use of this software.

" Permission is granted to anyone to use this software for any purpose,
" including commercial applications, and to alter it and redistribute it
" freely, subject to the following restrictions:

" 1. The origin of this software must not be misrepresented; you must not
"    claim that you wrote the original software. If you use this software
"    in a product, an acknowledgment in the product documentation would be
"    appreciated but is not required.
" 2. Altered source versions must be plainly marked as such, and must not be
"    misrepresented as being the original software.
" 3. This notice may not be removed or altered from any source distribution.

function! s:set_ycm_simple_conf_abs_script()
    if !has("python") && !has("python3")
        return
    endif
    python << EOF
import vim
import os
try:
    ret = ''
    main_dir = vim.eval('s:ycm_simple_conf_dir')
    script_dir = vim.eval('s:ycm_simple_conf_script_dir')
    script = vim.eval('s:ycm_simple_conf_script')
    ret = os.path.join(main_dir, os.path.join(script_dir, script))
except Exception as e:
    pass
vim.command('let s:ycm_simple_conf_abs_script = \"' + ret + '\"')
EOF
endfunction

let g:ycm_simple_conf_active =
      \ get(g:, "g:ycm_simple_conf_active", 1)

let s:ycm_simple_conf_dir = expand("<sfile>:p:h:h")
let s:ycm_simple_conf_script_dir = "python"
let s:ycm_simple_conf_script= "ycm_simple_conf.py"

if g:ycm_simple_conf_active
    call s:set_ycm_simple_conf_abs_script()
    if exists("s:ycm_simple_conf_abs_script")
        let g:ycm_global_ycm_extra_conf = s:ycm_simple_conf_abs_script
    endif
endif
