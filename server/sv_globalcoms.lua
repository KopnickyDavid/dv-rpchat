local QBCore = exports['qb-core']:GetCoreObject()

-- GPS command
RegisterCommand('gps', function(source, args, raw)
 TriggerClientEvent('qb_rpchat:getCoords', source, source);
end)
QBCore.Commands.Add('try', 'Try something', {{name = 'message', help = 'What do you want to try'}}, false, function(source, args)
  local src = source
  local ped = GetPlayerPed(src)
  local pCoords = GetEntityCoords(ped)
  local msg = ''

  if (math.random(0, 1) == 1) then
      msg = '~g~[Successful]~s~ ' .. table.concat(args, ' ')
  else 
      msg = ' ~r~[Unsuccessful]~s~ ' .. table.concat(args, ' ')
  end

  if msg == '' then return end
  for k,v in pairs(QBCore.Functions.GetPlayers()) do
      local tCoords = GetEntityCoords(GetPlayerPed(v))
      if #(pCoords - tCoords) < 20 then
          TriggerClientEvent('QBCore:Command:ShowMe3D', v, src, msg)
      end
  end
end, 'user')
QBCore.Commands.Add('coin', 'Flip a coin', {{name = 'message', help = 'flip a coin'}}, false, function(source, args)
  local src = source
  local ped = GetPlayerPed(src)
  local pCoords = GetEntityCoords(ped)
  local msg = ''

  if (math.random(0, 1) == 1) then
      msg = '~g~[Head]~s~ ' .. table.concat(args, ' ')
  else 
      msg = ' ~r~[Eagle]~s~ ' .. table.concat(args, ' ')
  end

  if msg == '' then return end
  for k,v in pairs(QBCore.Functions.GetPlayers()) do
      local tCoords = GetEntityCoords(GetPlayerPed(v))
      if #(pCoords - tCoords) < 20 then
          TriggerClientEvent('QBCore:Command:ShowMe3D', v, src, msg)
      end
  end
end, 'user')
RegisterServerEvent('qb_rpchat:showCoord')
AddEventHandler('qb_rpchat:showCoord', function(source, msg)
  TriggerClientEvent('chat:addMessage', source, {
     template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(0, 90, 90, 0.6); border-radius: 10px;"><i class="fas fa-map-marker-alt"></i> GPS: {0}</div>',
        args = { msg }
    })
end)

AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()


    TriggerClientEvent('qb_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
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
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255 , 255, 0, 0.2); border-radius: 10px;"><i class="fas fa-ad"></i> Ad by:{0}<br> {1}</div>',
      args = { fal, msg }
  })
end, false)

-- Anontwt
RegisterCommand('anontwt', function(source, args, rawCommand)
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
    template = '<div style="padding: 0.3vw 0.8vw; margin: 0.5vw 0.5vw 0.5vw 0; border-radius:10px; background-color: rgba(202,40,40, 0.6);"><strong style="font-size: 10pt;"><img src="https://cdn.iconscout.com/icon/free/png-256/skull-737-1074609.png" width="20" height="20" style="position: relative; left: -5px; top:3px;">Blackmarket message:</strong><br><p style="padding-top: .3vw">{0}</p></div>',
      args = {toSay}
  })
end, false)


RegisterCommand('me', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName(source) end
  if Config.lastname then name = GetLastName(source) end
  if Config.job then name = GetJobName(source) end

  TriggerClientEvent('qb_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })
  TriggerClientEvent('3dme:triggerDisplay', -1, args, source)
end)

RegisterCommand('do', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName(source) end
  if Config.lastname then name = GetLastName(source) end
  if Config.job then name = GetJobName(source) end

  TriggerClientEvent('qb_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
  TriggerClientEvent('3ddo:triggerDisplay', -1, args, source)
end)

RegisterCommand('doc', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end
  if args == nil then
  print('source .. args .. rawCommand')
  return
  end
  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  local counter_doc = 0
  local pocetOpakovani = tonumber(args)
  if pocetOpakovani < Config.doc then
    while counter_doc < pocetOpakovani do
        counter_doc = counter_doc + 1 
        TriggerClientEvent('qb_rpchat:sendDo', -1, source, name, counter_doc .. "/" .. pocetOpakovani , { 255, 198, 0 })
        TriggerClientEvent('3ddoa:triggerDisplay', -1, counter_doc .. "/" .. pocetOpakovani, source)
        Citizen.Wait(2000)
    end 
  end
end)
RegisterCommand('police', function(source, args, rawCommand)
  local xPlayer = QBCore.Functions.GetPlayer(source)
  local toSay = table.concat(args, ' ')

  if xPlayer.PlayerData.job.name == 'police' then 
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(50, 71, 202, 0.9); border-radius: 10px;"><i class="fas fa-bullhorn"></i> Police: {0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-exclamation"></i>  You need to work in police to use /police <i class="fas fa-exclamation"></i></div>',
      args = {}
    })
  end
end, false)

RegisterCommand('sheriff', function(source, args, rawCommand)
  local xPlayer = QBCore.Functions.GetPlayer(source)
  local toSay = table.concat(args, ' ')

  if xPlayer.PlayerData.job.name == 'sheriff' then 
  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(180, 61, 34, 1); border-radius: 10px;"><i class="fas fa-star"></i> Sheriff: {0}</div>',
        args = {toSay}
    })
else 
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-exclamation"></i>  You need to work in sheriff to use /sheriff <i class="fas fa-exclamation"></i></div>',
    args = {}
  })
end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
  local xPlayer = QBCore.Functions.GetPlayer(source)
  local toSay = table.concat(args, ' ')

  if xPlayer.PlayerData.job.name == 'ambulance' then 
  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(255, 0, 0, 1); border-radius: 10px;"><i class="fas fa-ambulance"></i> Ambulance: {0}</div>',
        args = {toSay}
    })
else 
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-exclamation"></i>  You need to work in ambulance to use /ems <i class="fas fa-exclamation"></i></div>',
    args = {}
  })
end
end, false)
