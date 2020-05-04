module Fibo
    ( 
     fibo
    ) where

import Fibo.Internal
import Data.Ratio

-- in the closed form the integer part is always 0
quickDivS5 :: FibNum -> Rational
quickDivS5 (FibNum 0 n) = n
quickDivS5 _ = error "non zero integer part"

fibo :: Integer -> Integer
fibo n = if denominator answ == 1
            then numerator answ
            else error "answer should always be integral"
  where nom = pow phi n - pow psi n
        answ = quickDivS5 nom
