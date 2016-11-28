{-# LANGUAGE BangPatterns #-}

module Main where

import Data.List
import System.Environment
import Text.Printf

main :: IO ()
main = do
    [d] <- map read `fmap` getArgs
    printf "%f\n" (mean [1..d])

mean :: [Double] -> Double
mean xs = s / fromIntegral (n :: Integer)
  where
    (n, s)     = foldl' k (0, 0) xs
    k (!m, !t) x = (m + 1, t + x)
