-- Configuration of the hookshot.
-- Feel free to change these values.

local config = {

  -- Range of the hookshot in pixels.
  distance = 160,

  -- Speed in pixels per second.
  speed = 256,

  -- What types of entities can be cought.
  -- Additionally, all entities that have a method "is_catchable_with_hookshot"
  -- returning true will be catchable.
  catchable_entity_types = { "pickable" },

  -- What types of entities the hookshot can attach to.
  -- Additionally, all entities that have a method "is_hookable"
  -- returning true will be hookable.
  hookable_entity_types = { "chest", "block" },
  -- We don't want every destructible hookable, so we can
  -- specify the destructible hookable by their sprite  
  --TODO : Verify that all the hookable destructible  are here
  hookable_by_animation_set = {
    ["destructible"] =
      {
        "destructibles/sign_dark", 
        "destructibles/sign",
        "destructibles/stone_black",
        "destructibles/stone_black_skull",
        "destructibles/stone_white",
        "destructibles/stone_white_skull",
        "destructibles/vase",
        "destructibles/vase_skull"
      }
  },
  

  -- Reaction of enemies touched by the hookshot by default.
  -- Same possible values as in enemy:set_attack_consequence().
  -- Enemies can change this value individually by calling
  -- "enemy:set_hookshot_reaction()".
  default_enemy_reaction = "immobilized",
}

return config
