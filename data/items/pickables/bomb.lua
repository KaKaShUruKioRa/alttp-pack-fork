local item = ...

-- TODO : Make bombs invisible without the bomb bag
function item:on_created()
  self:set_can_disappear(true)
  self:set_brandish_when_picked(false)
end

function item:on_obtaining(variant, savegame_variable)
  -- Increasing the amount of bombs in the bomb bag
  local amounts = {1, 3, 8}
  local amount = amounts[variant]
  if amount == nil then
    error("Invalid variant '" .. variant .. "' for item 'bomb'")
  else
    self:get_game():get_item("equipment/bomb_bag"):add_amount(amount)
  end
end

