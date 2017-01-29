module Level.Type exposing (Level, defaultBoard, defaultPlayerLocation,
                            defaultBoxes, validateWin)

import Board.Type exposing (..)
import Component.Type exposing (Component(..), isGoal)
import Matrix exposing (..)
import List exposing (..)

type alias Level = {
                    board: Board,
                    boxes: List Matrix.Location,
                    player: Matrix.Location
                    }

-- move: Level -> Direction -> Level
-- move level direction =

validateWin: Level -> Bool
validateWin level = List.map (\l -> component level.board l
                                    |> Component.Type.isGoal) level.boxes
                      |> foldr (&&) True

defaultBoard: Board
defaultBoard = matrix 2 3 (\location -> asd location)


defaultPlayerLocation: Matrix.Location
defaultPlayerLocation = loc 0 0

defaultBoxes: List Matrix.Location
defaultBoxes = [loc 0 1]

asd: Location -> Component
asd location = if ((row location) == 0 && (col location) == 0)
              then Player
              else
                if ((row location) == 0 && (col location) == 1)
                then Box
                else
                  if ((row location) == 0 && (col location) == 2)
                  then Goal
                  else Floor
