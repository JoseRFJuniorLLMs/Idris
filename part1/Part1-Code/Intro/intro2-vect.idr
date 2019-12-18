{-
data Nat = Z | S Nat

plus : Nat -> Nat -> Nat
plus Z y = y 
plus (S x) y = S (plus x y)
-}

data Vect : Nat -> Type -> Type where
     Nil  : Vect Z a
     (::) : a -> Vect k a -> Vect (S k) a

%name Vect xs, ys, zs

append : Vect n a -> Vect m a -> Vect (n + m) a

zipWith : (a -> b -> c) -> Vect n a -> Vect n b -> Vect n c

transpose_vec : Vect n (Vect m a) -> Vect m (Vect n a)






------- A main program to read dimensions, generate and tranpose a vector

instance Functor (Vect m) where
    map m [] = []
    map m (x :: xs) = m x :: map m xs

instance Show a => Show (Vect m a) where
    show x = show (toList x)
      where
        toList : Vect m a -> List a
        toList [] = []
        toList (y :: xs) = y :: toList xs

countTo : (m : Nat) -> Vect m Int
countTo Z = []
countTo (S k) = 0 :: map (+1) (countTo k)

mkVect : (n, m : Nat) -> Vect n (Vect m Int)
mkVect Z m = []
mkVect (S k) m = countTo m :: map (map (+ cast m)) (mkVect k m)

main : IO ()
main = do putStr "Rows: "
          let r : Nat = cast (cast {to=Int} !getLine)
          putStr "Columns: "
          let c : Nat = cast (cast {to=Int} !getLine)
          printLn (mkVect r c)
          putStrLn "Transposed:"
          printLn (transpose_vec (mkVect r c))
