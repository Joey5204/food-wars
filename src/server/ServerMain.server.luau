--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Version = require(ReplicatedStorage.Shared.Version)

print(string.format(
	"[FoodWars][Server] code %s | schema %d | balance %d",
	Version.CODE_VERSION,
	Version.SCHEMA_VERSION,
	Version.BALANCE_VERSION
))