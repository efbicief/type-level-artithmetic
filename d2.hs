{-# LANGUAGE MultiParamTypeClasses,
FunctionalDependencies,
FlexibleInstances,
UndecidableInstances
#-}

-- Define some type-level numbers (inductively)
-- Today, we are mathematicians

data Z -- Zero
data S n -- Successor of some other number

-- What is:
-- :type undefined::Z
-- :type undefined::(S Z)

