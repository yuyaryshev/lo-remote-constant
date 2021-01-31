function copyPrototype(type, name, newName)
  if not data.raw[type][name] then error("type "..type.." "..name.." doesn't exist") end
  local p = table.deepcopy(data.raw[type][name])
  p.name = newName
--  if p.minable and p.minable.result then
--    p.minable.result = newName
--  end
--  if p.place_result then
--    p.place_result = newName
--  end
--  if p.result then
--    p.result = newName
--  end
--  if p.results then
--		for _,result in pairs(p.results) do
--			if result.name == name then
--				result.name = newName
--			end
--		end
--	end
  return p
end


local lo_radio_constant_inv_ctl = copyPrototype("constant-combinator", "constant-combinator", "constant-combinator-remote")
        lo_radio_constant_inv_ctl.collision_box = {{0.0, 0.0}, {0.0, 0.0}}
        lo_radio_constant_inv_ctl.selection_box = {{0.0, 0.0}, {0.0, 0.0}}
		lo_radio_constant_inv_ctl.circuit_wire_max_distance = 100		
--        lo_radio_constant_inv_ctl.sprites =
--        {
--            north =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--                shift = {0.0, 0},
--            },
--            east =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--                shift = {0.0, 0},
--            },
--            south =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--                shift = {0.0, 0},
--            },
--            west =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--                shift = {0.0, 0},
--            }
--        }
--        lo_radio_constant_inv_ctl.activity_led_sprites =
--        {
--            north =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--            },
--            east =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--            },
--            south =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--            },
--            west =
--            {
--                filename = "__lo-remote-constant__/blank.png",
--                width = 1,
--                height = 1,
--                frame_count = 1,
--            }
--        }
--        lo_radio_constant_inv_ctl.activity_led_light =
--        {
--            intensity = 0,
--            size = 0
--        }
--        lo_radio_constant_inv_ctl.activity_led_light_offsets =
--        {
--            {0, 0},
--            {0, 0},
--            {0, 0},
--            {0, 0}
--        }
--        lo_radio_constant_inv_ctl.circuit_wire_connection_points =
--        {
--            {
--                shadow =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                },
--                wire =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                }
--            },
--            {
--                shadow =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                },
--                wire =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                }
--            },
--            {
--                shadow =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                },
--                wire =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                }
--            },
--            {
--                shadow =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                },
--                wire =
--                {
--                    red = {0, 0},
--                    green = {0, 0},
--                }
--            }
--        }
data:extend({lo_radio_constant_inv_ctl})


data:extend({
	{
		type = "custom-input",
		name = "open-constant-combinator-hotkey",
		key_sequence = "O",
		consuming = "none"
	},{
		type = "custom-input",
		name = "toggle-constant-combinator-hotkey",
		key_sequence = "T",
		consuming = "none"
	},
})

