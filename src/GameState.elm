module GameState exposing (SokobanState(..), updateState)

import Level.Type exposing (Level, move)
import Action.Type exposing (..)
import Debug exposing (..)

-- type alias SokobanState = Menu | Help | Level | Position
type SokobanState = InLevel Level

type alias Help = {
                    message: String,
                    instructions: List Instruction
                  }

type alias Instruction = {
                          text: String
                          }

updateState: KeyboardInput -> SokobanState -> SokobanState
updateState keyboardInput state =
  case state of
    InLevel level -> updateLevel keyboardInput level

updateLevel: KeyboardInput -> Level -> SokobanState
updateLevel keyboardInput level =
  case keyboardInput of
     Esc -> InLevel level --TODO: shold show the main menu when implemented
     None -> InLevel level -- As it is not a valid key returns the same state
     Enter -> InLevel level -- TODO: check if it will be used for something. If not remove
     otherwise -> InLevel (move (direction keyboardInput) level)
