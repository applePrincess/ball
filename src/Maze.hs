{-# LANGUAGE RankNTypes #-}
module Maze where

import Data.Array

import Unit

data Maze = Maze
          { size :: Position
          , map :: forall a. (Unit a) => Array (Int, Int) [a]
          }
