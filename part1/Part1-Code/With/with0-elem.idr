
data Elem : a -> List a -> Type where
     Here : Elem x (x :: xs)
     There : Elem x xs -> Elem x (y :: xs)

isElem_example : Elem 3 [1..4]

checkElem : (x : a) -> (xs : List a) -> Maybe (Elem x xs)

