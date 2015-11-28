" Vim global plugin providing generic generators
" Maintainer:	Barry Arthur <barry.arthur@gmail.com>
" 		Israel Chauca F. <israelchauca@gmail.com>
" License:	Vim License (see :help license)
" Location:	plugin/nexus.vim
" Website:	https://github.com/dahu/Nexus
"
" See nexus.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help Nexus

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" if exists("g:loaded_nexus")
"       \ || v:version < 700
"       \ || v:version == 703 && !has('patch338')
"       \ || &compatible
"   let &cpo = s:save_cpo
"   finish
" endif
let g:loaded_nexus = 1
let g:nexus_version = '0.2'

" Private Functions: {{{1

function! s:nexus_init(bang, ...)
  if a:bang == '!'
    call s:nexus.reset()
  else
    let s:nexus = call('Series', a:000)
  endif
endfunction

function! s:nexus_generators(pattern, cmdline, cursor)
  let pattern = (a:pattern == '' ? '.' : a:pattern)
  return filter(sort(keys(s:generators)), "v:val =~ '" . pattern . "'")
endfunction

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

" Public Interface: {{{1

" Generator Interface
let s:generators = get(s:, 'generators', {})
function! Generator(name, ...)
  let g = {}
  let g.name = a:name
  let s:generators[a:name] = g

  func g.__init(...) dict
    let [self.start, self.step] = s:generator_arguments(a:000)
    let self.needs_step_start = 0
    call self.init()  " NOTE: This must set self.value correctly
    if self.needs_step_start
      for x in range(abs(self.start))
        call self.next()
      endfor
    endif
    return self
  endfunc

  func g.inc() dict
    let ret = self.value
    for x in range(abs(self.step))
      call self.next()
    endfor
    return ret
  endfunc

  return g
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
"   Series('nexus#fibonacci')
" creates a standard Fibonacci generator starting at the first term, 0,
" stepping at each .next() method by one term along in the series.
"
" By default, Series uses the nexus#sequence() generator.
function! Series(...)
  let incrementor = {}
  let incrementor.initialised = 0

  func incrementor.init(...) dict
    if self.initialised == 0
      let self.initialised = 1
      let generator_pattern = '^\(\h[a-zA-Z0-9#._]*\)\%(()\?\)\?$'
      try
        let generator = get(map(filter(copy(a:000), 'v:val =~ ''' . generator_pattern . ''''), 'substitute(v:val, generator_pattern, "\\1", "")'), 0, 'nexus#sequence')
        let self.gen_func = function(generator)
      catch /E700/
        echohl Error
        echom 'Series: Error: Invalid generator: ' . generator
        echohl NONE
        return
      endtry
      let self.args = filter(copy(a:000), 'v:val =~ ''^[-+]\?\d\+$''')[0:1]
      let self.format = get(filter(copy(a:000), 'v:val =~ ":\\|%"'), 0, 'x:nexus')
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
    call add(self.values, call(self.generator.inc, [], self.generator))
    let self.index += 1
    return self.value(self.index)
  endfunc

  func incrementor.value(...) dict
    let index = a:0 ? (a:1 - 1) : (self.index - 1)
    while index > self.index
      call self.next()
    endwhile
    let value = (index <= 0 ? self.values[0] : self.values[index])
    return self.use_printf
          \ ? printf(self.format, eval('"' . escape(value, '"') . '"'))
          \ : eval('"' . escape(substitute(self.format, '\C\<x:nexus\>', value, 'g'), '"') . '"')
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

" Convenience function to number a range
function! List(...) range abort
  let magnitude = len((a:lastline - a:firstline) + 1)
  let default_alpha_pattern  = 'x:nexus. '
  let default_number_pattern = '%' . magnitude . 'd. '
  if a:0 && !empty(a:1)
    let args = copy(a:000)
    if empty(filter(copy(args), 'v:val =~ "%"'))
      if ! empty(filter(copy(args), 'v:val =~ "alpha"'))
        call add(args, default_alpha_pattern)
      else
        call add(args, default_number_pattern)
      endif
    endif
    let series = call('Series', args)
  else
    let series = Series(1, 1, default_number_pattern)
  endif
  exe a:firstline . ',' . a:lastline . 's/^/\=series.next()/'
endfunction

" Commands: {{{1

command! -bar -nargs=* -bang -complete=customlist,s:nexus_generators Nexus call s:nexus_init(<q-bang>, <f-args>)
command! -bar -nargs=* NexusGenerators echo join(s:nexus_generators(<q-args>, '', 0))
command! -bar -nargs=0 NexusReset call s:nexus.reset()
command! -bar -nargs=* -range List <line1>,<line2>call List(<f-args>)

" Collect bundled generators for :NexusGenerators and completion within :Nexus command
call nexus#init()

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo
" vim: set sw=2 sts=2 et fdm=marker:
