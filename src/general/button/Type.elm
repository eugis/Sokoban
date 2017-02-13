module Button.Type exposing (..)

import Action.Type exposing (Action(..))

type Button = Menu Int
            | Play Int
            | Retry Int
            | Next Int

title: Button -> String
title button =
    case button of
      Menu _ -> "Menu"
      Play _ -> "Play"
      Retry _ -> "Retry"
      Next _ -> "Next"

action: Button -> Action
action button =
    case button of
      Menu level -> Action.Type.Menu level
      Play level -> NextLevel level
      Retry level -> NextLevel level
      Next level -> NextLevel level
