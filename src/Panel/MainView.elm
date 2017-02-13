module Panel.MainView exposing (render)

import Action.Type exposing (Action(..))
import Html exposing (..)
import Html.Events exposing (on)
import Html.Attributes exposing (..)
import General.Render exposing (layout, backgroundView)
import General.Style exposing (item, buttonStyle, title, row, stats, hoverButton,
                               basePanel)
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Colors exposing (background, toRgbaString)
import Panel.Type exposing (menuHeader, menuPlay)
import LevelManager exposing (availableLevels)
import Html.Events.Extra exposing (targetValueIntParse)
import Json.Decode as Json
import Button.Type exposing (Button(..))
import Button.View exposing (render)

render: Int -> Html Action
render level = layout
              [ backgroundView (toRgbaString background)
              , Html.div [ basePanel ]
                         [ renderHeader
                         , renderSelectRow level
                         , renderActions level
                         ]
              ]

renderHeader: Html Action
renderHeader = Html.div [ row, General.Style.title 6.0 ]
                        [ (Html.text menuHeader) ]

renderActions: Int -> Html Action
renderActions level =
    let
      attributes = hoverButton ++ [ item , buttonStyle ]
    in
      Html.div [ row, stats ]
               [ Button.View.render (Play level) attributes ]

renderSelectRow: Int -> Html Action
renderSelectRow level = Html.div [ row ]
                                 [ renderLevelSelect level ]

renderLevelSelect: Int -> Html Action
renderLevelSelect level =
    List.indexedMap renderOption availableLevels
        |> Html.select [ General.Style.select
                       , on "change" (Json.map Action.Type.Menu targetValueIntParse)
                       ]

renderOption: Int -> String -> Html Action
renderOption value option = Html.option [ Html.Attributes.value (toString (value + 1)) ]
                                        [ Html.text option ]
