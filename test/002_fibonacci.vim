call vimtest#StartTap()
call vimtap#Plan(96) " <== XXX  Keep plan number updated.  XXX

let iv0s1 = Series('nexus#fibonacci')               "  implicit start 0, implicit step 1
let iv0is1 = Series('nexus#fibonacci', 1)           "  implicit start 0, step 1
let iv0is2 = Series('nexus#fibonacci', 2)           "  implicit start 0, step 2
let v0s1 = Series('nexus#fibonacci', 0, 1)          "  start 0, step 1
let v0s2 = Series('nexus#fibonacci', 0, 2)          "  start 0, step 2
let v0s3 = Series('nexus#fibonacci', 0, 3)          "  start 0, step 3
let v1s1 = Series('nexus#fibonacci', 1, 1)          "  start 1, step 1
let v1s2 = Series('nexus#fibonacci', 1, 2)          "  start 1, step 2
let v1s3 = Series('nexus#fibonacci', 1, 3)          "  start 1, step 3
let v3s1 = Series('nexus#fibonacci', 3, 1)          "  start 3, step 1
let v3s2 = Series('nexus#fibonacci', 3, 2)          "  start 3, step 2
let v3s3 = Series('nexus#fibonacci', 3, 3)          "  start 3, step 3

" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(iv0s1.value(), 0, '.value() == initial_value')
call vimtap#Is(iv0s1.next(), 0, '.next() steps correctly')
call vimtap#Is(iv0s1.next(), 1, '.next() steps correctly')
call vimtap#Is(iv0s1.next(), 1, '.next() steps correctly')
call vimtap#Is(iv0s1.next(), 2, '.next() steps correctly')
call vimtap#Is(iv0s1.next(), 3, '.next() steps correctly')
call vimtap#Is(iv0s1.next(), 5, '.next() steps correctly')
call vimtap#Is(iv0s1.next(), 8, '.next() steps correctly')

" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(iv0is1.value(), 0, '.value() == initial_value')
call vimtap#Is(iv0is1.next(), 0, '.next() steps correctly')
call vimtap#Is(iv0is1.next(), 1, '.next() steps correctly')
call vimtap#Is(iv0is1.next(), 1, '.next() steps correctly')
call vimtap#Is(iv0is1.next(), 2, '.next() steps correctly')
call vimtap#Is(iv0is1.next(), 3, '.next() steps correctly')
call vimtap#Is(iv0is1.next(), 5, '.next() steps correctly')
call vimtap#Is(iv0is1.next(), 8, '.next() steps correctly')

" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(iv0is2.value(), 0, '.value() == initial_value')
call vimtap#Is(iv0is2.next(), 0, '.next() steps correctly')
call vimtap#Is(iv0is2.next(), 1, '.next() steps correctly')
call vimtap#Is(iv0is2.next(), 3, '.next() steps correctly')
call vimtap#Is(iv0is2.next(), 8, '.next() steps correctly')
call vimtap#Is(iv0is2.next(), 21, '.next() steps correctly')
call vimtap#Is(iv0is2.next(), 55, '.next() steps correctly')
call vimtap#Is(iv0is2.next(), 144, '.next() steps correctly')

" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v0s1.value(), 0, '.value() == initial_value')
call vimtap#Is(v0s1.next(), 0, '.next() steps correctly')
call vimtap#Is(v0s1.next(), 1, '.next() steps correctly')
call vimtap#Is(v0s1.next(), 1, '.next() steps correctly')
call vimtap#Is(v0s1.next(), 2, '.next() steps correctly')
call vimtap#Is(v0s1.next(), 3, '.next() steps correctly')
call vimtap#Is(v0s1.next(), 5, '.next() steps correctly')
call vimtap#Is(v0s1.next(), 8, '.next() steps correctly')

" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v0s2.value(), 0, '.value() == initial_value')
call vimtap#Is(v0s2.next(), 0, '.next() steps correctly')
call vimtap#Is(v0s2.next(), 1, '.next() steps correctly')
call vimtap#Is(v0s2.next(), 3, '.next() steps correctly')
call vimtap#Is(v0s2.next(), 8, '.next() steps correctly')
call vimtap#Is(v0s2.next(), 21, '.next() steps correctly')
call vimtap#Is(v0s2.next(), 55, '.next() steps correctly')
call vimtap#Is(v0s2.next(), 144, '.next() steps correctly')


" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v0s3.value(), 0, '.value() == initial_value')
call vimtap#Is(v0s3.next(), 0, '.next() steps correctly')
call vimtap#Is(v0s3.next(), 2, '.next() steps correctly')
call vimtap#Is(v0s3.next(), 8, '.next() steps correctly')
call vimtap#Is(v0s3.next(), 34, '.next() steps correctly')
call vimtap#Is(v0s3.next(), 144, '.next() steps correctly')
call vimtap#Is(v0s3.next(), 610, '.next() steps correctly')
call vimtap#Is(v0s3.next(), 2584, '.next() steps correctly')

" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v1s1.value(), 1, '.value() == initial_value')
call vimtap#Is(v1s1.next(), 1, '.next() steps correctly')
call vimtap#Is(v1s1.next(), 1, '.next() steps correctly')
call vimtap#Is(v1s1.next(), 2, '.next() steps correctly')
call vimtap#Is(v1s1.next(), 3, '.next() steps correctly')
call vimtap#Is(v1s1.next(), 5, '.next() steps correctly')
call vimtap#Is(v1s1.next(), 8, '.next() steps correctly')
call vimtap#Is(v1s1.next(), 13, '.next() steps correctly')

" 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v1s2.value(), 1, '.value() == initial_value')
call vimtap#Is(v1s2.next(), 1, '.next() steps correctly')
call vimtap#Is(v1s2.next(), 2, '.next() steps correctly')
call vimtap#Is(v1s2.next(), 5, '.next() steps correctly')
call vimtap#Is(v1s2.next(), 13, '.next() steps correctly')
call vimtap#Is(v1s2.next(), 34, '.next() steps correctly')
call vimtap#Is(v1s2.next(), 89, '.next() steps correctly')
call vimtap#Is(v1s2.next(), 233, '.next() steps correctly')

" " 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v1s3.value(), 1, '.value() == initial_value')
call vimtap#Is(v1s3.next(), 1, '.next() steps correctly')
call vimtap#Is(v1s3.next(), 3, '.next() steps correctly')
call vimtap#Is(v1s3.next(), 13, '.next() steps correctly')
call vimtap#Is(v1s3.next(), 55, '.next() steps correctly')
call vimtap#Is(v1s3.next(), 233, '.next() steps correctly')
call vimtap#Is(v1s3.next(), 987, '.next() steps correctly')
call vimtap#Is(v1s3.next(), 4181, '.next() steps correctly')

" " 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v3s1.value(), 2, '.value() == initial_value')
call vimtap#Is(v3s1.next(), 2, '.next() steps correctly')
call vimtap#Is(v3s1.next(), 3, '.next() steps correctly')
call vimtap#Is(v3s1.next(), 5, '.next() steps correctly')
call vimtap#Is(v3s1.next(), 8, '.next() steps correctly')
call vimtap#Is(v3s1.next(), 13, '.next() steps correctly')
call vimtap#Is(v3s1.next(), 21, '.next() steps correctly')
call vimtap#Is(v3s1.next(), 34, '.next() steps correctly')

" " 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v3s2.value(), 2, '.value() == initial_value')
call vimtap#Is(v3s2.next(), 2, '.next() steps correctly')
call vimtap#Is(v3s2.next(), 5, '.next() steps correctly')
call vimtap#Is(v3s2.next(), 13, '.next() steps correctly')
call vimtap#Is(v3s2.next(), 34, '.next() steps correctly')
call vimtap#Is(v3s2.next(), 89, '.next() steps correctly')
call vimtap#Is(v3s2.next(), 233, '.next() steps correctly')
call vimtap#Is(v3s2.next(), 610, '.next() steps correctly')

" " 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584

call vimtap#Is(v3s3.value(), 2, '.value() == initial_value')
call vimtap#Is(v3s3.next(), 2, '.next() steps correctly')
call vimtap#Is(v3s3.next(), 8, '.next() steps correctly')
call vimtap#Is(v3s3.next(), 34, '.next() steps correctly')
call vimtap#Is(v3s3.next(), 144, '.next() steps correctly')
call vimtap#Is(v3s3.next(), 610, '.next() steps correctly')
call vimtap#Is(v3s3.next(), 2584, '.next() steps correctly')
call vimtap#Is(v3s3.next(), 10946, '.next() steps correctly')

call vimtest#Quit()
