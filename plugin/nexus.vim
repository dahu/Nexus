function! Series(...)
  let incrementor = {}
  let incrementor.initial_value = 0
  let incrementor.step = 1
  if a:0 == 0
    " nothing
  elseif a:0 == 1
    let incrementor.step = a:1
  else " a:0 == 2
    let incrementor.initial_value = a:1
    let incrementor.step = a:2
  endif
  let incrementor.rvalue = incrementor.initial_value
  function incrementor.inc() dict
    let self.rvalue += self.step
    return self.rvalue
  endfunction
  function incrementor.val() dict
    return self.rvalue
  endfunction
  function incrementor.value() dict
    return self.val()
  endfunction
  function incrementor.next() dict
    return self.inc()
  endfunction
  function incrementor.reset() dict
    let self.rvalue = self.initial_value
    return self.rvalue
  endfunction
  function incrementor.set(newval) dict
    let self.rvalue = a:newval
    return self.rvalue
  endfunction
  return incrementor
endfunction

" Sequentialise([pattern], [step], [start], [callback])
" pattern: Regex to search for when replacing with increments (default: '\d\+')
" start: Initial number of incrementor
" step: Number by which to increment each time the pattern is matched
function! Sequentialise(...) range
  let inci = Series()
  let callback = ''
  let pattern = '\d\+'
  if a:0 >= 1
    if (a:0 == 1) && type(a:1) == type([])
      let pattern = a:1[0]  " user-provided pattern
      if len(a:1) == 2  " start at user-provided number, stepping by 1
        exe "let inci = Series(" . (a:1[1] - 1) . ", 1)"
      elseif len(a:1) >= 3  " user-provided start and step
        exe "let inci = Series(" . (a:1[1] - a:1[2]) . ", " . a:1[2] . ")"
        if len(a:1) == 4
          let callback = a:1[3]
        endif
      endif
    else
      let pattern = a:1  " user-provided pattern
      if a:0 == 2  " start at user-provided number, stepping by 1
        exe "let inci = Series(" . (a:2 - 1) . ", 1)"
      elseif a:0 >= 3  " user-provided start and step
        exe "let inci = Series(" . (a:2 - a:3) . ", " . a:3 . ")"
        if a:0 == 4
          let callback = a:4
        endif
      endif
    endif
  endif

  if callback == ''
    silent! exe a:firstline . ',' . a:lastline . "s/" . pattern . "/\\=inci.next()/g"
  else
    let curline = a:firstline
    for line in getline(a:firstline, a:lastline)
      let result = call(callback, [line, inci.next()])
      call setline(curline, substitute(line, pattern, result, ''))
      let curline += 1
    endfor
  endif
endfunction

" List(count, [start], [step])
" count:   Number of list items
" [start]: Initial number of incrementor
" [step]:  Number by which to increment each time the pattern is matched
function! List(cnt, ...)
  let arglist = copy(a:000)
  call insert(arglist, '\d\+', 0)
  exe "normal! " . a:cnt . "O1"
  exe "'[,'] call Sequentialise(arglist)"
  normal `[
endfunction

let s0 = Series(-1, 1)
let s1 = Series(1)
let inc = Series(1)     " alternate 1-based incrementor

"nnoremap <leader>s0 :call s0.reset()<CR>
"nnoremap <leader>s1 :call s1.reset()<CR>
