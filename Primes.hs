module Primes (qtPrimes) where

import OpenTheory.Natural.Prime
import Quickterm
import qualified Data.HashMap as HM
import System.Environment

qtPrimes = Command "prime" qtPrimesf "[--N <N-primes>]"

qtPrimesf args options = do
    case "N" `HM.lookup` options of
        Just (n:_) -> mapM_ (putStr . (++ " ") . show) (take (read n) primes) >> putStr "\n"
        Nothing -> putStr (usage qtPrimes)

