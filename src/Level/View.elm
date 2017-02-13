module Level.View exposing (render)

import Graphics.Render exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (..)
import Level.Type exposing (Level, appTitle, levelText)
import Board.View exposing (render)
import Action.Type exposing (Action)
import Component.View exposing (render)
import Component.Type exposing (Component(..))
import Stats.View exposing (render)
import Board.Type exposing (component)
import General.Render exposing (..)
import List
import General.Style exposing (levelMainPanel)
import General.Colors exposing (background, toRgbaString, panelBackground)
import Html.Events exposing (onClick)
import Button.View exposing (render)
import Button.Type exposing (Button(..))

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

-- Render of top bar
renderTopBar: Int -> Html Action
renderTopBar levelNumber =
                    Html.div [General.Style.row, General.Style.topBar]
                          [ sokobanTitle
                          , levelTitle levelNumber
                          , renderActions levelNumber
                          ]

renderActions: Int -> Html Action
renderActions levelNumber =
    let
        attributes = [ General.Style.item, General.Style.topButtonStyle]
    in
        Html.div [General.Style.topItem 1]
                 [ Button.View.render (Menu 1) attributes
                 , Button.View.render (Retry levelNumber) attributes
                 ]

renderBoardZone: List (Html Action) -> Html Action
renderBoardZone components = Html.div [levelMainPanel] components

sokobanTitle: Html Action
sokobanTitle = [Html.div [] [Html.text appTitle]] |> topContainerItem 1 2

levelTitle: Int -> Html Action
levelTitle levelNumber = [Html.div [] [Html.text (levelText levelNumber)]]
                              |> topContainerItem 2 2.5

topContainerItem: Int -> Float -> List (Html Action) -> Html Action
topContainerItem growth size views = Html.div [ General.Style.topItem growth
                                              , General.Style.topCenter
                                              , General.Style.topTitles size
                                              ]
                                              views
