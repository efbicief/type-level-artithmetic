{-# LANGUAGE MultiParamTypeClasses,
FunctionalDependencies,
FlexibleInstances,
UndecidableInstances
#-}

import Prelude hiding (succ)

-- Define some type-level numbers (inductively)
data Z -- Zero
data S n -- Successor of some other number

-- Define a succ "function"
-- mySucc :: Int -> Int
class Succ i1 i | i1 -> i 

-- Implement our "function" inductively
-- mySucc n = n + 1

-- Base case: succ 0
instance Succ Z (S Z)

-- Inductive case: succ S n
instance Succ (S x) (S (S x))

-- Tie our "function" to a value so it can be type-checked
succ :: Succ i1 i => i1 -> i
succ = const undefined

-- What is:
-- :type succ (undefined::Z)
-- :type succ (succ (undefined::(S Z)))
