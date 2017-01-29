module GameState exposing (SokobanState(..))

import Level.Type exposing (Level)

-- type alias SokobanState = Menu | Help | Level | Position
type SokobanState = InLevel Level

type LevelState = EndState | Pause | WaitingForMove | UnPause

type EndState = Win | GameOver

type alias Help = {
                    message: String,
                    instructions: List Instruction
                  }

type alias Instruction = {
                          text: String
                          }
