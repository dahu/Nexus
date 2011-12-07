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
  let incrementor.value = incrementor.initial_value
  function incrementor.inc() dict
    let self.value += self.step
    return self.value
  endfunction
  function incrementor.val() dict
    return self.value
  endfunction
  function incrementor.next() dict
    return self.inc()
  endfunction
  function incrementor.reset() dict
    let self.value = self.initial_value
    return self.value
  endfunction
  return incrementor
endfunction

" Sequentialise(pattern, step, start)
" pattern: Regex to search for when replacing with increments ('\d\+')
" step: Number by which to increment each time the pattern is matched
" start: Initial number of incrementor
function! Sequentialise(...)
  let inci = Series()
  let pattern = "\\d\\+"
  if a:0 >= 1
    let pattern = a:1  " user-provided pattern
    if a:0 == 2  " start at user-provided number, stepping by 1
      exe "let inci = Series(" . (a:2 - 1) . ", 1)"
    elseif a:0 == 3  " user-provided start and step
      exe "let inci = Series(" . (a:2 - a:3) . ", " . a:3 . ")"
    endif
  endif
  silent! exe "'<,'>s/" . pattern . "/\\=inci.next()/g"
endfunction

let s0 = Series(-1, 1)
let s1 = Series(1)
let inc = Series(1)     " alias for s1
