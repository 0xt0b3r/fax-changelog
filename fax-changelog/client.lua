-------------------------------
------- Script by FAXES -------
-------------------------------
RegisterCommand('changelog', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 90000 -- ms

    TriggerEvent('changelog:display', true)

    while display do
      Citizen.Wait(1)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
        display = false
        TriggerEvent('changelog:display', false)
      end
      if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('changelog:display', false)
      end
    end
  end)
end)

RegisterNetEvent('changelog:display')
AddEventHandler('changelog:display', function(value)
  SendNUIMessage({
    type = "changelog",
    display = value
  })
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end