import System.IO
import Control.Monad
import Data.List
import Prelude

alphabet = ['a'..'z'] ++ ['A'..'Z']

tail3 l = tail $ tail $ tail l

compare1 x y z = sum [i*j | (i,j) <- zip common [1..]]
              where common = [r*p*t | (r,p,t) <- zip3 lettersx lettersy lettersz]
                           where lettersx = [if elem i x then 1 else 0 | i <- alphabet]
                                 lettersy = [if elem i y then 1 else 0 | i <- alphabet]
                                 lettersz = [if elem i z then 1 else 0 | i <- alphabet]
solution [] = 0
solution l = compare1 x y z + solution (tail3 l)
           where x = tl !! 0
                   where tl = take 3 l
                 y = tl !! 1
                   where tl = take 3 l
                 z = tl !! 2
                   where tl = take 3 l

main = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    print $ solution [i | i <- words contents]
