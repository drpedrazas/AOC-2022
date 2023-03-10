import Data.List
import System.IO
import Control.Monad
import Prelude
tail4 x = tail $ tail $ tail $ tail x
solution p | length p < 4 = 0
           | length p > 4 = solution (take 4 p) + solution (tail4 p)
           | length  p == 4 = if ((x1 <= y2) && (x1 >= x2)) || ((y1 <= y2) && (y1 >= x2)) || ((x2 >= x1) && (y2 <= y1) )then 1 else 0
                              where x1 = p !! 0
                                    y1 = p !! 1
                                    x2 = p !! 2
                                    y2 = p !! 3 
main = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    print $  solution (map (\x -> read x :: Int) (words [if i /= '-' && i /= ',' then i else ' ' | i <- contents]))
