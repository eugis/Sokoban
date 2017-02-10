module Component.View exposing (render, box, player, floor', goal)

import Color
import Graphics.Render exposing (..)
import Component.Type exposing (Component(..), size)
import Action.Type exposing (..)
import Matrix exposing (..)
import General.Colors exposing (..)


render: Location -> Component -> Form Action
render location component =
  view component
  |> position ( toFloat (col location) * Component.Type.size,
                toFloat (row location) * Component.Type.size)

view: Component -> Form Action
view component =
  case component of
    Box inGoal -> box inGoal
    Floor   -> floor'
    Wall    -> wall
    Goal    -> goal
    Player  -> player
    Empty   -> empty'

 -- TODO: the logic to draw could be modularize into
 --       fucntions to avoid code repetation
box: Bool -> Form Action
box inGoal =
  let boxColor = if inGoal then General.Colors.boxWithGoal else General.Colors.box
  in
  group
    [ square (Component.Type.size - 3) |> solidFill General.Colors.boxBorder
    , square (Component.Type.size - 10) |> solidFill boxColor
    ]

player: Form Action
player =
  group
    [ circle ((Component.Type.size / 2) - 3) |> solidFill General.Colors.playerBorder
    , circle ((Component.Type.size / 2) - 6) |> solidFill General.Colors.player
    ]

floor': Form Action
floor' = square Component.Type.size |> solidFill General.Colors.floor'

goal: Form Action
goal =
  group
    [ floor'
    , circle (Component.Type.size / 6) |> solidFill General.Colors.goal
    ]

wall: Form Action
wall = coloredSquard General.Colors.wall

empty': Form Action
empty' = coloredSquard General.Colors.background

coloredSquard: Color.Color -> Form Action
coloredSquard color = square Component.Type.size |> solidFill color

square: Float -> Shape
square size = rectangle size size
