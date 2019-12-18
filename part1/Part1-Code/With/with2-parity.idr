data Parity : Nat -> Type where
     Even : (j : Nat) -> Parity (j + j)
     Odd  : (j : Nat) -> Parity (S (j + j))

-- definition deferred...
parity : (n : Nat) -> Parity n

-- bits are reversed...
natToBin : (n : Nat) -> List Bool
natToBin Z = []
natToBin k with (parity k)
  natToBin (plus j j) | (Even j) = False :: natToBin j
  natToBin (S (plus j j)) | (Odd j) = True :: natToBin j















---------

parity Z = Even Z
parity (S k) with (parity k)
  parity (S (plus j j))     | (Even j) = Odd j
  parity (S (S (plus j j))) | (Odd j) ?= {parity_odd_lemma} Even (S j)

parity_odd_lemma j value = rewrite plusSuccRightSucc j j in value




