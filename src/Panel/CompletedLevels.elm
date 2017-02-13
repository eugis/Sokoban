module Panel.CompletedLevels exposing (render)

import Action.Type exposing (Action)
import Html exposing (Html, div, text)
import General.Render
import General.Style exposing (basePanel, title, row, buttonStyle, item, stats,
                               hoverButton)
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Colors exposing (background, toRgbaString)
import Panel.Type exposing (congratulations, completedLevelBackMenu, endMessage)
import Button.Type exposing (Button(..))
import Button.View exposing (render)

render: Html Action
render = General.Render.layout
              [ General.Render.backgroundView (toRgbaString background)
              , div [ basePanel ] [ renderHeader, renderMessage, renderActions ]
              ]

renderHeader: Html Action
renderHeader = Html.div [ row, title 4.0 ]
                        [ (text congratulations) ]

renderMessage: Html Action
renderMessage = div [ row, title 2.0 ]
                    [ (Html.text endMessage) ]

renderActions: Html Action
renderActions =
    let
      attributes = [ item, buttonStyle ] ++ hoverButton
    in
      div [ row, stats ]
          [ Button.View.render (Menu 1) attributes ]
