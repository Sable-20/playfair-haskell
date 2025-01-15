module Encrypt (
  chunk,
  fill
) where

import qualified Data.List.Split as DLS

chunk :: [Char] -> [[Char]]
chunk str 
  | length str `mod` 2 == 0    = DLS.divvy 2 2 str
  | otherwise                  = DLS.divvy 2 2 (str ++ "x")

fill :: [Char] -> [Char]
fill str
  | even (length str)   = fillEven' str 0
  | otherwise           = fillOdd' str 0

fillEven' :: [Char] -> Int -> [Char]
fillEven' str pos
    | pos >= length str     = str
    | otherwise             =
        let (a, b) = splitAt (pos + 1) str 
        in if str !! pos == str !! (pos + 1)
            then fill (a ++ "x" ++ drop 0 b)
            else fillEven' str (pos + 2)
            
fillOdd' :: [Char] -> Int -> [Char]
fillOdd' str pos
    | pos >= length str - 1     = str
    | otherwise                 =
        let (a, b) = splitAt (pos + 1) str 
        in if str !! pos == str !! (pos + 1)
            then fill (a ++ "x" ++ drop 0 b)
            else fillOdd' str (pos + 2)