--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Version = require(Shared:WaitForChild("Version") :: ModuleScript) :: any

print(string.format(
	"[FoodWars][Client] code %s | schema %d | balance %d",
	Version.CODE_VERSION,
	Version.SCHEMA_VERSION,
	Version.BALANCE_VERSION
))