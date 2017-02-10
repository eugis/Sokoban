module General.Colors exposing (..)

import Color exposing (Color, rgb, toRgb, rgba)

panelBorder: Color
panelBorder = (rgb 255 228 225)

background: Color
background = (rgb 36 44 45)

goal: Color
goal = (rgba 255 192 203 0.8)

box: Color
box = (rgba 255 245 238 0.3)

boxWithGoal: Color
boxWithGoal = (rgba 255 245 238 0.6)

boxBorder: Color
boxBorder = (rgb 199 21 133)

player: Color
player = (rgba 229 255 204 0.6)

playerBorder: Color
playerBorder = (rgb 102 204 0)

floor': Color
floor' = (rgb 255 245 238)

textColor: Color
textColor = (rgb 205 175 149)

titleColor: Color
titleColor = (rgb 199 21 133)

wall: Color
wall = (rgb 205 175 149)

buttonBackground: Color
buttonBackground = (rgba 102 204 0 0.3)

panelBackground: Color
panelBackground = (rgb 255 245 238)

toRgbaString: Color -> String
toRgbaString color =
  let { red, green, blue, alpha } = toRgb color
  in  "rgba("
      ++ toString red ++ ", "
      ++ toString green ++ ", "
      ++ toString blue ++ ", "
      ++ toString alpha ++ ")"
