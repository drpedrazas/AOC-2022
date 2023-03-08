import System.IO
import Control.Monad
import Data.List
import Prelude

alphabet = ['a'..'z'] ++ ['A'..'Z']

compare1 x y = sum [i*j| (i,j) <- zip common [0..51]]
            where common = [i*j | (i,j) <- zip letters_x letters_y]
                         where letters_x = [if elem i x then 1 else 0 | i <- alphabet]
                               letters_y = [if elem i y then 1 else 0 | i <- alphabet]

split_two x = [[x !! i | i <- [0..half-1] ], [x !! i | i <- [half..total]]]
            where half = div (length x) 2
                  total = half * 2 - 1

solution x = compare1 r p
           where r = (split_two x) !! 0
                 p = (split_two x) !! 1
main = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    print $  sum [solution x + 1 | x<-words contents]

