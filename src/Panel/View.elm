module Panel.View exposing (render)

import Action.Type exposing (Action(..))
import Html exposing (..)
import Html.Events exposing (onClick)
import General.Render
import General.Style
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Color
import Panel.Type exposing (completedLevelHeader, completedLevelRetry,
                            completedLevelNextLevel, completedLevelBackMenu)
import GameState

render: Stats -> Html Action
render stats =  General.Render.layout
                      [ General.Render.background General.Color.backgroundHex
                      , Html.div [ General.Style.basePanel ]
                                 [ renderHeader stats
                                 , renderStats stats
                                 , renderActions stats
                                 ]
                      ]

renderHeader: Stats -> Html Action
renderHeader stats = Html.div [General.Style.row, General.Style.title]
                              [(Html.text (completedLevelHeader stats))]

renderStats: Stats -> Html Action
renderStats stats = Html.div [General.Style.row]
                             [renderStats' stats]

renderActions: Stats -> Html Action
renderActions stats =
    Html.div [General.Style.row, General.Style.completedStats]
             [ renderAction (BackMenu stats) completedLevelBackMenu
             , renderAction (NextLevel (stats.level)) completedLevelRetry
             , renderAction (NextLevel (stats.level + 1)) completedLevelNextLevel
             ]

renderAction: Action -> String -> Html Action
renderAction action title = Html.div [ General.Style.item
                                     , General.Style.buttonStyle
                                     , Html.Events.onClick action
                                     ]
                                     [(Html.text title)]

renderStats': Stats -> Html Action
renderStats' stats =   Html.div [General.Style.row, General.Style.completedStats]
                          [ renderItem (movesString stats)
                          , renderItem (pushesString stats)
                          , renderItem (timeString stats)
                          ]

renderItem: String -> Html Action
renderItem stat = Html.div [General.Style.item] [(Html.text stat)]
