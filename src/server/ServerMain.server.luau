--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Environment = require(ReplicatedStorage.Shared.Environment)
local Version = require(ReplicatedStorage.Shared.Version)

print(
	string.format(
		"[FoodWars][Server] %s | code %s | schema %d | balance %d",
		Environment.describe(),
		Version.CODE_VERSION,
		Version.SCHEMA_VERSION,
		Version.BALANCE_VERSION
	)
)
