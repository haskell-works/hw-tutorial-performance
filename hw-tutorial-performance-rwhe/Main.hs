module Main (main) where

import System.Environment
import Text.Printf
import qualified Data.Vector.Unboxed as DVU

main :: IO ()
main = do
    [d] <- map read `fmap` getArgs
    printf "%f\n" (mean (DVU.enumFromTo 1 d))

mean :: DVU.Vector Double -> Double
mean xs = s / fromIntegral (n :: Int)
  where
    Pair n s       = DVU.foldl k (Pair 0 0) xs
    k (Pair m t) x = Pair (m + 1) (t + x)
{-# INLINE mean #-}

data Pair = Pair !Int !Double
