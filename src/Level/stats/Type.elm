module Stats.Type exposing (Stats, init, incrementStats, updateTime, toString)

import Time exposing (..)
import Guards exposing (..)

type alias Stats = { pushes: Int
                   , moves: Int
                   , time: Float
                   }

init: Stats
init = { pushes = 0
       , moves = 0
       , time = 0
       }

incrementStats: Stats -> Bool -> Stats
incrementStats stats pushes = { pushes = stats.pushes + (toInt pushes)
                              , moves = stats.moves + 1
                              , time = stats.time
                              }

updateTime: Time -> Stats -> Stats
updateTime time stats = { pushes = stats.pushes
                        , moves = stats.moves
                        , time = (stats.time + 1)
                        }

toString: Stats -> String
toString stats = ("moves " ++ (Basics.toString stats.moves) ++  ", " ++
                 "pushes " ++ (Basics.toString stats.pushes) ++ ", " ++
                 "time " ++ (Basics.toString stats.time))

toInt: Bool -> Int
toInt bool = bool == True => 1
          |=  0
