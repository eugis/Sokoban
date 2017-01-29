module Level.View exposing (render)

import Color
import Graphics.Render exposing (..)
import Html exposing (Html)
import Level.Type exposing (Level)
import Board.View exposing (render)
import Action.Type exposing (Action)

render: Level -> Html Action
render level = Board.View.render level.board
                  |> position (0, 0)
                  |> svg 1000 1000
