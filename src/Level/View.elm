module Level.View exposing (render)

import Color
import Graphics.Render exposing (..)
import Html exposing (Html)
import Level.Type exposing (Level)
import Board.View exposing (render)
import Action.Type exposing (Action)
import Component.View exposing (render)
import Component.Type exposing (Component(..))
import Stats.View exposing (render)

render: Level -> Html Action
render level = group
                  [ Board.View.render level.board
                  , Component.View.render level.player Player
                  , renderBoxes level
                  , Stats.View.render level.stats
                  , renderState level.state
                  ]
              |> position (0, 0)
              |> svg 800 600 -- monitor resolution??

renderBoxes: Level -> Form Action
renderBoxes level = List.map (\l -> Component.View.render l Box) level.boxes
                    |> group

--TODO: this should be removed un change view in the update
renderState: Level.Type.LevelState -> Form Action
renderState levelState =
            case levelState of
                Level.Type.Win -> plain 40 "'Orbitron', sans-serif" Color.orange "You win!"
                                      |> position (-200, -200)
                otherwise -> plain 40 "'Orbitron', sans-serif" Color.orange ""
                          |> position (-200, -200)
