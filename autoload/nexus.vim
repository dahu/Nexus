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

