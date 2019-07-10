-- Converts maps that are using the old huge outside tileset
-- to now be using the rearranged equivalent that is splitted into 3 tilesets
-- whose size is now lower than 2048x2048.

local map_files = {...}

local function get_pattern_mapping()
  
  local pattern_to_tileset = {}
  
  -- TODO
  -- Check that the new tileset files exist, otherwise show an error.
  -- Traverse the new tileset files and associate to each pattern the tileset name.

  return pattern_to_tileset
end

local function convert_map(pattern_mapping, map_file)

  print("Converting map " .. map_file)

  -- TODO
  -- Set the main tileset of the map.
  -- Do nothing if the main tileset is already the new one.

  -- For each tile of the map that uses the old tileset (or that don't specify a tileset),
  -- determine the new tileset.
  -- Set this tileset except if it is the new one of the map.
  -- Show an error if a pattern of the map could not be found in any of the new tilesets.
  
  -- Save the file only if everything is okay.
end

if #map_files == 0 then
  print("Usage: lua update_maps_to_rearranged_outside_tilesets.lua quest_path map_file_1.dat ...")
  os.exit(1)
end

local pattern_to_tileset = get_pattern_mapping()

for _, map_file in ipairs(map_files) do
  convert_map(pattern_mapping, map_file)
end
