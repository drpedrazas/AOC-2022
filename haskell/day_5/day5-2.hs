import Prelude
import System.IO
import Control.Monad
import Data.List
crates = ["ZPBQMDN","VHDMQZLC","GZFVDRHQ","NFDGH","QFN","TBFZVQD","HSVDZTMQ","QNPFGM","MRWB"]


solution n f t l = rmv n f (apnd n f t l)
                where apnd n1 f1 t1 l1 = [if j == t1 then (take n1 (l1 !! (f1-1))) ++ i else i | (i,j) <- zip l1 [1..]]
                      rmv n1 f1 l1 = [if j == f1 then drop n1 i else i | (i,j) <- zip l1 [1..]]

replace find rep strn | strn == "" = ""
                      | take (length find) strn == find = rep ++ replace find rep (drop (length find) strn)
                      | otherwise = (head strn) : (replace find rep (tail strn))

process_input strn = map (\x-> read x :: Int) (words $ replace "to" " " (replace "from" " " (replace "move" " " strn)))

final inp c | inp == [] = c
            | otherwise = final (drop 3 inp) (solution p1 p2 p3 c)
          where p1 = (take 3 inp) !! 0
                p2 = (take 3 inp) !! 1
                p3 = (take 3 inp) !! 2 

main = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    print $ map (!! 0) (final (process_input contents) (crates))
