module GameState exposing (SokobanState(..), updateStateWithKeyboard, updateStateWithTime)

import Level.Type exposing (Level, move, updateTime)
import Action.Type exposing (..)
import Debug exposing (..)
import Time exposing (..)

-- type alias SokobanState = Menu | Help | Level | Position
type SokobanState = InLevel Level

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

updateStateWithTime: Time -> SokobanState -> SokobanState
updateStateWithTime time state =
  case state of
    InLevel level -> updateLevelWithTime time level
    --otherwise -> state

updateLevelWithKeyboard: KeyboardInput -> Level -> SokobanState
updateLevelWithKeyboard keyboardInput level =
  case keyboardInput of
     Esc -> InLevel level --TODO: shold show the main menu when implemented
     None -> InLevel level -- As it is not a valid key returns the same state
     Enter -> InLevel level -- TODO: check if it will be used for something. If not remove
     otherwise -> InLevel (move (direction keyboardInput) level)

updateLevelWithTime: Time -> Level -> SokobanState
updateLevelWithTime time level = InLevel (updateTime time level)
