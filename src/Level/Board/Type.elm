module Board.Type exposing (Board, component, cellSize, width, height,
                            nonEmptyBoardComponents, mapWithLocation)

import Component.Type exposing (Component (..), notEmpty)
import Matrix exposing (..)
import List exposing (..)

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
mapWithLocation func board = mapWithLocation func board

component: Board -> Location -> Component
component board location =
    case (get location board) of
      Nothing -> Empty
      Just element -> element
