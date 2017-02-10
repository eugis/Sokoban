module Level.View exposing (render)

import Graphics.Render exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (..)
import Level.Type exposing (Level)
import Board.View exposing (render)
import Action.Type exposing (Action)
import Component.View exposing (render)
import Component.Type exposing (Component(..))
import Stats.View exposing (render)
import Board.Type exposing (component)
import General.Render exposing (..)
import List
import General.Style
import General.Colors

-- Update later
render: Level -> Html Action
render level = General.Render.layout [ renderCompleteBoard level
                                     , General.Render.background General.Colors.backgroundHex
                                     , Stats.View.render level.stats
                                     ]

renderBoxes: Level -> Form Action
renderBoxes level =
  List.map (\l -> Component.View.render l (Box (component level.board l -- this function should be in the level Type and only one time
                                      |> Component.Type.isGoal))) level.boxes
           |> group

-- A complete board of a level includes the board, player and boxes
renderCompleteBoard: Level -> Html Action
renderCompleteBoard level =
          let
              width = Board.Type.width level.board
              height = Board.Type.height level.board
          in
              group
                  [ Board.View.render level.board
                  , Component.View.render level.player Player
                  , renderBoxes level
                  ]
              |> position ((-width / 2.0 + 20.0), (-height / 2.0 + 20.0))
              |> svg width height
              |> List.repeat 1
              -- Change this True for some type alias more representive
              |> Html.div [(General.Style.board width height True)]
