module Level.View exposing (render)

import Graphics.Render exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (..)
import Level.Type exposing (Level, menu, retry, appTitle, levelText)
import Board.View exposing (render)
import Action.Type exposing (Action(..))
import Component.View exposing (render)
import Component.Type exposing (Component(..))
import Stats.View exposing (render)
import Board.Type exposing (component)
import General.Render exposing (..)
import List
import General.Style exposing (levelMainPanel)
import General.Colors exposing (background, toRgbaString, panelBackground)
import Html.Events exposing (onClick)

-- Update later
render: Level -> Html Action
render level = General.Render.layout
                                     [ General.Render.backgroundView (toRgbaString background)
                                     , Html.div [General.Style.layoutVertical]
                                              [ renderTopBar level.stats.level
                                              , renderBoardZone [renderCompleteBoard level]
                                              , Stats.View.render level.stats
                                              ]
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
              |> Html.div [(General.Style.board width height)]

renderTopBar: Int -> Html Action
renderTopBar levelNumber =
                    Html.div [General.Style.row, General.Style.topBar]
                          [ sokobanTitle
                          , levelTitle levelNumber
                          , renderActions levelNumber
                          ]

renderActions: Int -> Html Action
renderActions levelNumber =
    Html.div [General.Style.topItem]
             [ renderAction BackMenu menu
             , renderAction (NextLevel levelNumber) retry
             ]

renderAction: Action -> String -> Html Action
renderAction action title = Html.div [ General.Style.item
                                     , General.Style.topButtonStyle
                                     , General.Style.generalButtonStyle
                                     , Html.Events.onClick action
                                     ]
                                     [(Html.text title)]

renderBoardZone: List (Html Action) -> Html Action
renderBoardZone components = Html.div [levelMainPanel] components

sokobanTitle: Html Action
sokobanTitle = Html.div [General.Style.topTitles 2.25 1] [Html.text appTitle]

levelTitle: Int -> Html Action
levelTitle levelNumber = Html.div [General.Style.topTitles 2.25 2]
                                  [Html.text (levelText levelNumber)]
