call vimtest#StartTap()
call vimtap#Plan(20) " <== XXX  Keep plan number updated.  XXX

let s1_1 = Series('%d,')
let s1_2 = Series('"%d,"')
let s2_1 = Series('x:nexus,')
let s2_2 = Series('"x:nexus,"')

call vimtap#Is(s1_1.value(), '0,', '.value() == initial_value')
call vimtap#Is(s1_1.next(),  '0,', '.next() steps correctly')
call vimtap#Is(s1_1.next(),  '1,', '.next() steps correctly')
call vimtap#Is(s1_1.next(),  '2,', '.next() steps correctly')
call vimtap#Is(s1_1.next(),  '3,', '.next() steps correctly')

call vimtap#Is(s1_2.value(), '"0,"', '.value() == initial_value')
call vimtap#Is(s1_2.next(),  '"0,"', '.next() steps correctly')
call vimtap#Is(s1_2.next(),  '"1,"', '.next() steps correctly')
call vimtap#Is(s1_2.next(),  '"2,"', '.next() steps correctly')
call vimtap#Is(s1_2.next(),  '"3,"', '.next() steps correctly')

call vimtap#Is(s2_1.value(), '0,', '.value() == initial_value')
call vimtap#Is(s2_1.next(),  '0,', '.next() steps correctly')
call vimtap#Is(s2_1.next(),  '1,', '.next() steps correctly')
call vimtap#Is(s2_1.next(),  '2,', '.next() steps correctly')
call vimtap#Is(s2_1.next(),  '3,', '.next() steps correctly')

call vimtap#Is(s2_2.value(), '"0,"', '.value() == initial_value')
call vimtap#Is(s2_2.next(),  '"0,"', '.next() steps correctly')
call vimtap#Is(s2_2.next(),  '"1,"', '.next() steps correctly')
call vimtap#Is(s2_2.next(),  '"2,"', '.next() steps correctly')
call vimtap#Is(s2_2.next(),  '"3,"', '.next() steps correctly')

call vimtest#Quit()
