-- The Bomb Bag is an item fixing the max amount of bombs
-- We creating 2 differents items (bomb_bag and bombs) because this is 2 separate object in the inventory

local item = ...
local game = item:get_game()

local sound_timer

function item:on_created()
  item:set_savegame_variable("possession_bomb_bag")
  item:set_amount_savegame_variable("bomb_bag_capacity")
  item:set_assignable(false)
end

function item:on_started()
  self:on_variant_changed(self:get_variant())
end

function item:on_obtaining(variant, savegame_variable)
  -- The bomb bag is obtained filled
  local bombs = game:get_item("equipment/bombs")
  bombs:set_amount(bombs:get_max_amount())
end

-- When obtaining bomb_bag :
--    The max amount of equipable bombs raises
--    Pickable bombs are unlocked
function item:on_variant_changed(variant)
  local bombs = game:get_item("equipment/bombs")
  local pickable_bombs = game:get_item("pickables/bombs")
  if variant == 0 then
    bombs:set_max_amount(0)
    pickable_bombs:set_obtainable(false)
  else
    -- Determine the max amount of bombs
    local max_amounts = {10, 20, 30}
    local max_amount = max_amounts[variant]

    -- Unlock bombs and set max amount
    bombs:set_max_amount(max_amount)
    pickable_bombs:set_obtainable(true)
  end
end