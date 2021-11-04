ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('trojen-npcdoctor:money1')
AddEventHandler('trojen-npcdoctor:money1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeMoney(Config.doctorPrice)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '$'.. Config.doctorPrice ..' karşılığında yerli doktora tedavi oldun'})

end)
RegisterServerEvent('trojen-plasticsurgery:skin')
AddEventHandler('trojen-plasticsurgery:skin', function()
    
    TriggerClientEvent('esx_skin:openSaveableMenu', source)
end)
ESX.RegisterServerCallback('trojen-npcdoctor:parakontrol1', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.getMoney() >= Config.doctorPrice)
end)

