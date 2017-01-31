module Level.View exposing (render)

import Color
import Graphics.Render exposing (..)
import Html exposing (Html)
import Level.Type exposing (Level)
import Board.View exposing (render)
import Action.Type exposing (Action)
import Component.View exposing (render)
import Component.Type exposing (Component(..))

render: Level -> Html Action
render level = group
                  [ Board.View.render level.board
                  , Component.View.render level.player Player
                  , renderBoxes level
                  ]
              |> position (0, 0)
              |> svg 1000 1000

renderBoxes: Level -> Form Action
renderBoxes level = List.map (\l -> Component.View.render l Box) level.boxes
                    |> group
