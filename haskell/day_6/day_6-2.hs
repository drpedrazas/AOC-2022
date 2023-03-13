import Data.List
unique ls | xs  == [] = True
          | x == head xs =False
          | otherwise =unique xs
        where (x:xs) = sort ls

solution ls = prm treated
                where prm (x: xs) = if fst x then (snd x) + 13  else prm xs
                      treated = zip (mapped ls) [1..]
                            where mapped y = [unique (take 14 y)] ++ mapped (tail y)        
