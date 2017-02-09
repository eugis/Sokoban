module Stats.Type exposing (Stats, init, incrementStats, updateTime,
                            movesString, pushesString, timeString)

import Time exposing (..)
import Guards exposing (..)

type alias Stats = { pushes: Int
                   , moves: Int
                   , time: Float
                   , level: Int
                   }

init: Int -> Stats
init level = { pushes = 0
             , moves = 0
             , time = 0
             , level = level
             }

incrementStats: Stats -> Bool -> Stats
incrementStats stats pushes = { pushes = stats.pushes + (toInt pushes)
                              , moves = stats.moves + 1
                              , time = stats.time
                              , level = stats.level
                              }

updateTime: Time -> Stats -> Stats
updateTime time stats = { pushes = stats.pushes
                        , moves = stats.moves
                        , time = (stats.time + 1)
                        , level = stats.level
                        }

toInt: Bool -> Int
toInt bool = bool == True => 1
          |=  0

movesString: Stats -> String
movesString stats = "moves " ++ (toString stats.moves)

pushesString: Stats -> String
pushesString stats = "pushes " ++ (toString stats.pushes)

timeString: Stats -> String
timeString stats = "time " ++ (toString stats.time)
