{-

data (=) : a -> b -> Type where
     Refl : x = x

data Nat = Z | S Nat

-}


my_plus : Nat -> Nat -> Nat
my_plus Z y = y 
my_plus (S k) y = S (my_plus k y)

twoplustwo : my_plus (S (S Z)) (S (S Z)) = (S (S (S (S Z))))
twoplustwo = Refl

my_plus_commutes : (x, y : Nat) -> my_plus x y = my_plus y x


