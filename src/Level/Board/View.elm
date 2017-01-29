module Board.View exposing (render)

import Component.View exposing (render)
import Graphics.Render exposing (..)
import Board.Type exposing (..)
import Action.Type exposing (Action)
import Matrix exposing (..)

render: Board -> Form Action
--render board = nonEmptyBoardComponents board
--                  |> List.map (Component.View.render (loc 1 1))
--                  |> group -- TODO: could be written with a best style
render board = Matrix.mapWithLocation Component.View.render board
                |> flatten
                |> group
