module Main where

import Fibo
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  if length args < 1
     then putStrLn "Needs a number."
     else
      let n = read . head $ args
          fi = fibo n
      in print fi
