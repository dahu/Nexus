function! Series(...)
  let incrementor = {}
  let incrementor.initial_value = 0
  let incrementor.step = 1
  if a:0 == 1
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

let s0 = Series(-1, 1)
let s1 = Series(1)
let inc = Series(1)
