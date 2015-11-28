call vimtest#StartTap()
call vimtap#Plan(103) " <== XXX  Keep plan number updated.  XXX

let iv0s1  = Series('nexus#roman')       " implicit start 0, implicit step 1
let iv0is1 = Series('nexus#roman', 1)    " implicit start 0, step 1
let iv0is2 = Series('nexus#roman', 2)    " implicit start 0, step 2
let v0s0   = Series('nexus#roman', 0, 0) " start 0, step 1
let v0s1   = Series('nexus#roman', 0, 1) " start 0, step 1
let v0s2   = Series('nexus#roman', 0, 2) " start 0, step 2
let v0s3   = Series('nexus#roman', 0, 3) " start 0, step 3
let v1s1   = Series('nexus#roman', 1, 1) " start 1, step 1
let v1s2   = Series('nexus#roman', 1, 2) " start 1, step 2
let v1s3   = Series('nexus#roman', 1, 3) " start 1, step 3
let v3s1   = Series('nexus#roman', 3, 1) " start 3, step 1
let v3s2   = Series('nexus#roman', 3, 2) " start 3, step 2
let v3s3   = Series('nexus#roman', 3, 3) " start 3, step 3

" I II III IV V VI VII VIII IX X XI XII XIII XIV XV XVI XVII XVIII XIX XX XXI XXII XXIII XXIV XXV XXVI

call vimtap#Is(iv0s1.value() , 'I'   , 'I'   , '.value() == initial_value')
call vimtap#Is(iv0s1.next()  , 'I'   , 'I'   , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'II'  , 'II'  , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'III' , 'III' , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'IV'  , 'IV'  , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'V'   , 'V'   , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'VI'  , 'VI'  , '.next() steps correctly')
call vimtap#Is(iv0s1.next()  , 'VII' , 'VII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(iv0is1.value() , 'I'   , 'I'   , '.value() == initial_value')
call vimtap#Is(iv0is1.next()  , 'I'   , 'I'   , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'II'  , 'II'  , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'III' , 'III' , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'IV'  , 'IV'  , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'V'   , 'V'   , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'VI'  , 'VI'  , '.next() steps correctly')
call vimtap#Is(iv0is1.next()  , 'VII' , 'VII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(iv0is2.value() , 'I'    , 'I'    , '.value() == initial_value')
call vimtap#Is(iv0is2.next()  , 'I'    , 'I'    , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'III'  , 'III'  , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'V'    , 'V'    , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'IX'   , 'IX'   , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'XI'   , 'XI'   , '.next() steps correctly')
call vimtap#Is(iv0is2.next()  , 'XIII' , 'XIII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v0s1.value() , 'I'   , 'I'   , '.value() == initial_value')
call vimtap#Is(v0s1.next()  , 'I'   , 'I'   , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'II'  , 'II'  , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'III' , 'III' , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'IV'  , 'IV'  , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'V'   , 'V'   , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'VI'  , 'VI'  , '.next() steps correctly')
call vimtap#Is(v0s1.next()  , 'VII' , 'VII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v0s2.value() , 'I'    , 'I'    , '.value() == initial_value')
call vimtap#Is(v0s2.next()  , 'I'    , 'I'    , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'III'  , 'III'  , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'V'    , 'V'    , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'IX'   , 'IX'   , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'XI'   , 'XI'   , '.next() steps correctly')
call vimtap#Is(v0s2.next()  , 'XIII' , 'XIII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v0s3.value() , 'I'    , 'I'    , '.value() == initial_value')
call vimtap#Is(v0s3.next()  , 'I'    , 'I'    , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'IV'   , 'IV'   , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'X'    , 'X'    , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'XIII' , 'XIII' , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'XVI'  , 'XVI'  , '.next() steps correctly')
call vimtap#Is(v0s3.next()  , 'XIX'  , 'XIX'  , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v1s1.value() , 'I'    , 'I'    , '.value() == initial_value')
call vimtap#Is(v1s1.next()  , 'I'    , 'I'    , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'II'   , 'II'   , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'III'  , 'III'  , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'IV'   , 'IV'   , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'V'    , 'V'    , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'VI'   , 'VI'   , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(v1s1.next()  , 'VIII' , 'VIII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v1s2.value() , 'I'    , 'I'    , '.value() == initial_value')
call vimtap#Is(v1s2.next()  , 'I'    , 'I'    , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'III'  , 'III'  , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'V'    , 'V'    , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'IX'   , 'IX'   , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'XI'   , 'XI'   , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'XIII' , 'XIII' , '.next() steps correctly')
call vimtap#Is(v1s2.next()  , 'XV'   , 'XV'   , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v1s3.value() , 'I'    , 'I'    , '.value() == initial_value')
call vimtap#Is(v1s3.next()  , 'I'    , 'I'    , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'IV'   , 'IV'   , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'X'    , 'X'    , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'XIII' , 'XIII' , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'XVI'  , 'XVI'  , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'XIX'  , 'XIX'  , '.next() steps correctly')
call vimtap#Is(v1s3.next()  , 'XXII' , 'XXII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v3s1.value() , 'III'  , 'III'  , '.value() == initial_value')
call vimtap#Is(v3s1.next()  , 'III'  , 'III'  , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'IV'   , 'IV'   , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'V'    , 'V'    , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'VI'   , 'VI'   , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'VIII' , 'VIII' , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'IX'   , 'IX'   , '.next() steps correctly')
call vimtap#Is(v3s1.next()  , 'X'    , 'X'    , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v3s2.value() , 'III'  , 'III'  , '.value() == initial_value')
call vimtap#Is(v3s2.next()  , 'III'  , 'III'  , '.value() == initial_value')
call vimtap#Is(v3s2.next()  , 'V'    , 'V'    , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'VII'  , 'VII'  , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'IX'   , 'IX'   , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'XI'   , 'XI'   , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'XIII' , 'XIII' , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'XV'   , 'XV'   , '.next() steps correctly')
call vimtap#Is(v3s2.next()  , 'XVII' , 'XVII' , '.next() steps correctly')

" a b c d e f g h i j k l m n o p q r s t u v w x y z

call vimtap#Is(v3s3.value() , 'III'   , 'III'   , '.value() == initial_value')
call vimtap#Is(v3s3.next()  , 'III'   , 'III'   , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'VI'    , 'VI'    , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'IX'    , 'IX'    , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'XII'   , 'XII'   , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'XV'    , 'XIII'  , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'XVIII' , 'XVIII' , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'XXI'   , 'XXI'   , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'XXIV'  , 'XXIV'  , '.next() steps correctly')
call vimtap#Is(v3s3.next()  , 'XXVII' , 'XXVII' , '.next() steps correctly')

call vimtest#Quit()
