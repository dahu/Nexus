function! s:generator_arguments(...)
  let args = a:000
  while (type(args) == type([])) && (len(args) == 1) && (type(args[0]) == type([]))
    let args = args[0]
  endwhile
  let start = 0
  let step = 1

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
function! Sequence(...)
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
" By default, Series uses the Sequence() generator.
function! Series(...)
  let incrementor = {}
  let incrementor.initialised = 0

  func incrementor.init(...) dict
    if self.initialised == 0
      let self.initialised = 1
      let self.gen_func = function(get(filter(copy(a:000), 'v:val =~ ''^\h[a-zA-Z0-9#._]*\(()\?\)\?$'''), 0, 'Sequence'))
      let self.args = filter(copy(a:000), 'v:val =~ ''^[-+]\?\d\+$''')[0:1]
      let self.format = get(filter(copy(a:000), 'v:val =~ '':\|%'''), 0, 'x:nexus')
      let self.use_printf = self.format !~# 'x:nexus'
    endif
    call self.reset()
  endfunc

  func incrementor.reset() dict
    let [self.start, self.step] = s:generator_arguments(self.args)
    let self.generator = call(self.gen_func, [self.start, self.step])
    call self.generator.__init(self.args)

    let self.values = []
    let self.index = -1
    call self.next()
  endfunc

  func incrementor.next() dict
    if self.index > -1
      call add(self.values, call(self.generator.inc, [], self.generator))
    else
      call add(self.values, self.start)
    endif
    let self.index += 1
    return self.value()
  endfunc

  func incrementor.value() dict
    return self.use_printf
          \ ? printf(self.format, self.values[self.index])
          \ : eval(substitute(self.format, '\C\<x:nexus\>', 'self.values[self.index]', 'g'))
  endfunc

  call call(incrementor.init, a:000, incrementor)
  return incrementor
endfunction

function! Nexus(...)
  if !exists('s:nexus')
    Nexus
  endif
  return s:nexus.next()
endfunction

command! -nargs=* -bang Nexus
      \ if <bang>1 |
      \   let s:nexus = Series(<f-args>) |
      \ else |
      \   call s:nexus.reset() |
      \ endif

command! NexusReset call s:nexus.reset()


let s0 = Series(-1, 1)
let s1 = Series()
let inc = Series()            " alternate 1-based incrementor
let fib = Series('Fibonacci') " Fibonacci number generator
