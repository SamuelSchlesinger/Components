module JonSnow (jonSnow) where

import Quickterm
import System.Environment

jonSnow :: Quickterm

jonSnow = Command "jonsnow" qtJonSnow ""

qtJonSnow ("Jon":"Snow":_) _ = putStrLn "You know nothing, Jon Snow"
qtJonSnow _ _ = putStrLn "Foff off m8"
