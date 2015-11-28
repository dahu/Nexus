call vimtest#StartTap()
call vimtap#Plan(103) " <== XXX  Keep plan number updated.  XXX

let iv0s1  = Series('nexus#alpha')       " implicit start 0, implicit step 1
let iv0is1 = Series('nexus#alpha', 1)    " implicit start 0, step 1
let iv0is2 = Series('nexus#alpha', 2)    " implicit start 0, step 2
let v0s0   = Series('nexus#alpha', 0, 0) " start 0, step 1
let v0s1   = Series('nexus#alpha', 0, 1) " start 0, step 1
let v0s2   = Series('nexus#alpha', 0, 2) " start 0, step 2
let v0s3   = Series('nexus#alpha', 0, 3) " start 0, step 3
let v1s1   = Series('nexus#alpha', 1, 1) " start 1, step 1
let v1s2   = Series('nexus#alpha', 1, 2) " start 1, step 2
let v1s3   = Series('nexus#alpha', 1, 3) " start 1, step 3
let v3s1   = Series('nexus#alpha', 3, 1) " start 3, step 1
let v3s2   = Series('nexus#alpha', 3, 2) " start 3, step 2
let v3s3   = Series('nexus#alpha', 3, 3) " start 3, step 3

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(iv0s1.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(iv0s1.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'b' , 'b' , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'd' , 'd' , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'f' , 'f' , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'g' , 'g' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(iv0is1.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(iv0is1.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'b' , 'b' , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'd' , 'd' , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'f' , 'f' , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'g' , 'g' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(iv0is2.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(iv0is2.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'i' , 'i' , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'k' , 'k' , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'm' , 'm' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v0s1.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(v0s1.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'b' , 'b' , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'd' , 'd' , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'f' , 'f' , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'g' , 'g' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v0s2.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(v0s2.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'i' , 'i' , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'k' , 'k' , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'm' , 'm' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v0s3.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(v0s3.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'd' , 'd' , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'j' , 'j' , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'm' , 'm' , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'p' , 'p' , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 's' , 's' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v1s1.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(v1s1.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'b' , 'b' , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'd' , 'd' , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'f' , 'f' , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'h' , 'h' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v1s2.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(v1s2.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'i' , 'i' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'k' , 'k' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'm' , 'm' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'o' , 'o' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v1s3.value() , 'a' , 'a' , '.value() == initial_value')
call vimtap#Is(v1s3.next()  , 'a' , 'a' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'd' , 'd' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'j' , 'j' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'm' , 'm' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'p' , 'p' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 's' , 's' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'v' , 'v' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v3s1.value() , 'c' , 'c' , '.value() == initial_value')
call vimtap#Is(v3s1.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'd' , 'd' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'f' , 'f' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'h' , 'h' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'i' , 'i' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'j' , 'j' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v3s2.value() , 'c' , 'c' , '.value() == initial_value')
call vimtap#Is(v3s2.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'e' , 'e' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'g' , 'g' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'i' , 'i' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'k' , 'k' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'm' , 'm' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'o' , 'o' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'q' , 'q' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v3s3.value() , 'c' , 'c' , '.value() == initial_value')
call vimtap#Is(v3s3.next()  , 'c' , 'c' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'f' , 'f' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'i' , 'i' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'l' , 'l' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'o' , 'o' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'r' , 'r' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'u' , 'u' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'x' , 'x' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'aa' , 'aa' , '.next() steps correctly')

call vimtest#Quit()
