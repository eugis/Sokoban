module Stats.View exposing (render)

--import Html exposing (..)
--import Html.Attributes exposing (..)
import Graphics.Render exposing (..)
import Action.Type exposing (..)
import General.Style exposing (..)
import Time exposing (..)
import Stats.Type exposing (Stats)
import Color

--render: Stats -> Form Action
--render stats =
--  Html.div [General.Style.stats] [
--    Html.text (
--      "moves " ++ (toString stats.moves) ++  ", " ++
--      "pushes " ++ (toString stats.pushes) ++ ", " ++
--      "time " ++ (toString stats.time)
--    ) -- should be moved to toString into stats type
--  ]
--  |> html

render: Stats -> Form Action
render stats = plain 30 "'Orbitron', sans-serif" Color.black (toString stats)
               |> position (-100, -100)
