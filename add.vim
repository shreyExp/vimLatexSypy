nnoremap \nn :call Parser() <CR>
"nnoremap \cc :call CommentMe() <CR>
nnoremap \cc <esc>0i#<esc><C-I>
"nnoremap \ss :call Smaller() <CR>
nnoremap \ss :call LatexMe()<CR>

function! Parser()
"py3 print("hello")
py3 << EOF
from sympy import latex, solve, symbols
import vim
#print("hello")
print("cello")
#vim.current.line = "Hey, There"
EOF
endfunction

function! Comment()
py3 << EOF
import vim
vim.current.line = "#" + vim.current.line
EOF
endfunction

function! Smaller()
py3 << EOF
import vim
vim.current.line = vim.current.line.lower()
EOF
endfunction

function! MakeFunc()
py3 << EOF
import vim
vim.current.line = doSomething(vim.current.line)
EOF
endfunction

function! LatexMe()
py3 << EOF
import vim
from sympy import *
from sympy.parsing.sympy_parser import parse_expr as pe
Int = Integral
#x, y, z = symbols('x, y, z')
#a = ""
#to_ex = "a = " + vim.current.line
#exec(to_ex)
a = pe(vim.current.line)
print(vim.current.line)
vim.current.line = "$ " + latex(a) + " $"
EOF
endfunction
