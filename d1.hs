-- Usual Haskell program:
-- Get the successor of a number
mySucc :: Num a => a -> a
mySucc n = n + 1

-- Add two numbers together (inductively)
myAdd :: Int -> Int -> Int
myAdd 0 m = m
myAdd n m = mySucc ( myAdd (n-1) m )

{- Call stack:
  myAdd 3 3 =
    mySucc (myAdd 2 3) =
      mySucc (mySucc (myAdd 1 3)) =
        mySucc (mySucc (mySucc (myAdd 0 3))) =
        mySucc (mySucc (mySucc 3)) =
      mySucc (mySucc 4) =
    mySucc 5 =
  6
-}