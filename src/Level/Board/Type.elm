module Board.Type exposing (Board, component, cellSize, width, height, clear,
                            nonEmptyBoardComponents, mapWithLocation, boardFromList,
                            playerPosition, boxesPositions, flatten)

import Component.Type exposing (Component (..), notEmpty)
import Matrix exposing (..)
import List exposing (..)
import Utilities exposing (filterNothings)

type alias Board = Matrix Component

cellSize: Float
cellSize = Component.Type.size

width: Board -> Float
width board = cellSize * toFloat (colCount board)

height: Board -> Float
height board = cellSize * toFloat (rowCount board)

nonEmptyBoardComponents: Board -> List Component
nonEmptyBoardComponents board = flatten board |> filter notEmpty

mapWithLocation: (Location -> Component -> b) -> Board -> Matrix b
mapWithLocation func board = Matrix.mapWithLocation func board

component: Board -> Location -> Component
component board location =
    case (get location board) of
      Nothing -> Empty
      Just element -> element

boardFromList: List (List Component) -> Board
boardFromList list = Matrix.fromList list

componentPositions: Board -> Component -> List Location
componentPositions board searchedComponent =
     mapWithLocation (\location component -> if (component == searchedComponent)
                                             then Just location
                                             else Nothing)
                     board
            |> Matrix.flatten -- get List [Maybe Location]
            |> filterNothings


playerPosition: Board -> Maybe Location
playerPosition board =
    let positions = componentPositions board Player
    in if (length positions) == 1 then head positions else Nothing

boxesPositions: Board -> Maybe (List Location)
boxesPositions board =
    let
        boxes = componentPositions board (Box False)
        boxesInGoal = componentPositions board (Box True)
        goals = componentPositions board Goal
    in
      if ( length boxes /= (length goals) || (length boxes == 0))
      then Nothing
      else Just (boxes ++ boxesInGoal)

clear: Board -> Board
clear board  = Matrix.map clearCell board

clearCell: Component -> Component
clearCell component =
    case component of
      Player -> Floor
      Box inGoal -> if inGoal then Goal else Floor
      otherwise -> component

flatten: Board -> List Component
flatten board = Matrix.flatten board
