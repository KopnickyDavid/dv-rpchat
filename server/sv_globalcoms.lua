local QBCore = exports['qb-core']:GetCoreObject()

-- GPS command
RegisterCommand('gps', function(source, args, raw)
 TriggerClientEvent('esx_rpchat:getCoords', source, source);
end)

RegisterServerEvent('esx_rpchat:showCoord')
AddEventHandler('esx_rpchat:showCoord', function(source, msg)
  TriggerClientEvent('chat:addMessage', source, {
     template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(0, 90, 90, 0.6); border-radius: 10px;"><i class="fas fa-map-marker-alt"></i> GPS: {0}</div>',
        args = { msg }
    })
end)

AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()

    if Config.EnableESXIdentity then name = GetCharacterName(source) end

    TriggerClientEvent('esx_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
  end
end)

RegisterCommand('ooc', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(5)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(200, 200, 200, 0.80); border-radius: 10px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
      args = { playerName, msg }
  })
end, false)

RegisterCommand('tweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    fal = GetCharacterName(source)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })
end, false)

RegisterCommand('twt', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(4)
  fal = GetCharacterName(source)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
      args = { fal, msg }
  })
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(3)
  fal = GetCharacterName(source)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255 , 255, 0, 0.2); border-radius: 10px;"><i class="fas fa-ad"></i> Reklama:{0}<br> {1}</div>',
      args = { fal, msg }
  })
end, false)

-- Anontwt
RegisterCommand('Anontwt', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(8)
  fal = GetCharacterName(source)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> @Anonym:<br> {1}</div>',
      args = { fal, msg }
  })
end, false)

-- Anontwt
RegisterCommand('bm', function(source, args, rawCommand)
    local toSay = ''
         for i=1,#args do
      toSay = toSay .. args[i] .. ' ' 
    end

  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.3vw 0.8vw; margin: 0.5vw 0.5vw 0.5vw 0; border-radius:10px; background-color: rgba(202,40,40, 0.6);"><strong style="font-size: 10pt;"><img src="https://stars.djmetla.eu/blackmarket.png" width="20" height="20" style="position: relative; left: -5px; top:3px;">Blackmarket zprava:</strong><br><p style="padding-top: .3vw">{0}</p></div>',
      args = {toSay}
  })
end, false)


RegisterCommand('me', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })
  TriggerClientEvent('3dme:triggerDisplay', -1, args, source)
end)

RegisterCommand('do', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
  TriggerClientEvent('3ddo:triggerDisplay', -1, args, source)
end)

RegisterCommand('doc', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end
  if args == nil then
  print('source .. args .. rawCommand')
  return
  end
  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end
  local counter_doc = 0
  local pocetOpakovani = tonumber(args)
  if pocetOpakovani < 101 then
    while counter_doc < pocetOpakovani do
        counter_doc = counter_doc + 1 
        TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, counter_doc .. "/" .. pocetOpakovani , { 255, 198, 0 })
        TriggerClientEvent('3ddoa:triggerDisplay', -1, counter_doc .. "/" .. pocetOpakovani, source)
        Citizen.Wait(2000)
    end 
  end
end)