import Prelude
import System.IO
import Control.Monad
import Data.List
crates = ["ZPBQMDN","VHDMQZLC","GZFVDRHQ","NFDGH","QFN","TBFZVQD","HSVDZTMQ","QNPFGM","MRWB"]


solution n f t l | n==1 = movement f t l
                 | otherwise = movement f t (solution (n-1) f t l)
                where movement r t s = rmv r (pnd r t s)
                                    where rmv q w = [if i==q then tail(j) else j | (i,j) <- zip [1..] w]
                                          pnd q h w = [if i==h then (head (w !! (q-1))) : j else j | (i,j) <- zip [1..] w]

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
