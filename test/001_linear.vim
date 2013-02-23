call vimtest#StartTap()
call vimtap#Plan(42) " <== XXX  Keep plan number updated.  XXX

let vi0si1 = Series()          "  value implicitly 0, step implicitly 1
let vi0se1 = Series(1)         "  value implicitly 0, step explicitly 1
let ve0se1 = Series(0, 1)      "  value explicitly 0, step explicitly 1
let ve1se1 = Series(1, 1)      "  value explicitly 1, step explicitly 1
let ve1se2 = Series(1, 2)      "  value explicitly 1, step explicitly 2
let ve2se2 = Series(2, 2)      "  value explicitly 2, step explicitly 2
let ve0se_2 = Series(0, -2)    "  value explicitly 0, step explicitly -2
let ve_1se1 = Series(-1, 1)    "  value explicitly -1, step explicitly 1
let ve1se_1 = Series(1, -1)    "  value explicitly 1, step explicitly -1
let ve_2se_2 = Series(-2, -2)  "  value explicitly -2, step explicitly -2

call vimtap#Is(vi0si1.value(), 0, '.value() == initial_value')
call vimtap#Is(vi0si1.next(), 0, '.next() steps correctly')
call vimtap#Is(vi0si1.next(), 1, '.next() steps correctly')

call vimtap#Is(vi0se1.value(), 0, '.value() == initial_value')
call vimtap#Is(vi0se1.next(), 0, '.next() steps correctly')
call vimtap#Is(vi0se1.next(), 1, '.next() steps correctly')

call vimtap#Is(ve0se1.value(), 0, '.value() == initial_value')
call vimtap#Is(ve0se1.next(), 0, '.next() steps correctly')
call vimtap#Is(ve0se1.next(), 1, '.next() steps correctly')

call vimtap#Is(ve1se1.value(), 1, '.value() == initial_value')
call vimtap#Is(ve1se1.next(), 1, '.next() steps correctly')
call vimtap#Is(ve1se1.next(), 2, '.next() steps correctly')

call vimtap#Is(ve1se2.value(), 1, '.value() == initial_value')
call vimtap#Is(ve1se2.next(), 1, '.next() steps correctly')
call vimtap#Is(ve1se2.next(), 3, '.next() steps correctly')
call vimtap#Is(ve1se2.next(), 5, '.next() steps correctly')
call vimtap#Is(ve1se2.value(), 5, '.value() == initial_value')

call vimtap#Is(ve2se2.value(), 2, '.value() == initial_value')
call vimtap#Is(ve2se2.next(), 2, '.next() steps correctly')
call vimtap#Is(ve2se2.next(), 4, '.next() steps correctly')
call vimtap#Is(ve2se2.next(), 6, '.next() steps correctly')
call vimtap#Is(ve2se2.value(), 6, '.value() == initial_value')

call vimtap#Is(ve0se_2.value(), 0, '.value() == initial_value')
call vimtap#Is(ve0se_2.next(), 0, '.next() steps correctly')
call vimtap#Is(ve0se_2.next(), -2, '.next() steps correctly')
call vimtap#Is(ve0se_2.next(), -4, '.next() steps correctly')
call vimtap#Is(ve0se_2.value(), -4, '.value() == initial_value')

call vimtap#Is(ve_1se1.value(), -1, '.value() == initial_value')
call vimtap#Is(ve_1se1.next(), -1, '.next() steps correctly')
call vimtap#Is(ve_1se1.next(), 0, '.next() steps correctly')
call vimtap#Is(ve_1se1.next(), 1, '.next() steps correctly')
call vimtap#Is(ve_1se1.value(), 1, '.value() == initial_value')

call vimtap#Is(ve1se_1.value(), 1, '.value() == initial_value')
call vimtap#Is(ve1se_1.next(), 1, '.next() steps correctly')
call vimtap#Is(ve1se_1.next(), 0, '.next() steps correctly')
call vimtap#Is(ve1se_1.next(), -1, '.next() steps correctly')
call vimtap#Is(ve1se_1.value(), -1, '.value() == initial_value')

call vimtap#Is(ve_2se_2.value(), -2, '.value() == initial_value')
call vimtap#Is(ve_2se_2.next(), -2, '.next() steps correctly')
call vimtap#Is(ve_2se_2.next(), -4, '.next() steps correctly')
call vimtap#Is(ve_2se_2.next(), -6, '.next() steps correctly')
call vimtap#Is(ve_2se_2.value(), -6, '.value() == initial_value')

call vimtest#Quit()
