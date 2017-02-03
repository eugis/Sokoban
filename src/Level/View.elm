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
import Board.Type exposing (component)

render: Level -> Html Action
render level = group
                  [ Board.View.render level.board
                  , Component.View.render level.player Player
                  , renderBoxes level
                  , Stats.View.render level.stats
                  , renderState level.state
                  ]
              |> position (-100, -100)
              |> svg 1024 640 -- monitor resolution??

renderBoxes: Level -> Form Action
renderBoxes level =
  List.map (\l -> Component.View.render l (Box (component level.board l -- this function should be in the level Type and only one time
                                      |> Component.Type.isGoal))) level.boxes
           |> group

--TODO: this should be removed un change view in the update
renderState: Level.Type.LevelState -> Form Action
renderState levelState =
            case levelState of
                Level.Type.Win -> plain 40 "'Orbitron', sans-serif" Color.orange "You win!"
                                      |> position (-150, -150)
                otherwise -> plain 40 "'Orbitron', sans-serif" Color.orange ""
                          |> position (-200, -200)
