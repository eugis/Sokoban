module Panel.CompletedLevels exposing (render)

import Action.Type exposing (Action(..))
import Html exposing (..)
import General.Render
import General.Style
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Colors exposing (background, toRgbaString)
import Panel.Type exposing (congratulations, completedLevelBackMenu, endMessage)
import Button.Type exposing (Button(..))
import Button.View exposing (render)

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
renderHeader = Html.div [ General.Style.row, General.Style.title 4.0 ]
                        [ (Html.text congratulations) ]

renderMessage: Html Action
renderMessage = Html.div [ General.Style.row, General.Style.title 2.0 ]
                         [ (Html.text endMessage) ]

renderActions: Html Action
renderActions =
    let
      attributes = [ General.Style.item, General.Style.buttonStyle ]
    in
      Html.div [ General.Style.row, General.Style.stats ]
               [ Button.View.render (Button.Type.Menu 1) attributes ]
