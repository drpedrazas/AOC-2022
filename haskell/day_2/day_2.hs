import System.IO
import Control.Monad
import Data.List
import Prelude
match p1 p2 = case p2 of
                  'X' -> case p1 of {('A')-> 4; ('B') -> 1; ('C') -> 7}
                  'Y' -> case p1 of {('A') -> 8; ('B') -> 5; ('C') -> 2}
                  'Z' -> case p1 of {('A') -> 3; ('B') -> 9; ('C') -> 6}
total [] = 0
total (x:xs) = match x (head xs) + total (tail xs)
main = do
      handle <- openFile "input" ReadMode
      contents <- hGetContents handle
      print $ total (map (!! 0) (words contents))
                      
