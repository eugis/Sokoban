module Panel.Type exposing (..)

import Stats.Type

completedLevelHeader: Stats.Type.Stats -> String
completedLevelHeader stats = "¡Level " ++ (toString stats.level) ++ " completed!"

completedLevelRetry: String
completedLevelRetry = "Retry"

completedLevelNextLevel: String
completedLevelNextLevel = "Next level"

completedLevelBackMenu: String
completedLevelBackMenu = "Back to menu"
