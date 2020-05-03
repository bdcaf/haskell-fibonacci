module Fibo
    ( 
     fibo
    ) where

-- use a data type similar to complex numbers. 
-- The only irrational number are multiples of sqrt 5 
-- which will cancel away in the closed form.
data FibNum = FibNum { int::Integer, sq5::Integer }
  deriving (Show)

instance Num FibNum where
  (+) (FibNum a1 b1) (FibNum a2 b2) = FibNum (a1+a2) (b1 + b2)
  (*) (FibNum a1 b1) (FibNum a2 b2) = FibNum intSide rootSide
    where intSide = a1*a2 + 5 * b1 * b2
          rootSide = a1*b2 + b1*a2
  negate (FibNum a b) = FibNum (negate a) (negate b)
  fromInteger n = FibNum (fromInteger n) 0
  -- no need for abs and sign for now
  abs _ = undefined
  signum _ = undefined

funit = FibNum 1 0
-- actual phi and psi are (1 + sqrt 5)/2 and (1 - sqrt 5)/2
-- I would prefer to avoid fractions so I divide at the end
fphi = FibNum 1 1
fpsi = FibNum 1 (negate 1)

-- was originally planning to calculate the binomial coefficients
-- but seeing that I just need n relatively simple multiplications 
-- that seem like unneccesary complication
pow :: FibNum -> Integer -> FibNum
pow _ 0 = funit
pow x 1 = x
pow x n = x * pow x (n-1)

-- in the closed form the integer part is always 0
divR5 :: FibNum -> Integer
divR5 (FibNum 0 n) = n
divR5 _ = error "non zero integer part"

fibo :: Integer -> Integer
fibo n = flip div p2  $ divR5 nom
  where nom = pow fphi n - pow fpsi n
        p2 = 2^n
