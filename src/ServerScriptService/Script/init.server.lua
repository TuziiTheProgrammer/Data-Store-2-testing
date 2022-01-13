local DataStore2 = require(script.MainModule)

local default_value = 100

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:wait()
	local char = plr.Character
	
	local keyMoney = DataStore2("Money", plr)
	
	local folder = Instance.new("Folder", plr); folder.Name = "Stuff"
	
	local IntValue = Instance.new("IntValue", folder); IntValue.Name = "MoneyValue"
	
	local function updateMoney(updated)
		game.ReplicatedStorage.RemoteEvents.CurrencyUpdate:FireClient(plr, updated)
	end
	print(updateMoney(keyMoney:Get(default_value)))
	keyMoney:OnUpdate(updateMoney)
end)

--[[

for _, thing in pairs(game:GetService("CollectionService"):GetTagged("Money"))do
	if thing.Color == Color3.fromRGB(52, 142, 64) then
		thing.ClickDetector.MouseClick:connect(function(plr)
			local keyMoney = DataStore("Money", plr)
			keyMoney:Set(default_value)
		end)
	else
		thing.ClickDetector.MouseClick:connect(function(plr)
			local keyMoney = DataStore("Money", plr)
			keyMoney:Increment(50)
		end)
	end
end

--]]

local co = coroutine.wrap(function()
	while wait(1)do
		for _, thing in pairs(game:GetService("Players"):GetChildren()) do
			local keyMoney = DataStore2("Money", thing)
			keyMoney:Increment(3, default_value)
		end
	end
end)()