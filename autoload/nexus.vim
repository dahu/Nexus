" Vim library providing generic generators
" Maintainer:	Barry Arthur <barry.arthur@gmail.com>
" 		Israel Chauca F. <israelchauca@gmail.com>
" License:	Vim License (see :help license)
" Location:	autoload/nexus.vim
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

" if exists("g:loaded_lib_nexus")
"       \ || v:version < 700
"       \ || v:version == 703 && !has('patch338')
"       \ || &compatible
"   let &cpo = s:save_cpo
"   finish
" endif
let g:loaded_lib_nexus = 1

" Private Functions: {{{1


" Library Interface: {{{1

" Default generator - simple linear numeric sequence
" Generators are expected to provide the following interface:
" init([start=0], [step=1]) - to (re)initiialise the generator.
"   If the generator needs to be stepped to the correct starting value from an
"   initial fixed point, then add:
"     let self.needs_step_start = 1
"   to the init() method
" next() - to generate the next term in the sequence
function! nexus#sequence(...)
  let s = Generator('nexus#sequence', a:000)

  func s.init() dict
    let self.value = self.start
  endfunc

  func s.next() dict
    let self.value += (self.step > 0 ? 1 : -1)
  endfunc

  return s
endfunction

" Sample generator - fibonacci sequence
function! nexus#fibonacci(...)
  let f = Generator('nexus#fibonacci', a:000)

  func f.init() dict
    let self.needs_step_start = 1
    let self.start = self.start > 0 ? (self.start - 1) : 0
    let self.value = 0
    let self.b = 1
  endfunc

  func f.next() dict
    let [self.value, self.b] = [self.b, self.value + self.b]
  endfunc

  return f
endfunction

function! nexus#alpha(...)
  let a = Generator('nexus#alpha', a:000)
  let a.chars = map(range(97, 122), 'nr2char(v:val)')

  func a.init() dict
    let self.needs_step_start = 1
    let self.start = self.start > 0 ? self.start : 1
    let self.value = nr2char(char2nr('a') - 1)
  endfunc

  func a.next() dict
    let chars = split(self.value, '\zs')
    let i = 0
    let carry = 1
    while carry
      let i += 1
      if len(chars) < i
        call add(chars, 'a')
        break
      endif
      let carry = chars[-i] == 'z' ? 1 : 0
      let chars[-i] = get(self.chars, index(self.chars, chars[-i]) + 1, 'a')
    endwhile
    let self.value = join(chars, '')
  endfunc

  return a
endfunction

function! nexus#roman(...)
  let r = Generator('nexus#roman', a:000)
  let r.arabic = [1000, 900, 500, 400, 100, 90, 50,  40,  10,  9,  5,   4,  1 ]
  let r.roman  = ["M", "CM", "D","CD", "C","XC","L","XL","X","IX","V","IV","I"]

  func r.init() dict
    let self.needs_step_start = 1
    let self.value = 'I'
    let self.n = 1
    let self.start = self.start > 0 ? (self.start - 1) : 0
  endfunc

  func r.a2r(arabic)
    let arabic = a:arabic
    let roman = ''
    for i in range(0, 12)
      while arabic >= self.arabic[i]
        let roman .= self.roman[i]
        let arabic -= self.arabic[i]
      endwhile
    endfor
    return roman
  endfunc

  func r.next() dict
    let self.n += 1
    let self.value = self.a2r(self.n)
  endfunc

  return r
endfunction

function! nexus#init()
  redir => fs
  silent func
  redir END
  for f in filter(filter(map(split(fs, "\n"), 'matchstr(v:val, "^function\\s*\\zs.\\{-}\\ze(")'), 'v:val =~ "nexus#"'), 'v:val != "nexus#init"')
    call call(f, [])
  endfor
endfunction

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
