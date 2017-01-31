module Component.Type exposing (Component(..), notEmpty, size, isGoal,
                                moveBoxes)

import Action.Type exposing (updateLocation)
import Matrix exposing (..)

type Component = Box | Floor | Wall | Goal | Player | Empty

size: Float
size = 40

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

moveBoxes: List Location -> Location -> Action.Type.Direction -> List Location
moveBoxes boxes location direction =
    List.map (\l -> if location == l
               then updateLocation l direction
               else l)
        boxes