module Level.Type exposing (Level, validateWin, LevelState(..), move)

import Board.Type exposing (Board, component)
import Component.Type exposing (Component(..), isGoal, moveBoxes)
import Matrix exposing (..)
import List exposing (..)
import Action.Type exposing (KeyboardInput(..), updateLocation)

type alias Level = {
                    board: Board,
                    boxes: List Matrix.Location,
                    player: Matrix.Location,
                    state: LevelState
                    }

type LevelState = Win | GameOver | WaitingForMove

validateWin: Board -> List Location -> Bool
validateWin board boxes = List.map (\l -> component board l
                                    |> Component.Type.isGoal) boxes
                          |> foldr (&&) True

move: Action.Type.Direction -> Level -> Level
move direction level =
    if (isValidMovement (Debug.log "direction" direction) level)
    then movePlayer direction level
    else level

movePlayer: Action.Type.Direction -> Level -> Level
movePlayer direction level =
    let
        updatedPlayer = updateLocation level.player direction
        updatedBoxes = moveBoxes level.boxes updatedPlayer direction
        newLevelState = updateLevelState level.board updatedBoxes updatedPlayer
    in {
        board = level.board,
        boxes = updatedBoxes,
        player = updatedPlayer,
        state = newLevelState
        }

updateLevelState: Board -> List Location -> Location -> LevelState
updateLevelState board boxes player =
    if (validateWin board boxes)
    then Win
    else
      if (validateGameOver board boxes player)
      then GameOver
      else WaitingForMove

-- TODO: should be implemented
isValidMovement: Action.Type.Direction -> Level -> Bool
isValidMovement direction level = True

-- TODO: should be implemented
validateGameOver: Board -> List Location -> Location -> Bool
validateGameOver board boxes player = False
