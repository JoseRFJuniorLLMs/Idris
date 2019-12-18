
test_list : List (String, Int)
test_list = [("foo", 42), ("bar", 12), ("baz", 6)]

data IsKey : key -> List (key, value) -> Type where
     IsFirst :               IsKey x ((x, val) :: xs)
     IsLater : IsKey x xs -> IsKey x ((y, val) :: xs)

alookup : (x : key) -> (xs : List (key, value)) -> (prf : IsKey x xs) -> value
alookup x ((x, val) :: ys) IsFirst = val
alookup x ((y, val) :: ys) (IsLater prf) = alookup x ys prf

checkKey : DecEq key => 
           (x : key) -> (xs : List (key, value)) -> Maybe (IsKey x xs)
checkKey x [] = Nothing
checkKey x ((y, val) :: xs) with (decEq x y)
  checkKey x ((x, val) :: xs) | (Yes Refl) = Just IsFirst
  checkKey x ((y, val) :: xs) | (No contra) = do p <- checkKey x xs
                                                 Just (IsLater p)

safe_lookup : DecEq key => 
              (x : key) -> (xs : List (key, value)) -> Maybe value
safe_lookup x xs with (checkKey x xs)
  safe_lookup x xs | Nothing = Nothing
  safe_lookup x xs | (Just prf) = Just (alookup x xs prf)


