module Level.Mock exposing (..)

import Board.Type exposing (Board, component)
import Component.Type exposing (Component(..), isGoal)
import Matrix exposing (..)
import List exposing (..)

defaultBoard: Board
defaultBoard = matrix 6 4 (\l -> if ((row l) == 0 && (col l) == 2)
                                 then Goal
                                 else Floor)


defaultPlayerLocation: Matrix.Location
defaultPlayerLocation = loc 0 0

defaultBoxes: List Matrix.Location
defaultBoxes = [loc 0 1]
