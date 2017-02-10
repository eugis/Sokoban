module General.Render exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import General.Style exposing (..)
import Stats.Type exposing (..)

layout: List (Html msg) -> Html msg
layout children =
  Html.div [General.Style.layout] children

backgroundView: String -> Html msg
backgroundView color =
  Html.div [General.Style.background color] []

title: String -> Html msg
title message =
    Html.div [General.Style.title] [text message]
