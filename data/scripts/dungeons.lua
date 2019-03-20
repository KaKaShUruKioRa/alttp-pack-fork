-- Defines the dungeon information of a game.

-- Usage:
-- require("scripts/dungeons")

require("scripts/multi_events")

local dungeons_info = require("scripts/dungeons_info.lua")

local function initialize_dungeon_features(game)

  if game.get_dungeon ~= nil then
    -- Already done.
    return
  end

  -- Returns the name of the current dungeon if any, or nil.
  function game:get_dungeon_name()

    local dungeon = game:get_map():get_id();
    -- Find the dungeon in dungeon_info
    for name,value in pairs(dungeons_info) do 
      for _, map in ipairs(dungeons_info[name].maps) do
        if map == dungeon then
          return name
        end
      end
    end
    
    return nil;
  end

  -- Returns the current dungeon if any, or nil.
  function game:get_dungeon()

    local name = game:get_dungeon_name()
    return dungeons_info[name]
  end

  function game:is_dungeon_finished(dungeon_name)
    return game:get_value(dungeon_name .. "_finished")
  end

  function game:set_dungeon_finished(dungeon_name, finished)
    if finished == nil then
      finished = true
    end
    game:set_value(dungeon_name .. "_finished", finished)
  end

  function game:has_dungeon_map(dungeon_name)

    dungeon_name = dungeon_name or game:get_dungeon_name()
    return game:get_value(dungeon_name .. "_map")
  end

  function game:has_dungeon_compass(dungeon_name)

    dungeon_name = dungeon_name or game:get_dungeon_name()
    return game:get_value(dungeon_name .. "_compass")
  end

  function game:has_dungeon_big_key(dungeon_name)

    dungeon_name = dungeon_name or game:get_dungeon_name()
    return game:get_value(dungeon_name .. "_big_key")
  end

  function game:has_dungeon_boss_key(dungeon_name)

    dungeon_name = dungeon_name or game:get_dungeon_name()
    return game:get_value(dungeon_name .. "_boss_key")
  end

  -- Returns the name of the boolean variable that stores the exploration
  -- of dungeon room, or nil.
  function game:get_explored_dungeon_room_variable(dungeon_name, floor, room)

    dungeon_name = dungeon_name or game:get_dungeon_name()
    room = room or 1

    if floor == nil then
      if game:get_map() ~= nil then
        floor = game:get_map():get_floor()
      else
        floor = 0
      end
    end

    local room_name
    if floor >= 0 then
      room_name = tostring(floor + 1) .. "f_" .. room
    else
      room_name = math.abs(floor) .. "b_" .. room
    end

    return dungeon_name .. "_explored_" .. room_name
  end

  -- Returns whether a dungeon room has been explored.
  function game:has_explored_dungeon_room(dungeon_name, floor, room)

    return self:get_value(
      self:get_explored_dungeon_room_variable(dungeon_name, floor, room)
    )
  end

  -- Changes the exploration state of a dungeon room.
  function game:set_explored_dungeon_room(dungeon_name, floor, room, explored)

    if explored == nil then
      explored = true
    end

    self:set_value(
      self:get_explored_dungeon_room_variable(dungeon_name, floor, room),
      explored
    )
  end

end

-- Set up dungeon features on any game that starts.
local game_meta = sol.main.get_metatable("game")
game_meta:register_event("on_started", initialize_dungeon_features)

return true
