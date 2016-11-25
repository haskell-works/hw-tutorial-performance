module Main where

import System.Environment
import Text.Printf

main :: IO ()
main = do
    [d] <- map read `fmap` getArgs
    printf "%f\n" (mean [1..d])

mean :: [Double] -> Double
mean xs = sum xs / fromIntegral (length xs)
