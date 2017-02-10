module Stats.View exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Graphics.Render exposing (..)
import Action.Type exposing (..)
import General.Style exposing (statsEndPosition, item)
import Time exposing (..)
import Stats.Type exposing (Stats, timeString, movesString, pushesString)
import Color
import General.Render exposing (..)

render: Stats -> Html Action
render stats =   Html.div [General.Style.stats, statsEndPosition]
                          [ renderItem (movesString stats)
                          , renderItem (pushesString stats)
                          , renderItem (timeString stats)
                          ]

renderItem: String -> Html Action
renderItem stat = Html.div [item] [(Html.text stat)]
