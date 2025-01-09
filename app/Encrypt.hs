module Encrypt (
  chunk,
  fill
)

import qualified Data.List.Split as DLS

chunk :: [Char] -> [[Char]]
chunk str 
  | length str `mod` 2 == 0    = DLS.divvy 2 2 str
  | otherwise                  = DLS.divvy 2 2 (str ++ "x")
