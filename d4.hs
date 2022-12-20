{-# LANGUAGE MultiParamTypeClasses,
FunctionalDependencies,
FlexibleInstances,
UndecidableInstances
#-}

import Prelude hiding (succ, add)

-- Define some type-level numbers (inductively)
data Z -- Zero
data S n -- Successor of some other number

-- Add two numbers together (inductively)
-- myAdd :: Int -> Int -> Int
class Add i1 i2 i | i1 i2 -> i, i1 i -> i2 

-- Implement our "function"
-- Base case: 0 + n = n
-- myAdd 0 m = m
instance Add Z i2 i2 

-- Inductive case: (S n) + m = S (n + m)
-- myAdd n m = mySucc ( myAdd (n-1) m )
instance (Add i1 i2 i) => Add (S i1) i2 (S i)
-- Note: The value of i is derived by the "recursive call"

-- Tie our "function" to a value so it can be type-checked
add :: Add i1 i2 i => i1 -> i2 -> i
add = const undefined

-- What is:
-- :type add (undefined::Z) (undefined::S Z)
-- :type add (undefined::S Z) (undefined::S Z)
-- :type add (undefined::S Z) (undefined::S (S Z))
