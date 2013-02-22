" Default generator - simple linear numeric sequence
" Generators are expected to provide the following interface:
" init([start=0], [step=1]) - to (re)initiialise the generator.
" next() - to generate the next term in the sequence
function! nexus#sequence(...)
  let s = Generator(a:000)

  func s.init() dict
    let self.value = 0
  endfunc

  func s.next() dict
    let self.value += (self.step > 0 ? 1 : -1)
  endfunc

  return s
endfunction

" Sample generator - fibonacci sequence
function! nexus#fibonacci(...)
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

function! nexus#alpha(...)
  let a = Generator(a:000)
  let a.chars = map(range(97, 122), 'nr2char(v:val)')

  func a.init() dict
    let self.value = 'a'
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
