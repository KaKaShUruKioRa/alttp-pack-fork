-- Defines the elements to put in the HUD
-- and their position on the game screen.

-- You can edit this file to add, remove or move some elements of the HUD.

-- Each HUD element script must provide a method new()
-- that creates the element as a menu.
-- See for example scripts/hud/hearts.lua.

-- Negative x or y coordinates mean to measure from the right or bottom
-- of the screen, respectively.

local hud_config = {

  -- Item assigned to slot 1.
  {
    menu_script = "scripts/hud/item",
    x = 27,
    y = 12,
    slot = 1,  -- Item slot (1 or 2).
  },

  -- Rupee counter.
  {
    menu_script = "scripts/hud/rupees",
    x = 60,
    y = 10,
  },

 -- Bombs counter
  {
    menu_script = "scripts/hud/bombs",
    x = 90,
    y = 10,
  },

 -- Arrow counter
  {
    menu_script = "scripts/hud/arrows",
    x = 120,
    y = 10,
  },

  -- Hearts meter.
  {
    menu_script = "scripts/hud/hearts",
    x = -88,
    y = 0,
  },

  -- You can add more HUD elements here.
}

return hud_config
