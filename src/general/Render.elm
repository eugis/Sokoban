module General.Render exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import General.Style exposing (..)

layout: List (Html msg) -> Html msg
layout children = div [ General.Style.layout ] children

backgroundView: String -> Html msg
backgroundView color = div [ General.Style.background color ] []
