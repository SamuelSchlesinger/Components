module QuicktermDirectory 
    (
        qtCreateDirectory
      , qtCreateDirectoryIfMissing
      , qtRemoveDirectory
    ) 
where

import Quickterm
import Data.HashMap hiding (map)
import System.Directory

------------------------------------------------------------------------------------------
qtCreateDirectory = Command "mkdir" qtCreateDirectoryf "{<name>}"

qtCreateDirectoryf names _ = mapM_ createDirectory names
------------------------------------------------------------------------------------------
qtCreateDirectoryIfMissing = Command "mkdir?" qtCreateDirectoryIfMissingf "[-p] {<name>}"

qtCreateDirectoryIfMissingf names opts = do
    mapM_ (createDirectoryIfMissing (member "p" opts))  names
------------------------------------------------------------------------------------------
qtRemoveDirectory = Command "rmdir" qtRemoveDirectoryf "[-r] {<name>}"

qtRemoveDirectoryf names opts  = if member "r" opts
    then mapM_ removeDirectoryRecursive names
    else mapM_ removeDirectory names
------------------------------------------------------------------------------------------
