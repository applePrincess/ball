module Wall where

import Unit

data Wall = Wall
          { position :: Position
          , size :: Position
          }

defaultSize = 10

instance Unit Wall where
  position = Wall.position
  boundary w = B (Wall.position w, Wall.size w)
  addForce w _ = w
  defaultUnit = Wall (V (0, 0, 0)) $ unitVector × defaultSize
  update w _ = w -- for now, it does not affect any thing.
