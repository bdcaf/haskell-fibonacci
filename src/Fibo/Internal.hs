module Fibo.Internal
     where
-- use some answers from 
-- https://codereview.stackexchange.com/questions/241541/closed-form-fibonacci-using-integer/241580#241580

import Data.Ratio
import Data.Semigroup

-- use a data type similar to complex numbers. 
-- The only irrational number are multiples of sqrt 5 
-- which will cancel away in the closed form.
-- Turns out this is the Ring Z(sqrt 5) and Field Q(sqrt 5).
data FibNum = FibNum { int::Rational, sq5::Rational }
  deriving (Show)

instance Num FibNum where
  (+) (FibNum a1 b1) (FibNum a2 b2) = FibNum (a1+a2) (b1 + b2)
  (*) (FibNum a1 b1) (FibNum a2 b2) = FibNum intSide rootSide
    where intSide = a1 * a2 + 5 * b1 * b2
          rootSide = a1 * b2 + b1 * a2
  negate (FibNum a b) = FibNum (negate a) (negate b)
  fromInteger n = FibNum (fromInteger n) 0
  -- no need for abs and sign for now
  abs a = a * signum a
  signum (FibNum a b) = if (signum a * a^2) + (5 * signum(b) * b^2) >= 0
                           then 1
                           else (negate 1)

instance Fractional FibNum
  where
    fromRational a = FibNum (fromRational a) 0
    recip (FibNum a b) = FibNum (a/nominator) (negate b/nominator)
      where nominator = a^2 - 5* b^2

conjugate :: FibNum -> FibNum
conjugate (FibNum a b) = FibNum a (negate b)

--  phi and psi are (1 + sqrt 5)/2 and (1 - sqrt 5)/2
phi = (FibNum 1 1) / 2
psi = conjugate phi

-- was originally planning to calculate the binomial coefficients
-- but seeing that I just need n relatively simple multiplications 
-- that seem like unneccesary complication
pow :: FibNum -> Integer -> FibNum
pow x n = getProduct . stimes n $ Product x

