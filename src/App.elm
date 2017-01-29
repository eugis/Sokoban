port module App exposing (..)

import Html exposing (Html)
import Html.App
import Action.Type exposing (Action(..))
import Level.Type exposing (..)
import Level.View exposing (render)
import GameState exposing (..)

init : (SokobanState, Cmd Action)
init = (InLevel {
                board = Level.Type.defaultBoard,
                boxes = Level.Type.defaultBoxes,
                player = Level.Type.defaultPlayerLocation
                },
        Cmd.none)

view : SokobanState -> Html Action
view gameState =
  case gameState of
        InLevel level -> Level.View.render level

update : Action -> SokobanState -> (SokobanState, Cmd Action)
update action gameState =
    case action of
        NoOp -> ( gameState, Cmd.none )

subscriptions : SokobanState -> Sub Action
subscriptions model = Sub.none

 -- Main is usted to start the program
main : Program Never
main =
    Html.App.program {
        init = init,
        view = view,
        update = update,
        subscriptions = subscriptions
    }
