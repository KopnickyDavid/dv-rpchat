RegisterNetEvent('qb_rpchat:sendMe')
AddEventHandler('qb_rpchat:sendMe', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(202, 83, 220, 0.6); border-radius: 10px;"><i class="fas fa-user-circle"></i> {0}: {1}</div>',
        args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('qb_rpchat:sendDo')
AddEventHandler('qb_rpchat:sendDo', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(220, 173, 17, 0.6); border-radius: 10px;"><i class="fas fa-users"></i> {0}: {1}</div>',
        args = { title, message }
    })
	end
  end
end)
RegisterNetEvent('qb_rpchat:sendLocalOOC')
AddEventHandler('qb_rpchat:sendLocalOOC', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(99, 99, 99, 0.3); border-radius: 10px;"><i class="fas fa-street-view"></i> {0}: {1}</div>',
        args = { '[' ..playerId .. ']L-OOC ', message }
    })
	end
  end
end)

RegisterNetEvent('qb_rpchat:getCoords')
AddEventHandler('qb_rpchat:getCoords', function(player)
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped, false)
    local heading = GetEntityHeading(ped)

    local message = tostring("X: " .. coords.x .. " Y: " .. coords.y .. " Z: " .. coords.z .. " HEADING: " .. heading)
    TriggerServerEvent('qb_rpchat:showCoord', player, message)

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		--TriggerEvent('chat:removeSuggestion', '/tweet')
		--TriggerEvent('chat:removeSuggestion', '/me')
		--TriggerEvent('chat:removeSuggestion', '/do')
    TriggerEvent('chat:removeSuggestion', '/bm')
    TriggerEvent('chat:removeSuggestion', '/rk')
    TriggerEvent('chat:removeSuggestion', '/rukojmi')
    TriggerEvent('chat:removeSuggestion', '/nazada')
    TriggerEvent('chat:removeSuggestion', '/narameno')
    TriggerEvent('chat:removeSuggestion', '/givecar')
    TriggerEvent('chat:removeSuggestion', '/givecarplate')
	--	TriggerEvent('chat:removeSuggestion', '/news')
		--TriggerEvent('chat:removeSuggestion', '/inzerat')
		TriggerEvent('chat:removeSuggestion', '/gps')
		--*TriggerEvent('chat:removeSuggestion', '/doc')
	end
end)