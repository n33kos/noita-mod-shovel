dofile("data/scripts/lib/utilities.lua")
dofile( "mods/starting_loadouts/files/loadouts.lua" )

function OnModInit()
    ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/shovel/files/scripts/gun/gun_actions.lua" )
    ModLuaFileAppend( "data/scripts/gun/gun_actions_unlimited.lua", "mods/shovel/files/scripts/gun/gun_actions.lua" )
    ModLuaFileAppend( "data/scripts/gun/_gun_actions_unlimited.lua", "mods/shovel/files/scripts/gun/gun_actions.lua" )
    ModLuaFileAppend( "data/scripts/gun/gun_actions_limited.lua", "mods/shovel/files/scripts/gun/gun_actions.lua" )
    ModLuaFileAppend( "data/scripts/gun/gun_actions_petri.lua", "mods/shovel/files/scripts/gun/gun_actions.lua" )
end

function OnPlayerSpawned( player_entity )
	local init_check_flag = "add_shovel_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	local inventory = nil

	local player_child_entities = EntityGetAllChildren( player_entity )
	if ( player_child_entities ~= nil ) then
		for i,child_entity in ipairs( player_child_entities ) do
			local child_entity_name = EntityGetName( child_entity )

			if ( child_entity_name == "inventory_quick" ) then
				inventory = child_entity
			end
		end
	end

    if ( inventory ~= nil ) then
        local shovel = EntityLoad( "mods/shovel/files/entities/items/wand_shovel.xml" )
        EntityAddChild( inventory, shovel )
	end
end