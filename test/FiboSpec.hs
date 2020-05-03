--
-- FiboSpec.hs
-- Copyright (C) 2020 Clemens Ager <clemens.ager@gmail.com>
--
-- Distributed under terms of the MIT license.
--

module FiboSpec where


import Test.Hspec
import Test.QuickCheck 
import Fibo

spec :: Spec
spec = fiboSpec

fiboSpec :: Spec
fiboSpec = do
  describe "trivial" $ do
    it "first numbers" $ do
      fibo 0 `shouldBe` 0
      fibo 1 `shouldBe` 1
      fibo 2 `shouldBe` 1
      fibo 3 `shouldBe` 2
      fibo 4 `shouldBe` 3
      fibo 5 `shouldBe` 5
    it "some larger" $ do
      fibo 10 `shouldBe` 55
      fibo 20 `shouldBe` 6765
      fibo 50 `shouldBe` 12586269025 
    it "property series" $ property $
      \x -> x >= 0 ==> (fibo x + fibo (x+1)) == fibo (x+2)
