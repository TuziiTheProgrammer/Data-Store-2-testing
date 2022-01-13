local rep = game.ReplicatedStorage
local label = script.Parent


rep.RemoteEvents.CurrencyUpdate.OnClientEvent:Connect(function(money)
	label.Text = money
end)



