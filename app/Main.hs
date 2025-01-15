module Main where

import Encrypt

main :: IO ()
main = do
  print (Encrypt.chunk $ Encrypt.fill "better")
