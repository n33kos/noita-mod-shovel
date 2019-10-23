dofile("data/scripts/gun/procedural/gun_action_utils.lua")

function AddGunActionPermanentFrozen( entity_id, action_id )
	local action_entity_id = CreateItemActionEntity( action_id )
	if action_entity_id ~= nil then
		EntityAddChild( entity_id, action_entity_id )
	end

	edit_component( action_entity_id, "ItemComponent", function(comp, vars)
        vars.permanently_attached = "1"
        vars.is_frozen = "1"
	end)

	if action_entity_id ~= nil then
		EntitySetComponentsWithTagEnabled( action_entity_id, "enabled_in_world", false )
	end
end

function init_shovel()
    local entity_id = GetUpdatedEntityID()
    AddGunActionPermanent(entity_id, "SHOVEL")
end

init_shovel()