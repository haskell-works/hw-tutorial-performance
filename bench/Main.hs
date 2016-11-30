{-# LANGUAGE BangPatterns #-}

module Main where

import           Criterion.Main
import qualified Data.List            as DL
import qualified Data.Vector.Unboxed  as DVU

data Pair = Pair !Int !Double

total :: Double
total = 1e7

calculateA :: Double -> Double
calculateA d = meanA [1..d]

meanA :: [Double] -> Double
meanA xs = sum xs / fromIntegral (length xs)

calculateB :: Double -> Double
calculateB d = meanB [1..d]

meanB :: [Double] -> Double
meanB xs = s / fromIntegral (n :: Integer)
  where
    (n, s)     = DL.foldl' k (0, 0) xs
    k (m, t) x = (m + 1, t + x)

calculateC :: Double -> Double
calculateC d = meanC [1..d]

meanC :: [Double] -> Double
meanC xs = s / fromIntegral (n :: Integer)
  where
    (n, s)     = DL.foldl' k (0, 0) xs
    k (!m, !t) x = (m + 1, t + x)

calculateD :: Double -> Double
calculateD d = meanD [1..d]

meanD :: [Double] -> Double
meanD xs = s / fromIntegral n
  where
    Pair n s        = DL.foldl' k (Pair 0 0) xs
    k (Pair m t) x  = Pair (m + 1) (t + x)

calculateE :: Double -> Double
calculateE d = meanE (DVU.enumFromTo 1 d)

meanE :: DVU.Vector Double -> Double
meanE xs = s / fromIntegral (n :: Int)
  where
    Pair n s       = DVU.foldl k (Pair 0 0) xs
    k (Pair m t) x = Pair (m + 1) (t + x)
{-# INLINE meanE #-}

benchMains :: [Benchmark]
benchMains =
  [ bench "calculateA" (whnf calculateA 1e7)
  , bench "calculateB" (whnf calculateB 1e7)
  , bench "calculateC" (whnf calculateC 1e7)
  , bench "calculateD" (whnf calculateD 1e7)
  , bench "calculateE" (whnf calculateE 1e7)
  ]

main :: IO ()
main = defaultMain benchMains
