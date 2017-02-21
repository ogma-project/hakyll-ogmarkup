{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Hakyll.Ogmarkup
  ( ogmarkupCompile
  ) where

import Text.Ogmarkup
import Hakyll

-- | A Hakyll compiler used to build an output data which is determined by
-- the ogmarkup configuration passed as argument.
ogmarkupCompile :: (GenConf c o)
                => c
                -> Compiler (Item o)
ogmarkupCompile conf = do getResourceBody >>= withItemBody (return . ogmarkup' conf)
    where ogmarkup' = flip $ ogmarkup
