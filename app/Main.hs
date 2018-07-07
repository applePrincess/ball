{-# LANGUAGE Arrows #-}
{-# LANGUAGE RankNTypes #-}
module Main where

-- import Network.WebSockets
import FRP.Yampa

import Player
-- import Unit
-- import Wall
import Unit

data Input
-- type WebsocketPlayer = (Connection, Player)
-- data Maze = Maze [WebsocketPlayer] [Object]
data Maze
main :: IO ()
main = do
  _ <- reactimate initialize sense actuate process
  return ()


initialize :: IO ()
initialize = return ()

sense :: Bool -> IO (DTime, Maybe ())
sense b = undefined

actuate :: Bool -> Maze -> IO Bool
actuate b maze = undefined

process :: SF () Maze
process = undefined
