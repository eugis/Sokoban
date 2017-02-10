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
import Panel.CompletedView exposing (render)
import Panel.MainView exposing (render)
import Panel.CompletedLevels exposing (render)
import LevelManager exposing (level)

init : (SokobanState, Cmd Action)
init = (Menu, Cmd.none)

view : SokobanState -> Html Action
view gameState =
  case gameState of
        InLevel level -> Level.View.render level
        GameState.Win stats -> Panel.CompletedView.render stats
        Menu -> Panel.MainView.render
        EndGame -> Panel.CompletedLevels.render

update : Action -> SokobanState -> (SokobanState, Cmd Action)
update action gameState =
    case action of
        KeyboardInput input -> ( updateStateWithKeyboard input gameState, Cmd.none )
        Tick time -> ( updateStateWithTime time gameState, Cmd.none)
        NextLevel levelNumber -> case (LevelManager.level levelNumber) of
                                    Nothing -> (EndGame, Cmd.none)
                                    Just level -> (InLevel level,  Cmd.none )
        BackMenu -> (Menu,  Cmd.none )

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
