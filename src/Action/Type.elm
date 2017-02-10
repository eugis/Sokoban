module Action.Type exposing (..)

import Keyboard exposing (..)
import Matrix exposing (..)
import Time exposing (..)
import Stats.Type exposing (..)

type Action = KeyboardInput KeyboardInput
            | Tick Time
            | BackMenu Stats
            | NextLevel Int

type KeyboardInput = Up | Down | Left | Right | Esc | Restart | None

keyboardInput: KeyCode -> Action
keyboardInput keyCode =
  case keyCode of
    27 -> KeyboardInput Esc
    37 -> KeyboardInput Left
    38 -> KeyboardInput Up
    39 -> KeyboardInput Right
    40 -> KeyboardInput Down
    82 -> KeyboardInput Restart
    otherwise -> KeyboardInput None

type alias Direction = (Int, Int)

dir: Int -> Int -> Direction
dir x y = (x, y)

x: Direction -> Int
x (x , y) = x

y: Direction -> Int
y (x , y) = y

direction: KeyboardInput -> Direction
direction keyboardInput =
  case keyboardInput of
    Up -> (-1 , 0)
    Down -> (1, 0)
    Left -> (0, -1)
    Right -> (0, 1)
    otherwise -> (0, 0) -- This case should never be called.
                        -- And in case it is called generate a neutral Direction

updateLocation: Location -> Direction -> Location
updateLocation location direction =
  loc (row location + (x direction)) (col location + (y direction))
