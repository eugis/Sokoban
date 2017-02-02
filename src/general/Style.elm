module General.Style exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

background: Attribute msg
background = style
  [
    ("position", "fixed"),
    ("background-color", "#242c2d"),
    ("width", "100%"),
    ("top", "0"),
    ("bottom", "0"),
    ("z-index", "-1")
  ]

layout: Attribute msg
layout = style
  [
    ("position", "relative")
  ]

menu: Attribute msg
menu = style
  [
    ("position", "absolute"),
    ("top", "215px"),
    ("color", "#FFFFFF"),
    ("font-family", "'Orbitron', sans-serif"),
    ("font-size", "25px"),
    ("line-height", "50px"),
    ("text-align", "center"),
    ("width", "100%")
  ]

title: Attribute msg
title = style
  [
    ("position", "relative"),
    ("color", "#efefef"),
    ("font-family", "'Orbitron', sans-serif"),
    ("font-size", "40px"),
    ("line-height", "40px"),
    ("text-align", "center"),
    ("width", "100%")
  ]

stats: Attribute msg
stats =
  style [
    ("position", "relative"),
    ("color", "#bac4c5"),
    ("font-family", "'Orbitron', sans-serif"),
    ("font-size", "16px"),
    ("line-heigth", "16px"),
    ("text-align", "center"),
    ("margin-bottom", "40px"),
    ("width", "100%")
  ]

reset: Attribute msg
reset = style
  [
    ("position", "relative"),
    ("color", "#efefef"),
    ("font-family", "'Orbitron', sans-serif"),
    ("font-size", "14px"),
    ("text-align", "center"),
    ("margin-top", "40px"),
    ("width", "100%")
  ]
