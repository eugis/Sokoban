module Board.View exposing (render)

import Component.View exposing (render)
import Graphics.Render exposing (..)
import Board.Type exposing (..)
import Action.Type exposing (Action)
import Matrix exposing (flatten)

render: Board -> Form Action
render board = Board.Type.mapWithLocation Component.View.render board
                |> Matrix.flatten
                |> group
