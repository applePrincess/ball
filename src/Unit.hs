{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}
module Unit where

import FRP.Yampa.Vector3

type Vector = Vector3 Double

type Force        = Vector
type Acceleration = Vector
type Velocity     = Vector
type Position     = Vector
type Time         = Double

class Unit a where
  isCollide :: Unit b => a -> b -> Bool
  default isCollide :: Unit b => a -> b -> Bool
  isCollide a b = ba `overlappedWith` bb
    where ba = boundary a
          bb = boundary b
  defaultUnit :: a
  position :: a -> Position
  addForce :: a -> Force -> a
  boundary :: a -> Boundary
  update :: a -> Time -> a


newtype Boundary = B (Position, Position)

-- | This function assume that the shapes of them are
--  cuboid
overlappedWith :: Boundary -> Boundary -> Bool
overlappedWith (B (bap, bas)) (B (bbp, bbs)) = not $ or
  [ exap > exbe, exae < exbp, eyap > eybe
  , eyae < eybp, ezap > ezbe , ezae < ezbp]
  where (exap, eyap, ezap) = vector3XYZ bap
        (exae, eyae, ezae) = vector3XYZ bas
        (exbp, eybp, ezbp) = vector3XYZ bbp
        (exbe, eybe, ezbe) = vector3XYZ bbs
