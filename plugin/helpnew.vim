if exists('g:loaded_helpnew') && g:loaded_helpnew
  finish
endif
let g:loaded_helpnew = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=* -complete=help HelpNew call helpnew#new(<q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
