module Component.Type exposing (Component(..), notEmpty, size, isGoal,
                                moveBoxes, isOccupable, isBox, component)

import Action.Type exposing (updateLocation)
import Matrix exposing (..)

type Component = Box Bool | Floor | Wall | Goal | Player | Empty

size: Float
size = 35

isMovable: Component -> Bool
isMovable component =
  case component of
    Box _ -> True
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

isBox: Component -> Bool
isBox component =
  case component of
    Box _ -> True
    otherwise -> False

moveBoxes: List Location -> Location -> Action.Type.Direction -> List Location
moveBoxes boxes location direction =
    List.map (\l -> if location == l
               then updateLocation l direction
               else l)
        boxes

component: Char -> Maybe Component
component c = case c of
                'w' -> Just Wall
                'e' -> Just Empty
                'f' -> Just Floor
                's' -> Just Player
                'g' -> Just Goal
                'b' -> Just (Box False)
                'v' -> Just (Box True)
                otherwise -> Nothing
