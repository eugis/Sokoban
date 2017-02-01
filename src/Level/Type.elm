module Level.Type exposing (Level, validateWin, LevelState(..), move)

import Board.Type exposing (Board, component)
import Component.Type exposing (Component(..), isGoal, moveBoxes, isOccupable,
                                isBox)
import Matrix exposing (..)
import List exposing (..)
import Action.Type exposing (KeyboardInput(..), updateLocation)
import Guards exposing (..)

type alias Level = {
                    board: Board,
                    boxes: List Matrix.Location,
                    player: Matrix.Location,
                    state: LevelState
                    }

type LevelState = Win | GameOver | WaitingForMove

move: Action.Type.Direction -> Level -> Level
move direction level =
    if (isValidDirectionMovement (Debug.log "direction" direction) level)
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
    if (Debug.log "validateWin" (validateWin board boxes))
    then Win
    else
      if (validateGameOver board boxes player)
      then GameOver
      else WaitingForMove

-- Validate movements

isValidDirectionMovement: Action.Type.Direction -> Level -> Bool
isValidDirectionMovement direction level =
    let
      updatedPlayer = (Debug.log "updatePlayer" (updateLocation level.player direction))
      posibleUpdatedBoxPosition = (Debug.log "posibleUpdatedBoxPosition" (updateLocation updatedPlayer direction))
    in isValidLocationMovement updatedPlayer posibleUpdatedBoxPosition level

isValidLocationMovement: Location -> Location -> Level -> Bool
isValidLocationMovement updatedPlayerPosition posibleUpdatedBoxPosition level
   = isNotOccupableComponent level.board updatedPlayerPosition => False
  |= hasNoBox level.boxes updatedPlayerPosition => True
  |= validateBoxMovement level posibleUpdatedBoxPosition

isNotOccupableComponent: Board -> Location -> Bool
isNotOccupableComponent board location =  isOccupableComponent board location
                                        |> not

isOccupableComponent: Board -> Location -> Bool
isOccupableComponent board location =  component board location
                                        |> isOccupable

hasNoBox: List Location -> Location -> Bool
hasNoBox boxes location  = member location boxes |> not

validateBoxMovement: Level -> Location -> Bool
validateBoxMovement level location =
  let isOccupableComponent' = isOccupableComponent level.board location
      hasNoBox' = hasNoBox level.boxes location
  in isOccupableComponent' && hasNoBox'

-- Validate end conditions

validateWin: Board -> List Location -> Bool
validateWin board boxes = List.map (\l -> component board l
                                    |> Component.Type.isGoal) boxes
                          |> foldr (&&) True

-- TODO: should be implemented
validateGameOver: Board -> List Location -> Location -> Bool
validateGameOver board boxes player = False
