""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>; :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>tt :call RunTestFile()<cr>
" map <leader>tT :call RunNearestTest()<cr>
" map <leader>ta :call RunAllTest()<cr>
" map <leader>tA :call RunAllTestWithStopWatch()<cr>
" map <leader>tf :call RunLastFailure()<cr>

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>T :call RunNearestSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = ':w|call Send_to_Tmux("time spring rspec {spec}\n")'

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunAllTest()
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if filereadable("bin/test")
    exec ":!bin/rake test"
  elseif filereadable("bin/test5")
    exec ":!rails test"
  elseif filereadable("zeus.json")
    exec ":!zeus rspec --color -I spec/spec_helper.rb spec/"
  elseif filereadable("bin/rspec")
    " exec ":!bin/rspec --color -I spec/rails_helper.rb spec/ --tag ~js"
    exec ":!bin/rspec --color -I spec/rails_helper.rb spec/"
  elseif filereadable("Gemfile")
    " exec ":!rspec --color -I spec/rails_helper.rb spec/ --tag ~js"
    exec ":!rspec --color -I spec/rails_helper.rb spec/"
  else
    " exec ":!rspec --color -I spec/rails_helper.rb spec/ --tag ~js"
    exec ":!rspec --color -I spec/rails_helper.rb spec/"
  endif
endfunction

function! RunAllTestWithStopWatch()
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  exec ":!rspec --color -I spec/rails_helper.rb spec/ --format DurationFormatter"
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if filereadable("bin/test")
    exec ":!m " . a:filename
  elseif filereadable("bin/test5")
    exec ":!rails test" . a:filename
  elseif filereadable("zeus.json")
    exec ":!zeus rspec " . a:filename
  elseif filereadable("bin/rspec")
    exec ":!bin/rspec " . a:filename
  elseif filereadable("Gemfile")
    "exec ":!rake rspec " . a:filename
    exec ":!rspec " . a:filename
  else
    exec ":!rspec " . a:filename
  end
endfunction

function! RunLastFailure()
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  exec('!bin/rspec --next-failure')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" using VIM with crontab
:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup
:endif
