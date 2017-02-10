module Panel.MainView exposing (render)

import Action.Type exposing (Action(..))
import Html exposing (..)
import Html.Events exposing (onClick)
import General.Render
import General.Style
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Colors exposing (background, toRgbaString)
import Panel.Type exposing (menuHeader, menuPlay)

render: Html Action
render = General.Render.layout
              [ General.Render.backgroundView (toRgbaString background)
              , Html.div [ General.Style.basePanel ]
                         [ renderHeader
                         , renderActions
                         ]
              ]

renderHeader: Html Action
renderHeader = Html.div [General.Style.row, General.Style.menuTitle]
                        [(Html.text menuHeader)]

renderActions: Html Action
renderActions =
    Html.div [General.Style.row, General.Style.completedStats]
             [renderAction (NextLevel 1) menuPlay]

renderAction: Action -> String -> Html Action
renderAction action title = Html.div [ General.Style.item
                                     , General.Style.buttonStyle
                                     , Html.Events.onClick action
                                     ]
                                     [(Html.text title)]
