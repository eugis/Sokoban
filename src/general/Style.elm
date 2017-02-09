module General.Style exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

-- TODO: update structs to handle with enums: colors, positions.
-- A more descriptive way
background: String -> Attribute msg
background color = style
  [
    ("position", "fixed"),
    ("background-color", color),
    ("width", "100%"),
    ("top", "0"),
    ("bottom", "0"),
    ("z-index", "-1")
  ]

layout: Attribute msg
layout = style
    [ ("position", "relative")
    , ("display", "flex")
    , ("align-items", "center")
    , ("justify-content", "center")
    , ("height", "100%")
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
  [ ("position", "relative")
  , ("color", "#c71585")
  , ("font-family", "'Orbitron', sans-serif")
  , ("font-size", "5em")
  , ("text-align", "center")
  , ("padding-top", "16px")
  ]

stats: Attribute msg
stats = style [ ("position", "fixed")
              , ("height", "55px")
              , ("width", "100%")
              , ("bottom", "0px")
              , ("background-color", "#fff5ee")
              , ("color", "#242c2d")
              , ("font-family", "'Orbitron', sans-serif")
              , ("font-size", "2em")
              , ("text-align", "center")
              , ("display", "flex")
              , ("justify-content", "space-around")
              ]

completedStats: Attribute msg
completedStats = style [ ("position", "relative")
              , ("width", "100%")
              , ("color", "#242c2d")
              , ("font-family", "'Orbitron', sans-serif")
              , ("font-size", "2em")
              , ("text-align", "center")
              , ("display", "flex")
              , ("justify-content", "space-around")
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

board: Float -> Float -> Bool -> Attribute msg
board width height inPixel =
  let
    formattedWidth = if inPixel then (toPixel width) else (toPercentage width)
    formattedHeight = if inPixel then (toPixel height) else (toPercentage height)
  in
    style [ ("position", "relative")
          , ("background-color", "#ffffff")
          , ("width", formattedWidth)
          , ("height", formattedHeight)
          ]

basePanel: Attribute msg
basePanel = style [ ("position", "relative")
                  , ("background-color", "#fff5ee")
                  , ("width", "60%")
                  , ("height", "400px")
                  , ("border", "15px solid #ffe4e1")
                  , ("padding", "8px")
                  , ("display", "flex")
                  , ("justify-content", "space-around")
                  , ("flex-direction", "column")
                  ]

item: Attribute msg
item = style [ ("flex-grow", "1")
             , ("max-width", "30%")
             , ("align-self", "flex-start")
             ]

buttonStyle: Attribute msg
buttonStyle = style [ ("flex-grow", "1")
                    , ("padding", "8px")
                    , ("background-color", "#cdaf95")
                    , ("max-width", "30%")
                    , ("height", "50px")
                    , ("align-self", "center")
                    , ("justify-content", "center")
                    , ("color", "#c71585")
                    , ("font-family", "'Orbitron', sans-serif")
                    , ("font-size", "0.9em")
                    , ("text-align", "center")
                    , ("text-transform", "uppercase")
                    ]

row: Attribute msg
row = style [ ("flex-grow", "1")
            , ("max-height", "50%")
            , ("width", "100%")
            , ("align-self", "flex-start")
            ]

toPixel: Float -> String
toPixel number = toString number ++ "px"

toPercentage: Float -> String
toPercentage number = toString number ++ "%"
