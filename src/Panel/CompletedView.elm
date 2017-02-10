module Panel.CompletedView exposing (render)

import Action.Type exposing (Action(..))
import Html exposing (..)
import Html.Events exposing (onClick)
import General.Render
import General.Style
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Colors exposing (background, toRgbaString)
import Panel.Type exposing (completedLevelHeader, completedLevelRetry,
                            completedLevelNextLevel, completedLevelBackMenu)
import GameState

render: Stats -> Html Action
render stats =  General.Render.layout
                      [ General.Render.backgroundView (toRgbaString background)
                      , Html.div [ General.Style.basePanel ]
                                 [ renderHeader stats
                                 , renderStats stats
                                 , renderActions stats
                                 ]
                      ]

renderHeader: Stats -> Html Action
renderHeader stats = Html.div [General.Style.row, General.Style.title 5.0]
                              [(Html.text (completedLevelHeader stats))]

renderStats: Stats -> Html Action
renderStats stats = Html.div [General.Style.row]
                             [renderStats' stats]

renderActions: Stats -> Html Action
renderActions stats =
    Html.div [General.Style.row, General.Style.stats]
             [ renderAction BackMenu completedLevelBackMenu
             , renderAction (NextLevel (stats.level)) completedLevelRetry
             , renderAction (NextLevel (stats.level + 1)) completedLevelNextLevel
             ]

renderAction: Action -> String -> Html Action
renderAction action title = Html.div [ General.Style.item
                                     , General.Style.buttonStyle
                                     , General.Style.generalButtonStyle
                                     , Html.Events.onClick action
                                     ]
                                     [(Html.text title)]

renderStats': Stats -> Html Action
renderStats' stats =   Html.div [General.Style.row, General.Style.stats]
                          [ renderItem (movesString stats)
                          , renderItem (pushesString stats)
                          , renderItem (timeString stats)
                          ]

renderItem: String -> Html Action
renderItem stat = Html.div [General.Style.item] [(Html.text stat)]
