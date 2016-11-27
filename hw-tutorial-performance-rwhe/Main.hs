--{-# LANGUAGE BangPatterns #-}

module Main where

import System.Environment
import Text.Printf
import qualified Data.Vector.Unboxed as DVU

main = do
    [d] <- map read `fmap` getArgs
    printf "%f\n" (mean (DVU.enumFromTo 1 d))

data Pair = Pair !Int !Double

mean :: DVU.Vector Double -> Double
mean xs = s / fromIntegral n
  where
    Pair n s       = DVU.foldl k (Pair 0 0) xs
    k (Pair n s) x = Pair (n + 1) (s + x)
{-# INLINE mean #-}
