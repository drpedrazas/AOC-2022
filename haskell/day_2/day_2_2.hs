import System.IO
import Control.Monad
import Data.List
import Prelude

match p1 p2 = case p1 of
                  'A' -> case p2 of {('X')-> 3; ('Y')-> 4; ('Z')->8}
                  'B' -> case p2 of {('X')-> 1; ('Y')-> 5; ('Z')->9}
                  'C' -> case p2 of {('X')-> 2; ('Y')-> 6; ('Z')-> 7}
total [] = 0
total (x:xs) = match x (head xs) + total (tail xs)

main = do
      handle <- openFile "input" ReadMode
      contents <- hGetContents handle
      print $ total (map (!!0) (words contents))
