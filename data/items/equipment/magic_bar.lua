local item = ...
local game = item:get_game()

function item:on_created()
  self:set_savegame_variable("possession_magic_bar")
end

function item:on_variant_changed(variant)
  -- Obtaining a magic bar changes the max magic.
  local max_magics = {42, 84}
  local max_magic = max_magics[variant]
  if max_magic == nil then
    error("Invalid variant '" .. variant .. "' for item 'magic_bar'")
  end

  game:set_max_magic(max_magic)

  -- Unlock pickable magic jars.
  local magic_flask = self:get_game():get_item("pickables/magic_flask")
  magic_flask:set_obtainable(true)
end

