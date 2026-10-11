--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Wait for the shared folder to replicate before requiring from it.
ReplicatedStorage:WaitForChild("Shared")

local Environment = require(ReplicatedStorage.Shared.Environment)
local Version = require(ReplicatedStorage.Shared.Version)

print(
	string.format(
		"[FoodWars][Client] %s | code %s | schema %d | balance %d",
		Environment.describe(),
		Version.CODE_VERSION,
		Version.SCHEMA_VERSION,
		Version.BALANCE_VERSION
	)
)
