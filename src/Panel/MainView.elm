module Panel.MainView exposing (render)

import Action.Type exposing (Action(..))
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import General.Render
import General.Style
import Stats.Type exposing (Stats, init, movesString, pushesString, timeString)
import General.Colors exposing (background, toRgbaString)
import Panel.Type exposing (menuHeader, menuPlay)
import LevelManager exposing (availableLevels)
import Html.Events.Extra exposing (targetValueIntParse)
import Json.Decode as Json

render: Int -> Html Action
render level = General.Render.layout
              [ General.Render.backgroundView (toRgbaString background)
              , Html.div [ General.Style.basePanel ]
                         [ renderHeader
                         , renderSelectRow level
                         , renderActions level
                         ]
              ]

renderHeader: Html Action
renderHeader = Html.div [General.Style.row, General.Style.title 6.0]
                        [(Html.text menuHeader)]

renderActions: Int ->  Html Action
renderActions level =
    Html.div [General.Style.row, General.Style.stats]
             [renderAction (NextLevel level) menuPlay]

renderAction: Action -> String -> Html Action
renderAction action title = Html.div [ General.Style.item
                                     , General.Style.buttonStyle
                                     , General.Style.generalButtonStyle
                                     , Html.Events.onClick action
                                     ]
                                     [(Html.text title)]

renderSelectRow: Int -> Html Action
renderSelectRow level = Html.div [ General.Style.row ]
                                 [ renderLevelSelect level ]

renderLevelSelect: Int -> Html Action
renderLevelSelect level = List.indexedMap renderOption availableLevels
                                |> Html.select [ General.Style.select
                                               , Html.Events.on "change" (Json.map Menu targetValueIntParse)
                                               ]

renderOption: Int -> String -> Html Action
renderOption value option = Html.option [ Html.Attributes.value (toString (value + 1))
                                        ]
                                        [Html.text option]
