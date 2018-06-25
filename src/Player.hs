module Player where

import Unit

-- In this game all player is a ball.
data Player = Player
            { acceleration :: Acceleration
            , position :: Position
            , velocity :: Velocity
            , radius :: Double
            , mass :: Double
            } deriving (Eq, Show)

initialRadius = 10
initialMass   = 1

instance Unit Player where
  defaultUnit = Player (V (0, 0, 0)) (V (0, 0, 0)) (V (0, 0, 0)) initialRadius initialMass
  position a = Player.position a
  boundary a = B (Player.position a, V (r, r, r))
    where r = radius a
  addForce pl f = pl { acceleration = let f' = f ÷ (mass pl) in acceleration pl + f'}
  update pl dt = pl
                 { velocity = velocity pl + acceleration pl × dt
                 , Player.position = Player.position pl + velocity pl × dt
                 }
