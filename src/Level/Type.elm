module Level.Type exposing (Level, validateWin, LevelState(..), move, level,
                            updateTime, menu, retry, appTitle, levelText)

import Board.Type exposing (Board, component, clear, playerPosition, boxesPositions)
import Component.Type exposing (Component(..), isGoal, moveBoxes, isOccupable,
                                isBox)
import Matrix exposing (..)
import List exposing (..)
import Action.Type exposing (KeyboardInput(..), updateLocation)
import Guards exposing (..)
import Stats.Type exposing (..)
import Time exposing (..)

type alias Level = { board: Board
                   , boxes: List Matrix.Location
                   , player: Matrix.Location
                   , state: LevelState
                   , stats: Stats
                   }

type LevelState = Win | WaitingForMove

-- Initializers

level: Int -> Board -> Maybe Level
level number board =
    case (Board.Type.playerPosition board) of
      Nothing -> Nothing
      Just playerPosition -> initWithPlayer number board playerPosition

initWithPlayer: Int -> Board -> Location -> Maybe Level
initWithPlayer number board player =
    case (Board.Type.boxesPositions board) of
      Nothing -> Nothing
      Just boxes -> Just (init number board player boxes)

init: Int -> Board -> Location -> List Location -> Level
init number board player boxes =
      let board = Board.Type.clear board
      in { board = board
         , boxes = boxes
         , player = player
         , state = WaitingForMove
         , stats = Stats.Type.init number
         }

-- Update level parameters

updateTime: Time -> Level -> Level
updateTime time level = { board = level.board
                        , boxes = level.boxes
                        , player = level.player
                        , state = level.state
                        , stats = (Stats.Type.updateTime time level.stats)
                        }

move: Action.Type.Direction -> Level -> Level
move direction level =
    if (isValidDirectionMovement direction level)
    then movePlayer direction level
    else level

movePlayer: Action.Type.Direction -> Level -> Level
movePlayer direction level =
    let
        updatedPlayer = updateLocation level.player direction
        updatedBoxes = moveBoxes level.boxes updatedPlayer direction
        newLevelState = updateLevelState level.board updatedBoxes updatedPlayer
        pushes = updatedBoxes /= level.boxes
    in { board = level.board
       , boxes = updatedBoxes
       , player = updatedPlayer
       , state = newLevelState
       , stats = incrementStats level.stats pushes
       }

updateLevelState: Board -> List Location -> Location -> LevelState
updateLevelState board boxes player =
    if (validateWin board boxes)
    then Win
    else WaitingForMove

-- Validate movements

isValidDirectionMovement: Action.Type.Direction -> Level -> Bool
isValidDirectionMovement direction level =
    let
      updatedPlayer = (updateLocation level.player direction)
      posibleUpdatedBoxPosition = (updateLocation updatedPlayer direction)
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

-- Strings to show

menu: String
menu = "menu"

retry: String
retry = "retry"

appTitle: String
appTitle = "Sokoban"

levelText: Int -> String
levelText levelNumber = "Level " ++ toString levelNumber
