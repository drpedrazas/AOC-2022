import System.IO
import Control.Monad
import Data.List
import Prelude
replace [] _ _ = []
replace s find repl =
    if take (length find) s == find
        then repl ++ (replace (drop (length find) s) find repl)
        else [head s] ++ (replace (tail s) find repl)
wordsWhen p s = case dropWhile p s of
                          "" -> []
                          s' -> w : wordsWhen p s''
                                where (w, s'') = break p s'
main = do
      print "Hello, Haskell!"
      let list = []
      handle <- openFile "input" ReadMode
      contents <- hGetContents handle
      print $ sum $ take 3 (reverse (sort (map (sum) (map (f) (map (words) (wordsWhen (=='q') (replace contents "\n\n" "q")))))))
           
f :: [String] -> [Int]
f = map read

