module Panel.CompletedView exposing (render)

import Action.Type exposing (Action)
import Html exposing (Html, div, text)
import General.Render
import General.Style as Style exposing (basePanel, row, title, item, hoverButton,
                                        buttonStyle)
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
                      , div [ basePanel ]
                            [ renderHeader stats
                            , renderStats stats
                            , renderActions stats
                            ]
                      ]

renderHeader: Stats -> Html Action
renderHeader stats = div [ row, title 5.0 ]
                         [ (text (completedLevelHeader stats)) ]

renderStats: Stats -> Html Action
renderStats stats = Html.div [ row ] [ renderStats' stats ]

renderActions: Stats -> Html Action
renderActions stats =
    let
      attributes = [ item, buttonStyle ] ++ hoverButton
    in
      div [ row, Style.stats ]
          [ Button.View.render (Menu 1) attributes
          , Button.View.render (Retry stats.level) attributes
          , Button.View.render (Next (stats.level + 1)) attributes
          ]

renderStats': Stats -> Html Action
renderStats' stats = div [row, Style.stats]
                         [ renderItem (movesString stats)
                         , renderItem (pushesString stats)
                         , renderItem (timeString stats)
                         ]

renderItem: String -> Html Action
renderItem stat = div [ item ] [ (text stat) ]
