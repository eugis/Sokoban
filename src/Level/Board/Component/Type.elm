module Component.Type exposing (Component(..), notEmpty, size, isGoal)

type Component = Box | Floor | Wall | Goal | Player | Empty

size: Float
size = 30

isMovable: Component -> Bool
isMovable component =
  case component of
    Box -> True
    Player -> True
    otherwise -> False

isOccupable: Component -> Bool
isOccupable component =
  case component of
    Floor -> True
    Goal -> True
    otherwise -> False

notEmpty: Component -> Bool
notEmpty component =
  case component of
    Empty -> False
    otherwise -> True

isGoal: Component -> Bool
isGoal component =
  case component of
    Goal -> True
    otherwise -> False
