{-# LANGUAGE Arrows #-}
module Main where

import FRP.Yampa

data Input
data Maze

main :: IO ()
main = do
  _ <- reactimate initialize sense actuate process
  return ()


initialize :: IO [Input]
initialize = return []

sense :: Bool -> IO (DTime, Maybe [Input])
sense b = undefined

actuate :: Bool -> Maze -> IO Bool
actuate b maze = undefined

process :: SF [Input] Maze
process = undefined

{-
eactimate :: IO a                          -- init
           -> (Bool -> IO (DTime, Maybe a)) -- input/sense
           -> (Bool -> b -> IO Bool)        -- output/actuate
           -> SF a b                        -- process/signal function
           -> IO ()
-}
