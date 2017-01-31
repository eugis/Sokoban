module Board.View exposing (render)

import Component.View exposing (render)
import Graphics.Render exposing (..)
import Board.Type exposing (..)
import Action.Type exposing (Action)
import Matrix exposing (..)

render: Board -> Form Action
render board = Matrix.mapWithLocation Component.View.render board
                |> flatten
                |> group
