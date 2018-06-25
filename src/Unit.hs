{-# LANGUAGE DefaultSignatures #-}
module Unit where

type Force = Vector
type Acceleration = Vector
type Velocity = Vector
type Position = Vector

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

-- | Vector component of x, y, z axes.
newtype Vector = V (Double, Double, Double)
               deriving (Eq, Show)

ex, ey, ez :: Vector -> Double
ex (V (x,_,_)) = x
ey (V (_,y,_)) = y
ez (V (_,_,z)) = z

instance Num Vector where
  V (a, b, c) + V (d, e, f) = V (a + d, b + e, c + f)
  V (a, b, c) * V (d, e, f) = V (a * d, b * e, c * f)
  negate (V (a, b, c))  = V (-a, -b, -c)
  fromInteger a = V (a', a', a')
    where a' = fromIntegral a
  abs (V (a, b, c)) = V (abs a, abs b, abs c)
  signum (V (a, b, c)) = V (signum a, signum b, signum c)

-- | dot product
(⋅) :: Vector -> Vector -> Double
V (a, b, c) ⋅ V (d, e, f) = a * d + b * e + c * f

-- | Element-wise division
(÷) :: Vector -> Double -> Vector
V (a, b, c) ÷ n = V (a/n, b/n, c/n)

-- | Element-wise multiplication
(×) :: Vector -> Double -> Vector
(V (a, b, c)) × n = V (a*n, b*n, c*n)

newtype Boundary = B (Position, Position)

-- | This function assume that the shapes of them are
--  cuboid
overlappedWith :: Boundary -> Boundary -> Bool
overlappedWith (B (bap, bas)) (B (bbp, bbs)) = not $ or [ ex bap > ex bbe
                                                        , ex bae < ex bbp
                                                        , ey bap > ey bbe
                                                        , ey bae < ey bbp
                                                        , ez bap > ez bbe
                                                        , ez bae < ez bbp]
  where bae = bap + bas
        bbe = bbp + bbs
