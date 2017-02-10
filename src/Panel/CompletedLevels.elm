module Panel.CompletedLevels exposing (render)

import Action.Type exposing (Action(..))
import Html exposing (..)
import Html.Events exposing (onClick)
import General.Render
import General.Style
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Colors exposing (background, toRgbaString)
import Panel.Type exposing (congratulations, completedLevelBackMenu, endMessage)

render: Html Action
render = General.Render.layout
              [ General.Render.backgroundView (toRgbaString background)
              , Html.div [ General.Style.basePanel ]
                         [ renderHeader
                         , renderMessage
                         , renderActions
                         ]
              ]

renderHeader: Html Action
renderHeader = Html.div [General.Style.row, General.Style.title 4.0]
                        [(Html.text congratulations)]

renderMessage: Html Action
renderMessage = Html.div [General.Style.row, General.Style.title 2.0]
                        [(Html.text endMessage)]

renderActions: Html Action
renderActions =
    Html.div [General.Style.row, General.Style.stats]
             [renderAction BackMenu completedLevelBackMenu]

renderAction: Action -> String -> Html Action
renderAction action title = Html.div [ General.Style.item
                                     , General.Style.buttonStyle
                                     , General.Style.generalButtonStyle
                                     , Html.Events.onClick action
                                     ]
                                     [(Html.text title)]
