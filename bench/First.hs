--
-- First.hs
-- Copyright (C) 2020 Clemens Ager <clemens.ager@gmail.com>
--
-- Distributed under terms of the MIT license.
--

module Main where

import Fibo
import Criterion.Main

-- see http://www.serpentine.com/criterion/tutorial.html
main = defaultMain [
  bgroup "fib" [ bench "1"  $ whnf fibo 1
               , bench "111" $ whnf fibo 111
               , bench "11111" $ whnf fibo 11111
               ]
  ] 
