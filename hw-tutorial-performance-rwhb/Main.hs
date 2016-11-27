{-# LANGUAGE BangPatterns #-}

module Main where

import Data.List
import System.Environment
import Text.Printf

main :: IO ()
main = do
    [d] <- map read `fmap` getArgs
    printf "%f\n" (mean [1..d])

-- foldl' :: (a -> b -> a) -> a -> [b] -> a
-- foldl' f = lgo
--     where lgo z []     = z
--           lgo z (x:xs) = let z' = f z x in z' `seq` lgo z' xs

mean :: [Double] -> Double
mean xs = s / fromIntegral n
  where
    (!n, !s)     = foldl' k (0, 0) xs
    k (!n, !s) x = (n + 1, s + x)
