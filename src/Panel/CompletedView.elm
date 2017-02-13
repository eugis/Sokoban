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
import Button.Type exposing (Button(..))
import Button.View exposing (render)

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
    let
      attributes = [ General.Style.item, General.Style.buttonStyle ]
    in
      Html.div [General.Style.row, General.Style.stats]
               [ Button.View.render (Button.Type.Menu 1) attributes
               , Button.View.render (Button.Type.Retry stats.level) attributes
               , Button.View.render (Button.Type.Next (stats.level + 1)) attributes
               ]

renderStats': Stats -> Html Action
renderStats' stats =   Html.div [General.Style.row, General.Style.stats]
                          [ renderItem (movesString stats)
                          , renderItem (pushesString stats)
                          , renderItem (timeString stats)
                          ]

renderItem: String -> Html Action
renderItem stat = Html.div [General.Style.item] [(Html.text stat)]
