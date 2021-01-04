FXCore = nil

if Config.UseESX then
	TriggerEvent('FXCore:GetObject', function(obj) FXCore = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = FXCore.Functions.GetPlayer(source)
		local amount = Round(price)

		if price > 0 then
			xPlayer.Functions.RemoveMoney("cash",amount)
		end
	end)
end
Round = function(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end