module General.Style exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import General.Colors exposing (toRgbaString, buttonBackground, titleColor,
                                textColor, panelBackground)
import Utilities exposing (toPixel, toPercentage)

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

menuTitle: Attribute msg
menuTitle = style
  [ ("position", "relative")
  , ("color", toRgbaString titleColor)
  , ("font-family", "'Verdana', Geneva, sans-serif")
  , ("font-size", "6em")
  , ("text-align", "center")
  , ("padding-top", "16px")
  ]

title: Attribute msg
title = style
  [ ("position", "relative")
  , ("color", toRgbaString titleColor)
  , ("font-family", "'Verdana', Geneva, sans-serif")
  , ("font-size", "5em")
  , ("text-align", "center")
  , ("padding-top", "16px")
  ]

stats: Attribute msg
stats = style [ ("position", "fixed")
              , ("height", "55px")
              , ("width", "100%")
              , ("bottom", "0px")
              , ("background-color", toRgbaString panelBackground)
              , ("color", toRgbaString textColor)
              , ("font-family", "'Orbitron', sans-serif")
              , ("font-size", "2em")
              , ("text-align", "center")
              , ("display", "flex")
              , ("justify-content", "space-around")
              , ("text-transform", "capitalize")
              ]

completedStats: Attribute msg
completedStats = style [ ("position", "relative")
              , ("width", "100%")
              , ("color", toRgbaString textColor)
              , ("font-family", "'Orbitron', sans-serif")
              , ("font-size", "2em")
              , ("text-align", "center")
              , ("display", "flex")
              , ("justify-content", "space-around")
              , ("text-transform", "capitalize")
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
                  , ("background-color", toRgbaString panelBackground)
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
             , ("align-self", "center")
             ]

buttonStyle: Attribute msg
buttonStyle = style [ ("flex-grow", "1")
                    , ("padding-top", "16px")
                    , ("background-color", toRgbaString buttonBackground)
                    , ("max-width", "30%")
                    , ("height", "50px")
                    , ("align-self", "center")
                    , ("justify-content", "center")
                    , ("color", toRgbaString titleColor)
                    , ("font-family", "Lucida Console', Monaco, monospace")
                    , ("font-size", "0.9em")
                    , ("text-align", "center")
                    , ("text-transform", "uppercase")
                    ]

row: Attribute msg
row = style [ ("flex-grow", "1")
            , ("max-height", "50%")
            , ("width", "100%")
            , ("align-self", "center")
            , ("display", "flex")
            , ("align-self", "center")
            , ("justify-content", "center")
            ]
