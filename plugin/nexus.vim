function! s:generator_arguments(...)
  let args = a:000
  while (type(args) == type([])) && (len(args) > 0) && (type(args[0]) == type([]))
    let args = args[0]
  endwhile
  let step = 1
  let start = 0

  let len = len(args)
  if len == 0
    " nothiing
  elseif len == 1
    let step = args[0]
  else " len >= 2
    let start = args[0]
    let step = args[1]
  endif
  return [start, step]
endfunction

" Generator Interface
function! Generator(...)
  let g = {}

  func g.__init(...) dict
    let [self.start, self.step] = s:generator_arguments(a:000)
    let self.value = self.start   " this should be overridden in self.init() if necessary
    let self.index = -1
    call self.init()
    for x in range(abs(self.start))
      call self.next()
    endfor
    let self.index = 0
    return self
  endfunc

  func g.inc() dict
    let ret = self.value
    for x in range(abs(self.step))
      call self.next()
      let self.index += 1
    endfor
    return ret
  endfunc

  return g
endfunction

" Default generator - simple linear numeric sequence
" Generators are expected to provide the following interface:
" init([start=0], [step=1]) - to (re)initiialise the generator.
" next() - to generate the next term in the sequence
function! s:sequence(...)
  let s = Generator(a:000)

  func s.init() dict
    let self.value = self.start
  endfunc

  func s.next() dict
    if self.index == -1
      let self.value = self.start
    else
      let self.value += (self.step > 0 ? 1 : -1)
    endif
  endfunc

  return s
endfunction

" Sample generator - fibonacci sequence
function! Fibonacci(...)
  let f = Generator(a:000)

  func f.init() dict
    let self.value = 0
    let self.b = 1
  endfunc

  func f.next() dict
    let [self.value, self.b] = [self.b, self.value + self.b]
  endfunc

  return f
endfunction

" Series([step=1])
" Series(start, step)
" Series(generator, [step=1])
" Series(generator, [start], [step=1])
"
" By default Series() returns a simple linear generator whose .next() method
" will return the subsequent number in the series from the start-th term.
" If a generator is provided, its .next() method will be used {step} times
" each time the Series object's .next() method is called.
"
" Example:
"
" Given a Fibonacci generator:
"   Series('Fibonacci')
" creates a standard Fibonacci generator starting at the first term, 0,
" stepping at each .next() method by one term along in the series.
"
" By default, Series uses the s:sequence() generator.
function! Series(...)
  let incrementor = {}

  func incrementor.init(...) dict
    let self.args = a:000
    let self.gen_func = 's:sequence'
    if a:0 == 3
      let self.args = a:000[1:-1]
      let self.gen_func = function(a:1)
    endif

    let [start, step] = s:generator_arguments(self.args)
    let self.generator = call(self.gen_func, [start, step])
    call self.generator.__init(self.args)

    let self.values = []
    let self.index = -1
    call self.next()
  endfunc

  func incrementor.next() dict
    call add(self.values, call(self.generator.inc, [], self.generator))
    let self.index += 1
    return self.values[self.index]
  endfunc

  func incrementor.value() dict
    return self.values[self.index]
  endfunc

  call call(incrementor.init, a:000, incrementor)
  return incrementor
endfunction


" " let s0 = Series(-1, 1)
" " let s1 = Series(1)
" " let inc = Series(1)     " alternate 1-based incrementor

" "nnoremap <leader>s0 :call s0.init()<CR>
" "nnoremap <leader>s1 :call s1.init()<CR>
