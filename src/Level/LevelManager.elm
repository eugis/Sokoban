module LevelManager exposing (level, restart, availableLevels)

import Level.Type exposing (..)
import Component.Type exposing (..)
import Board.Type exposing (boardFromList)
import Utilities exposing (..)
import List exposing (length, map, repeat, indexedMap)

level: Int -> Maybe Level
level number = parseLevel number

parseLevel: Int -> Maybe Level
parseLevel number =
    case (levelsSchemes !! number) of
      Just levelScheme -> generateLevel levelScheme number
      otherwise -> Nothing

levelsSchemes: List (List (List Char))
levelsSchemes = [
                  [ ['w', 'w', 'w', 'w', 'e']
                  , ['w', 'g', 'f', 'w', 'w']
                  , ['w', 'f', 'b', 'f', 'w']
                  , ['w', 'f', 's', 'f', 'w']
                  , ['w', 'w', 'w', 'w', 'w']
                  ]
                ,
                  [ ['w', 'w', 'w', 'w', 'w']
                  , ['w', 'f', 's', 'g', 'w']
                  , ['w', 'f', 'b', 'f', 'w']
                  , ['w', 'g', 'b', 'f', 'w']
                  , ['w', 'w', 'w', 'w', 'w']
                  ]
                ,
                  [ ['w', 'w', 'w', 'w', 'w', 'e', 'e', 'e']
                  , ['w', 'g', 'g', 'f', 'w', 'w', 'w', 'w']
                  , ['w', 'f', 'f', 'f', 'f', 'f', 'f', 'w']
                  , ['w', 'f', 'b', 'f', 'b', 'f', 'f', 'w']
                  , ['w', 'w', 'w', 's', 'w', 'w', 'w', 'w']
                  , ['w', 'f', 'b', 'f', 'b', 'f', 'w', 'e']
                  , ['w', 'f', 'f', 'f', 'f', 'f', 'w', 'e']
                  , ['w', 'w', 'w', 'f', 'g', 'g', 'w', 'e']
                  , ['e', 'e', 'w', 'w', 'w', 'w', 'w', 'e']
                  ]
                ,
                  [ ['e', 'w', 'w', 'w', 'w', 'w', 'e']
                  , ['e', 'w', 'f', 'f', 'f', 'w', 'e']
                  , ['w', 'w', 'f', 'w', 'f', 'w', 'e']
                  , ['w', 'f', 'f', 'f', 'f', 'w', 'w']
                  , ['w', 's', 'w', 'f', 'g', 'g', 'w']
                  , ['w', 'f', 'b', 'b', 'w', 'f', 'w']
                  , ['w', 'w', 'w', 'f', 'f', 'f', 'w']
                  , ['e', 'e', 'w', 'w', 'w', 'w', 'w']
                  ]
                ,
                  [ ['w', 'w', 'w', 'w', 'w', 'e', 'e']
                  , ['w', 'f', 'f', 'f', 'w', 'w', 'w']
                  , ['w', 'f', 'w', 'g', 'g', 'f', 'w']
                  , ['w', 'f', 'f', 'f', 'f', 'f', 'w']
                  , ['w', 'w', 'b', 'w', 'b', 'w', 'w']
                  , ['e', 'w', 'f', 's', 'f', 'w', 'e']
                  , ['e', 'w', 'w', 'w', 'w', 'w', 'e']
                  ]
                ,
                  [ ['e', 'e', 'e', 'e', 'w', 'w', 'w', 'w', 'w', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
                  , ['e', 'e', 'e', 'e', 'w', 'f', 'f', 'f', 'w', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
                  , ['e', 'e', 'e', 'e', 'w', 'b', 'f', 'f', 'w', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
                  , ['e', 'e', 'w', 'w', 'w', 'f', 'f', 'b', 'w', 'w', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
                  , ['e', 'e', 'w', 'f', 'f', 'b', 'f', 'b', 'f', 'w', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
                  , ['w', 'w', 'w', 'f', 'w', 'f', 'w', 'w', 'f', 'w', 'e', 'e', 'e', 'w', 'w', 'w', 'w', 'w', 'w']
                  , ['w', 'f', 'f', 'f', 'w', 'f', 'w', 'w', 'f', 'w', 'w', 'w', 'w', 'w', 'f', 'f', 'g', 'g', 'w']
                  , ['w', 'f', 'b', 'f', 'f', 'b', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'g', 'g', 'w']
                  , ['w', 'w', 'w', 'w', 'w', 'f', 'w', 'w', 'w', 'f', 'w', 's', 'w', 'w', 'f', 'f', 'g', 'g', 'w']
                  , ['e', 'e', 'e', 'e', 'w', 'f', 'f', 'f', 'f', 'f', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w']
                  , ['e', 'e', 'e', 'e', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e']
                  ]
               ,  [ ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'e', 'e']
                  , ['w', 'g', 'g', 'f', 'f', 'w', 'f', 'f', 'f', 'f', 'f', 'w', 'w', 'w']
                  , ['w', 'g', 'g', 'f', 'f', 'w', 'f', 'b', 'f', 'f', 'b', 'f', 'f', 'w']
                  , ['w', 'g', 'g', 'f', 'f', 'w', 'b', 'w', 'w', 'w', 'w', 'f', 'f', 'w']
                  , ['w', 'g', 'g', 'f', 'f', 'f', 'f', 's', 'f', 'w', 'w', 'f', 'f', 'w']
                  , ['w', 'g', 'g', 'f', 'f', 'w', 'f', 'w', 'f', 'f', 'b', 'f', 'w', 'w']
                  , ['w', 'w', 'w', 'w', 'w', 'w', 'f', 'w', 'w', 'b', 'f', 'b', 'f', 'w']
                  , ['e', 'e', 'w', 'f', 'b', 'f', 'f', 'b', 'f', 'b', 'f', 'b', 'f', 'w']
                  , ['e', 'e', 'w', 'f', 'f', 'f', 'f', 'w', 'f', 'f', 'f', 'f', 'f', 'w']
                  , ['e', 'e', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w']
                  ]
               ,  [ ['e', 'e', 'e', 'e', 'e', 'e', 'w', 'w', 'w', 'w', 'w']
                  , ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'f', 's', 'f', 'w']
                  , ['w', 'f', 'b', 'f', 'b', 'f', 'b', 'b', 'b', 'f', 'w']
                  , ['w', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'w']
                  , ['w', 'b', 'f', 'b', 'f', 'b', 'f', 'b', 'f', 'f', 'w']
                  , ['w', 'f', 'w', 'f', 'w', 'w', 'w', 'w', 'w', 'w', 'w']
                  , ['w', 'f', 'f', 'f', 'w', 'e', 'e', 'e', 'e', 'e', 'e']
                  , ['w', 'w', 'w', 'w', 'w', 'e', 'e', 'e', 'e', 'e', 'e']
                  ]
               ]

generateLevel: List (List Char) -> Int -> Maybe Level
generateLevel scheme number =
    case (generateComponentScheme scheme) of
        Nothing -> Nothing
        Just componentScheme -> Board.Type.boardFromList componentScheme
                                  |> Level.Type.level number

generateComponentScheme: List (List Char) -> Maybe (List (List Component))
generateComponentScheme scheme = applyIfPosible mapElementsRow scheme

mapElementsRow: List Char -> Maybe (List Component)
mapElementsRow row = applyIfPosible Component.Type.component row

-- This code should be update if users can test their own LevelState
-- Level should save original pattern and generate the level again
restart: Level -> Level
restart oldLevel =
    case (level oldLevel.stats.level) of
          Nothing -> oldLevel -- this state should neve be arrived
          Just newLevel -> newLevel

availableLevels: List String
availableLevels = repeat (length  levelsSchemes) 0 -- This should create a list with necessary elements
                    |> indexedMap (\index _ -> "Level " ++ toString (index + 1))
