--!strict
local DevTools = game:GetService("ServerScriptService").DevTools
local MockStorage = require(DevTools.MockStorage)
local ResetPolicy = require(DevTools.ResetPolicy)

local SetupTests = {}

function SetupTests.run()
	local store = MockStorage.new()
	local initial = { coins = 25, building = { level = 1 } }
	store.Write("alice", initial)
	initial.building.level = 9
	local saved = store.Read("alice")
	assert(saved ~= nil and saved.building.level == 1, "Writes must isolate caller tables")
	saved.coins = 999
	local reloaded = store.Read("alice")
	assert(reloaded ~= nil and reloaded.coins == 25, "Reads must not mutate stored balances")
	store.Write("bob", { coins = 10 })
	store.FailNextWrite()
	local ok = pcall(function()
		store.Write("alice", { coins = 50 })
	end)
	assert(not ok, "Injected failure must be observable")
	local afterFailure = store.Read("alice")
	assert(
		afterFailure ~= nil and afterFailure.coins == 25,
		"Failed write must preserve saved data"
	)
	store.Write("alice", { coins = 50 })
	store.Reset("alice")
	assert(store.Read("alice") == nil, "Reset must remove only its key")
	local bob = store.Read("bob")
	assert(bob ~= nil and bob.coins == 10, "Reset must preserve other players")
	assert(MockStorage.new().Read("bob") == nil, "Stores must be independent")
	local allowed = { [123] = true }
	assert(ResetPolicy.canReset("development", 123, allowed), "Approved dev tester should pass")
	for _, env in { "production", "unknown", "local" } do
		assert(not ResetPolicy.canReset(env, 123, allowed), "Reset must reject non-dev universes")
	end
	assert(not ResetPolicy.canReset("development", 456, allowed), "Unapproved user must fail")
	print("[FoodWars][Tests] Mock isolation, failure recovery, and reset permissions passed")
end

return SetupTests
