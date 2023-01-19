"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>tt :call RunTestFile()<cr>

"" vim-rspec mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>T :call RunNearestSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>
"if filereadable("bin/rspec")
"  let g:rspec_command = ':w|call Send_to_Tmux("\ntime spring rspec {spec}\n")'
"elseif filereadable("tmp/test.txt")
"  let g:rspec_command = ':w|call Send_to_Tmux("\nbundle exec rails test {spec}\n")'
"else
"  let g:rspec_command = ':w|call Send_to_Tmux("\nbundle exec rspec {spec}\n")'
"endif

"function! RunTestFile(...)
"  if a:0
"    let command_suffix = a:1
"  else
"    let command_suffix = ""
"  endif

"  " Run the tests for the previously-marked file.
"  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
"  if in_test_file
"    call SetTestFile()
"  elseif !exists("t:grb_test_file")
"    return
"  end
"  call RunTests(t:grb_test_file . command_suffix)
"endfunction

"function! SetTestFile()
"  " Set the spec file that tests will be run for.
"  let t:grb_test_file=expand("%:p")
"endfunction

"function! RunTests(filename)
"  " Write the file and run tests for the given filename
"  :w
"  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"  if filereadable("tmp/test.txt")
"    exec ':w|call Send_to_Tmux("\ntime spring rails test ' . a:filename . '\n")'
"  elseif filereadable("bin/rspec")
"    exec ":!bin/rspec " . a:filename
"  elseif filereadable("Gemfile")
"    "exec ":!rake rspec " . a:filename
"    exec ":!rspec " . a:filename
"  else
"    exec ":!rspec " . a:filename
"  end
"endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PROMOTE VARIABLE TO RSPEC LET
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>


let g:VimuxOrientation = "h"
let g:VimuxHeight = "50"

let test#strategy='vimux'
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
