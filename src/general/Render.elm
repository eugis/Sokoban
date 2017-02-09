module General.Render exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import General.Style exposing (..)
import Stats.Type exposing (..)

layout: List (Html msg) -> Html msg
layout children =
  Html.div [General.Style.layout] children

background: String -> Html msg
background color =
  Html.div [General.Style.background color] []

menu: String -> Html msg
menu message =
  Html.div [General.Style.menu] [text message]


title: String -> Html msg
title message =
    Html.div [General.Style.title] [text message]

reset: String -> Html msg
reset message =
  Html.div [General.Style.reset] [text message]
