-- Sets up all non built-in gameplay features specific to this quest.

-- Usage: require("scripts/features")

-- Features can be enabled to disabled independently by commenting
-- or uncommenting lines below.

require("scripts/commands.lua")
require("scripts/menus/alttp_dialog_box")
require("scripts/menus/pause")
require("scripts/menus/game_over")
require("scripts/meta/enemy")
require("scripts/meta/sensor")
require("scripts/hud/hud")
require("scripts/dungeons.lua")
require("scripts/equipment.lua")
require("scripts/rabbit.lua")

return true
