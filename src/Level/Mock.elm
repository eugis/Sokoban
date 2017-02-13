module Level.Mock exposing (..)

import Board.Type exposing (Board, component)
import Component.Type exposing (Component(..), isGoal)
import Matrix exposing (..)
import List exposing (..)

defaultBoard: Board
defaultBoard = matrix 10 10 (\l -> if ((row l) == 0 || (row l) == 9 || (col l) == 0 || (col l) == 9) then Wall
                              else if ((row l) == 2 && ((col l) == 2 || (col l) == 3 || (col l) == 4)) then Goal
                              else Floor)

defaultPlayerLocation: Matrix.Location
defaultPlayerLocation = loc 5 5

defaultBoxes: List Matrix.Location
defaultBoxes = [loc 2 5, loc 7 4, loc 6 6]
