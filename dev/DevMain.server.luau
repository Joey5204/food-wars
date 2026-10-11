--!strict
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local Environment = require(game:GetService("ReplicatedStorage").Shared.Environment)
local Config = require(script.Parent.DevConfig)
local ResetPolicy = require(script.Parent.ResetPolicy)
local MockStorage = require(script.Parent.MockStorage)

if not Environment.allowsDevTools() then
	warn("[FoodWars][Dev] Test tools disabled outside local/development")
	return
end

local store = MockStorage.new()

local function register(player: Player)
	player.Chatted:Connect(function(message: string)
		if message ~= "/fw-reset-mock" and message ~= "/fw-test-setup" then
			return
		end
		if not ResetPolicy.canReset(Environment.get(), player.UserId, Config.ResetUserIds) then
			warn("[FoodWars][Dev] Command denied for user " .. player.UserId)
			return
		end
		if message == "/fw-test-setup" then
			local tests = require(ServerStorage.DevTests.SetupTests)
			tests.run()
			return
		end
		store.Reset(tostring(player.UserId))
		print("[FoodWars][Dev] Reset session mock record for user " .. player.UserId)
	end)
end

Players.PlayerAdded:Connect(register)
for _, player in Players:GetPlayers() do
	register(player)
end

print("[FoodWars][Dev] Tools ready; setup tests run only on an approved tester's request")
