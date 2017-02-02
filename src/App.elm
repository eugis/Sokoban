port module App exposing (..)

import Html exposing (Html)
import Html.App
import Action.Type exposing (..)
import Level.Type exposing (..)
import Level.View exposing (render)
import GameState exposing (..)
import Keyboard exposing (..)
import Time exposing (..)
import Stats.Type exposing (..)

-- TODO: this should be removed when works properly
-- an get level from a predifined way
import Level.Mock exposing (..)

init : (SokobanState, Cmd Action)
init = (InLevel {
                board = Level.Mock.defaultBoard,
                boxes = Level.Mock.defaultBoxes,
                player = Level.Mock.defaultPlayerLocation,
                state = WaitingForMove,
                stats = Stats.Type.init
                },
        Cmd.none)

view : SokobanState -> Html Action
view gameState =
  case gameState of
        InLevel level -> Level.View.render level

update : Action -> SokobanState -> (SokobanState, Cmd Action)
update action gameState =
    case action of
        KeyboardInput input -> ( updateStateWithKeyboard input gameState, Cmd.none )
        Tick time -> ( updateStateWithTime time gameState, Cmd.none)

subscriptions : SokobanState -> Sub Action
subscriptions model =
      Sub.batch
        [ Keyboard.downs Action.Type.keyboardInput
        , Time.every second Tick
        ]

 -- Main is usted to start the program
main : Program Never
main =
    Html.App.program {
        init = init,
        view = view,
        update = update,
        subscriptions = subscriptions
    }
