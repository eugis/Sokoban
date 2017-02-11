module General.Style exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import General.Colors exposing (toRgbaString, buttonBackground, titleColor,
                                textColor, panelBackground, panelBorder)
import Utilities exposing (toPixel, toPercentage)

background: String -> Attribute msg
background color = style [ ("position", "fixed")
                         , ("background-color", color)
                         , ("width", "100%")
                         , ("top", "0")
                         , ("bottom", "0")
                         , ("z-index", "-1")
                         ]

layout: Attribute msg
layout = style [ ("position", "fixed")
               , ("display", "flex")
               , ("align-items", "center")
               , ("justify-content", "center")
               , ("height", "100%")
               , ("width", "100%")
               ]


layoutVertical: Attribute msg
layoutVertical = style [ ("position", "relative")
                       , ("display", "flex")
                       , ("align-items", "center")
                       , ("justify-content", "center")
                       , ("height", "100%")
                       , ("width", "100%")
                       , ("flex-direction", "column")
                       ]

title: Float -> Attribute msg
title size = style [ ("position", "relative")
                   , ("color", toRgbaString titleColor)
                   , ("font-family", "'Verdana', Geneva, sans-serif")
                   , ("font-size", toString size ++ "em")
                   , ("text-align", "center")
                   , ("padding-top", "16px")
                   ]


stats: Attribute msg
stats = style [ ("position", "relative")
              , ("width", "100%")
              , ("background-color", toRgbaString panelBackground)
              , ("color", toRgbaString textColor)
              , ("font-family", "'Orbitron', sans-serif")
              , ("font-size", "2em")
              , ("text-align", "center")
              , ("display", "flex")
              , ("justify-content", "space-around")
              , ("text-transform", "capitalize")
              ]

statsEndPosition: Attribute msg
statsEndPosition = style [ ("align-self", "flex-end")
                         , ("flex-grow", "0.75")
                         ]

board: Float -> Float -> Attribute msg
board width height = style [ ("position", "relative")
                           , ("width", (toPixel width))
                           , ("height", (toPixel height))
                           , ("align-self", "center")
                           ]

basePanel: Attribute msg
basePanel = style [ ("position", "relative")
                  , ("background-color", toRgbaString panelBackground)
                  , ("width", "60%")
                  , ("height", "400px")
                  , ("border", "15px solid " ++ toRgbaString panelBorder)
                  , ("padding", "8px")
                  , ("display", "flex")
                  , ("justify-content", "space-around")
                  , ("flex-direction", "column")
                  ]

buttonStyle: Attribute msg
buttonStyle = style [ ("font-size", "1em")
                    , ("height", "50px")
                    , ("padding-top", "16px")
                    , ("background-color", toRgbaString buttonBackground)
                    ]

topButtonStyle: Attribute msg
topButtonStyle = style [ ("font-size", "1.25em") ]

generalButtonStyle: Attribute msg
generalButtonStyle = style [ ("flex-grow", "1")
                           , ("max-width", "30%")
                           , ("align-self", "center")
                           , ("justify-content", "center")
                           , ("color", toRgbaString titleColor)
                           , ("font-family", "Lucida Console', Monaco, monospace")
                           , ("text-align", "center")
                           , ("text-transform", "uppercase")
                           ]
row: Attribute msg
row = style [ ("flex-grow", "1")
            , ("max-height", "50%")
            , ("width", "100%")
            , ("align-self", "center")
            , ("display", "flex")
            , ("justify-content", "center")
            ]

item: Attribute msg
item = style [ ("flex-grow", "1")
             , ("max-width", "30%")
             , ("align-self", "center")
             ]

topItem: Attribute msg
topItem = style [ ("flex-grow", "1")
                , ("max-width", "30%")
                , ("height", "100%")
                , ("align-self", "center")
                , ("display", "flex")
                , ("justify-content", "flex-end")
                ]

levelMainPanel: Attribute msg
levelMainPanel = style [ ("flex-grow", "8")
                       , ("max-height", "100%")
                       , ("width", "100%")
                       , ("align-self", "center")
                       , ("display", "flex")
                       , ("align-self", "center")
                       , ("justify-content", "center")
                       ]

topBar: Attribute msg
topBar = style [ ("position", "relative")
               , ("width", "100%")
               , ("height", "50px")
               , ("background-color", toRgbaString panelBackground)
               , ("font-family", "'Verdana', Geneva, sans-serif")
               , ("text-align", "center")
               , ("display", "flex")
               , ("justify-content", "space-around")
               , ("text-transform", "capitalize")
               , ("align-self", "flex-start")
               , ("flex-grow", "1")
               ]

topTitles: Float -> Int -> Attribute msg
topTitles size growth = style [ ("position", "relative")
                              , ("color", toRgbaString titleColor)
                              , ("font-family", "'Verdana', Geneva, sans-serif")
                              , ("font-size", toString size ++ "em")
                              , ("text-align", "center")
                              , ("padding-top", "8px")
                              , ("flex-grow", toString growth)
                              , ("self-align", "center")
                              ]
