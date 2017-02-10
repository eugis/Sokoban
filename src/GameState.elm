module GameState exposing (SokobanState(..), updateStateWithKeyboard, updateStateWithTime)

import Level.Type exposing (Level, move, updateTime)
import Action.Type exposing (..)
import Debug exposing (..)
import Time exposing (..)
import Stats.Type exposing (Stats)
import LevelManager exposing (restart)

type SokobanState = InLevel Level | Win Stats | Menu | EndGame

type alias Help = {
                    message: String,
                    instructions: List Instruction
                  }

type alias Instruction = {
                          text: String
                          }

updateStateWithKeyboard: KeyboardInput -> SokobanState -> SokobanState
updateStateWithKeyboard keyboardInput state =
  case state of
    InLevel level -> updateLevelWithKeyboard keyboardInput level
    otherwise -> state

updateStateWithTime: Time -> SokobanState -> SokobanState
updateStateWithTime time state =
  case state of
    InLevel level -> updateLevelWithTime time level
    otherwise -> state

updateLevelWithKeyboard: KeyboardInput -> Level -> SokobanState
updateLevelWithKeyboard keyboardInput level =
  case keyboardInput of
     Esc -> Menu
     None -> InLevel level -- As it is not a valid key returns the same state
     Restart -> InLevel (LevelManager.restart level)
     otherwise -> newState (move (direction keyboardInput) level)

updateLevelWithTime: Time -> Level -> SokobanState
updateLevelWithTime time level = InLevel (updateTime time level)

-- Returns a new new state depending on the levelState
newState: Level -> SokobanState
newState level =
  case level.state of
    Level.Type.Win -> Win level.stats
    otherwise -> InLevel level
