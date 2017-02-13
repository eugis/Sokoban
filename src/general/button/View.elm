module Button.View exposing (render)

import Button.Type exposing (Button(..), title, action)
import Action.Type exposing (Action)
import Html exposing (Html, div, text, Attribute)
import Html.Attributes
import Html.Events exposing (onClick)
import General.Style exposing (generalButtonStyle)

render: Button -> List (Attribute Action) -> Html Action
render button attributes = div (composeAttributes button attributes)
                               [ renderTitle button ]

-- This method is used to center the text.
renderTitle: Button -> Html Action
renderTitle button = div [] [ text (title button) ]

composeAttributes: Button -> List (Attribute Action) -> List (Attribute Action)
composeAttributes button attributes = attributes ++ generalAttributes button

generalAttributes: Button -> List (Attribute Action)
generalAttributes button = [ generalButtonStyle, onClick (action button) ]
