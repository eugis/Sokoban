module General.Render exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import General.Style exposing (..)
import Stats.Type exposing (..)

layout: List (Html msg) -> Html msg
layout children =
  Html.div [Style.layout] children

background: Html msg
background =
  Html.div [Style.background] []

menu: String -> Html msg
menu message =
  Html.div [Style.menu] [text message]


title: String -> Html msg
title message =
    Html.div [Style.title] [text message]

reset: String -> Html msg
reset message =
  Html.div [Style.reset] [text message]
