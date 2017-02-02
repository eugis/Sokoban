module Component.View exposing (render, box, player, floor', goal)

import Color
import Graphics.Render exposing (..)
import Component.Type exposing (Component(..), size)
import Action.Type exposing (..)
import Matrix exposing (..)
import General.Color exposing (..)


render: Location -> Component -> Form Action
render location component =
  view component
  |> position ( toFloat (col location) * Component.Type.size,
                toFloat (row location) * Component.Type.size)

view: Component -> Form Action
view component =
  case component of
    Box     -> box
    Floor   -> floor'
    Wall    -> wall
    Goal    -> goal
    Player  -> player
    Empty   -> empty'

 -- TODO: the logic to draw could be modularize into
 --       fucntions to avoid code repetation
box:Form Action
box =
  group
    [ square (Component.Type.size - 3) |> solidFill Color.orange
    , square (Component.Type.size - 10) |> solidFill Color.lightOrange
    ]

player: Form Action
player =
  group
    [ circle ((Component.Type.size / 2) - 3) |> solidFill Color.blue
    , circle ((Component.Type.size / 2) - 6) |> solidFill Color.lightBlue
    ]

floor': Form Action
floor' = square Component.Type.size |> solidFill General.Color.floor'

goal: Form Action
goal =
  group
    [ floor'
    , circle (Component.Type.size / 6) |> solidFill General.Color.goal
    ]

wall: Form Action
wall = coloredSquard Color.charcoal

empty': Form Action
empty' = coloredSquard Color.lightGrey

coloredSquard: Color.Color -> Form Action
coloredSquard color = square Component.Type.size |> solidFill color

square: Float -> Shape
square size = rectangle size size
