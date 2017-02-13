module Utilities exposing (..)

applyIfPosible: (a -> Maybe b) -> List a -> Maybe (List b)
applyIfPosible f list =
    let
      maybeList = List.map f list
      justElementsList = filterNothings maybeList
    in
      if (List.length maybeList == (List.length justElementsList))
      then Just justElementsList
      else Nothing

filterNothings: List (Maybe a) -> List a
filterNothings list = List.foldr (\maybeElement newList ->
                                  case maybeElement of
                                      Just element -> element :: newList
                                      Nothing -> newList) [] list

-- List function to get an element by index
infixr 9 !!
(!!): List a -> Int -> Maybe a
(!!) list index =
   if  (List.length list) >= index
   then List.take index list
        |> List.reverse
        |> List.head
   else Nothing

toPixel: Float -> String
toPixel number = toString number ++ "px"

toPercentage: Float -> String
toPercentage number = toString number ++ "%"
