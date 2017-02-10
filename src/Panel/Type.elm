module Panel.Type exposing (..)

import Stats.Type

completedLevelHeader: Stats.Type.Stats -> String
completedLevelHeader stats = "Level " ++ (toString stats.level) ++ " completed!"

completedLevelRetry: String
completedLevelRetry = "Retry"

completedLevelNextLevel: String
completedLevelNextLevel = "Next level"

completedLevelBackMenu: String
completedLevelBackMenu = "menu"

menuHeader: String
menuHeader = "Sokoban"

menuPlay: String
menuPlay = "Play"

congratulations: String
congratulations = "Congratulations!"

endMessage: String
endMessage = "You have finished the current levels. New levels will be added soon!"
