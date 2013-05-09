let s:save_cpo = &cpo
set cpo&vim

let g:helpnew_config = {'command': ''}

function! helpnew#new(subject)
  let help_windows = []
  for n in range(1, winnr('$'))
    let bufnr = winbufnr(n)
    if getbufvar(bufnr, '&buftype') ==# 'help'
      call setbufvar(bufnr, '&buftype', 'nofile')
      call add(help_windows, bufnr)
    endif
  endfor

  execute printf(":%s %s", s:help_command(), a:subject)

  for n in help_windows
    call setbufvar(n, '&buftype', 'help')
  endfor
endfunction

function! s:help_command()
  if has_key(g:helpnew_config, 'command') && !empty(g:helpnew_config.command)
    return g:helpnew_config.command
  endif
  return winwidth(0) * 2 < winheight(0) * 5 ? 'help' : "vertical belowright help"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
