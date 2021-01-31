-- Author : Lord Odin, based on skan-radio mod, simplified and added channels with text names
------------------------------------------------------------------------------------------------------------------------------
--require "util"

local updatePeriod = 60

------------------------------------------------------------------------------------------------------------------------------
function playerData(player)
	if not global.remote_constant_player_data then
		global.remote_constant_player_data = {}
	end
	
	if not global.remote_constant_player_data[player.index] then
		global.remote_constant_player_data[player.index] = {}
	end
	
	return global.remote_constant_player_data[player.index];
end
------------------------------------------------------------------------------------------------------------------------------
function open_remote_control(player, entity)
	local pd = playerData(player)		

	pd.constant_remote = player.surface.create_entity({
		name = "constant-combinator-remote",
		position = player.position,
		force = player.force,
		})
	pd.constant_remote_target = entity
			
	pd.constant_remote.get_or_create_control_behavior().parameters = entity.get_or_create_control_behavior().parameters
	pd.constant_remote.get_or_create_control_behavior().enabled = entity.get_or_create_control_behavior().enabled
	player.opened = pd.constant_remote
end
------------------------------------------------------------------------------------------------------------------------------
function sync_remote_control(player)
	local pd = playerData(player)
	if pd.constant_remote then
		pd.constant_remote_target.get_or_create_control_behavior().parameters = pd.constant_remote.get_or_create_control_behavior().parameters
		pd.constant_remote_target.get_or_create_control_behavior().enabled = pd.constant_remote.get_or_create_control_behavior().enabled
		if player.opened ~= pd.constant_remote then
			pd.constant_remote.destroy()
			pd.constant_remote = nil
			pd.constant_remote_target = nil
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------
local function isConstant(entity)
	return entity ~= nil and entity.valid and (entity.name == "constant-combinator")
end
------------------------------------------------------------------------------------------------------------------------------
local function debugPrint(string)
    local p = game.players[1]
    p.print(string)
end
------------------------------------------------------------------------------------------------------------------------------
local function onTick(event)
	for index, player in pairs(game.players) do
		sync_remote_control(player)
	end
end
------------------------------------------------------------------------------------------------------------------------------

script.on_event("open-constant-combinator-hotkey", function(event)
	--debugPrint("in open-constant-combinator-hotkey")
	local player = game.players[event.player_index]
	if player then
		local pd = playerData(player)		
		--debugPrint("in open-constant-combinator-hotkey - 1")
		local entity = player.selected	  
		--debugPrint("in open-constant-combinator-hotkey - 2")
		if isConstant(entity) then
			--debugPrint("in open-constant-combinator-hotkey - 3")
			if pd.constant_remote_target == entity then
				player.opened = nil
				--debugPrint("in open-constant-combinator-hotkey - 6")
			else
				--debugPrint("in open-constant-combinator-hotkey - 7.1")
				open_remote_control(player, entity)
				--debugPrint("in open-constant-combinator-hotkey - 7.2")
			end
		end
	end
	--debugPrint("in open-constant-combinator-hotkey - 4")
end)

script.on_event("toggle-constant-combinator-hotkey", function(event)
	--debugPrint("in toggle-constant-combinator-hotkey")
	local player = game.players[event.player_index]
	if player then
		local entity = player.selected	  
		if isConstant(entity) then
			entity.get_or_create_control_behavior().enabled = not entity.get_or_create_control_behavior().enabled;
		end
	end
end)

script.on_nth_tick(updatePeriod, onTick)
